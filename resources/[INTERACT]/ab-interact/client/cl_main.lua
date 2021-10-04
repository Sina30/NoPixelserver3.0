local PeekEntries = { ['model'] = {}, ['flag'] = {}, ['entity'] = {}, ['polytarget'] = {} }

CurrentZones, CurrentTarget, CurrentTargetType, IsPeeking, IsPeakActive = {}, nil, nil, false, false

EntryCount, ListCount, UpdateRequired, RefreshingList = 0, 0, false, false

local function convertNpcIds(npcIds)
    if npcIds == nil then return nil end
    local idHashes = {}
    for i=1, #npcIds do
        idHashes[i] = GetHashKey(npcIds[i])
    end
    return idHashes
end

local function hasNpcId(entity, npcIds)
    if npcIds == nil then return true end
    for i=1, #npcIds do
        if DecorGetInt(entity, "NPC_ID") == npcIds[i] then
            return true
        end
    end
    return false
end

function AddPeekEntry(pType, pGroup, pData, pOptions)
    local entries = PeekEntries[pType]

    if not entries then return error(pType .. ' Is not a valid Peek Type') end

    local addEntry = function(group, data, options)
        options.npcIds = convertNpcIds(options.npcIds)
        if not entries[group] then entries[group] = {} end

        local groupEntries = entries[group]

        for _, entry in ipairs(data) do
            if not entry.id then error('Missing ID in entry for '.. group) end

            EntryCount = EntryCount + 1

            entry.index = EntryCount

            groupEntries[entry.id] = { data = entry, options = options }
        end
    end

    if type(pGroup) ~= 'table' then
        addEntry(pGroup, pData, pOptions)
        return RefreshPeekList()
    end

    for _, group in ipairs(pGroup) do
        addEntry(group, pData, pOptions)
    end

    RefreshPeekList()
end

exports('AddPeekEntry', AddPeekEntry)

function AddPeekEntryByModel(pModel, pData, pOptions)
    AddPeekEntry('model', pModel, pData, pOptions)
end

exports('AddPeekEntryByModel', AddPeekEntryByModel)

function AddPeekEntryByFlag(pFlag, pData, pOptions)
    AddPeekEntry('flag', pFlag, pData, pOptions)
end

exports('AddPeekEntryByFlag', AddPeekEntryByFlag)

function AddPeekEntryByEntityType(pEntityType, pData, pOptions)
    AddPeekEntry('entity', pEntityType, pData, pOptions)
end

exports('AddPeekEntryByEntityType', AddPeekEntryByEntityType)

function AddPeekEntryByPolyTarget(pEvent, pData, pOptions)
    AddPeekEntry('polytarget', pEvent, pData, pOptions)
end

exports('AddPeekEntryByPolyTarget', AddPeekEntryByPolyTarget)

function RefreshPeekList()
    if RefreshingList then return end

    RefreshingList = true

    Citizen.SetTimeout(250, function()
        local entries = {}

        for _, groups in pairs(PeekEntries) do
            for _, group in pairs(groups) do
                for id, entry in pairs(group) do
                    entries[id] = entry.data
                end
            end
        end

        RefreshingList = false

        exports["ab-ui"]:sendAppEvent('eye', {
            action = "refresh",
            payload = entries or {}
        })
    end)
end

function UpdatePeekEntryList(pEntries)
    local active = IsActive(pEntries)

    if not IsPeakActive and active then
        IsPeakActive = true
    elseif IsPeakActive and not active then
        IsPeakActive = false
    end

    exports["ab-ui"]:sendAppEvent('eye', {
        action = "update",
        payload = { active = IsPeakActive, options = pEntries }
    })
end

function GetCurrentPeekEntryList()
    local entity, context = CurrentTarget, GetEntityContext(CurrentTarget)

    ListCount = ListCount + 1

    local listId, entries, tracked = ListCount, {}, {}

    local addEntry = function(pId, pEntry, pContext, pRelated)
        local data, options = pEntry.data, pEntry.options

        if options.job then
            local hasJob = false

            for _, job in ipairs(options.job) do
                if job == CurrentJob or job == myJob then
                    hasJob = true
                    break
                end
            end

            if not hasJob then return end
        end

        if options.npcIds then
            if not hasNpcId(entity, options.npcIds) then return end
        end

        local hasChecks = options.isEnabled or options.distance

        entries[pId] = not hasChecks

        if not hasChecks then return end

        if options.distance and pContext.zones[pRelated] then
            options.distance.zone = pRelated
        end

        tracked[pId] = options
    end

    if CurrentTarget then
        if PeekEntries['model'][context.model] then
            for id, entry in pairs(PeekEntries['model'][context.model]) do
                addEntry(id, entry, context, entity)
            end
        end

        for flag, active in pairs(context.flags) do
            if active and PeekEntries['flag'][flag] then
                for id, entry in pairs(PeekEntries['flag'][flag]) do
                    addEntry(id, entry, context, entity)
                end
            end
        end

        if PeekEntries['entity'][context.type] then
            for id, entry in pairs(PeekEntries['entity'][context.type]) do
                addEntry(id, entry, context, entity)
            end
        end
    end

    for zoneName, zone in pairs(CurrentZones) do
        if zone then
            context.zones[zoneName] = zone.data

            if PeekEntries['polytarget'][zoneName] then
                for id, entry in pairs(PeekEntries['polytarget'][zoneName]) do
                    addEntry(id, entry, context, zoneName)
                end
            end
        end
    end

    StartTrackerThread(listId, entries, tracked, context)

    return entries, context
end

function StartTrackerThread(pTrackerId, pEntries, pTracked, pContext)
    local entity = CurrentTarget or 0
    local playerPed = PlayerPedId()

    local bones, normal, zones = {}, {}, {}

    local entries, updateRequired = pEntries, true

    for id, options in pairs(pTracked) do
        local distance = options.distance

        local visible, callbacks = false, normal

        if distance and distance.boneId then
            local bone = distance.boneId
            local boneIndex = type(bone) == 'string' and GetEntityBoneIndexByName(entity, bone) or GetPedBoneIndex(entity, bone)

            if not bones[boneIndex] then bones[boneIndex] = {} end

            callbacks = bones[boneIndex]
        elseif distance and distance.zone then
            if not zones[distance.zone] then zones[distance.zone] = {} end

            callbacks = zones[distance.zone]
        end

        callbacks[#callbacks + 1] = function(pDistance)
            local inRange = not distance or pDistance <= distance.radius
            local isEnabled = inRange and (not options.isEnabled or options.isEnabled(entity, pContext))

            if inRange and isEnabled and not visible then
                visible = true
                updateRequired = true
                entries[id] = true
            elseif not inRange or not isEnabled and visible then
                visible = false
                updateRequired = true
                entries[id] = false
            end
        end
    end

    Citizen.CreateThread(function()
        while IsPeeking and ListCount == pTrackerId do
            local playerCoords = GetEntityCoords(playerPed)

            if entity then
                for boneIndex, callbacks in pairs(bones) do
                    local targetCoords = GetWorldPositionOfEntityBone(entity, boneIndex)
                    local targetDistance = #(playerCoords - targetCoords)

                    for _, callback in ipairs(callbacks) do
                        callback(targetDistance)
                    end
                end

                if #normal > 0 then
                    local targetCoords = GetEntityCoords(entity)
                    local targetDistance = #(playerCoords - targetCoords)

                    for _, callback in ipairs(normal) do
                        callback(targetDistance)
                    end
                end
            end

            for zoneId, callbacks in pairs(zones) do
                local zone = CurrentZones[zoneId]
                local targetDistance = not zone and 9999.9 or #(playerCoords - zone.vectors)

                for _, callback in ipairs(callbacks) do
                    callback(targetDistance)
                end
            end

            if updateRequired then
                updateRequired = false
                UpdatePeekEntryList(entries)
            end

            Citizen.Wait(150)
        end
    end)
end

function IsActive(pEntries)
    if not pEntries then return end

    for _, active in pairs(pEntries) do
        if active then return true end
    end

    return false
end

function StartPeekin()
    if IsPeeking then return end
    if IsPedArmed(PlayerPedId(), 6) then return end

    local entries, context

    IsPeeking = true
    UpdateRequired = true

    Citizen.CreateThread(function()
        while IsPeeking do
            DisablePlayerFiring(PlayerPedId(), true)

            if UpdateRequired then
                UpdateRequired = false
                entries, context = GetCurrentPeekEntryList()
            end

            if IsPeakActive and (IsControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 24)) then
                SetCursorLocation(0.5, 0.5)

                exports["ab-ui"]:openApplication("eye", {
                    action = "interact",
                    payload = { active = true, display = true, context = context, entity = CurrentTarget }
                })
            end

            Citizen.Wait(0)
        end
    end)

    exports["ab-ui"]:sendAppEvent('eye', { action = "peek", payload = { display = true, active = false } })
end

function StopPeekin()
    if not IsPeeking then return end

    IsPeeking = false

    exports["ab-ui"]:sendAppEvent('eye', {
        action = "peek",
        payload = { display = false, active = false}
    })
end

function CanSellOrBuyCar(pEntity, pSell)
  local vehicleOwner = getVehicleOwner(pEntity)

  if pSell and vehicleOwner == 2 then return true end
  if not pSell and vehicleOwner ~= 2 and vehicleOwner ~= -1 then return true end

  return false
end


AddEventHandler("np:target:changed", function(pTarget, pEntityType, pEntityOffset)
    CurrentTarget = pTarget
    CurrentTargetType = pEntityType
    CurrentTargetOffset = pEntityOffset

    UpdateRequired = true
end)

AddEventHandler('ab-polyzone:enter', function(zoneName, zoneData, zoneCenter)
    if not PeekEntries['polytarget'][zoneName] then return end

    CurrentZones[zoneName] = { data = zoneData, vectors = zoneCenter }

    if not IsPeeking then return end

    UpdateRequired = true
end)

AddEventHandler('ab-polyzone:exit', function(zoneName)
    if not PeekEntries['polytarget'][zoneName] then return end

    CurrentZones[zoneName] = nil

    UpdateRequired = true
end)

RegisterUICallback("ab-ui:targetSelectOption", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })

    IsPeeking = false

    exports["ab-ui"]:closeApplication("eye")

    Wait(100)

    local option = data.option
    local context = data.context or {}

    local event = option.event
    local target = data.entity or 0
    local parameters = option.parameters or {}

    TriggerEvent(event, parameters, target, context)
end)

AddEventHandler('ab-ui:phoneReady', function()
    RefreshPeekList()
end)

-- RegisterCommand('+targetInteract', StartPeekin, false)

-- RegisterCommand('-targetInteract', StopPeekin, false)

-- Citizen.CreateThread(function()
--     exports["ab-binds"]:registerKeyMapping("", "Player", "Peek at Target", "+targetInteract", "-targetInteract", "LMENU")
-- end)


Citizen.CreateThread(function()
    RegisterKeyMapping("+targetInteract", "Player Targeting", "keyboard", "LMENU") --Removed Bind System and added standalone version
    RegisterCommand('+targetInteract', StartPeekin, false)
    RegisterCommand('-targetInteract', StopPeekin, false)
    TriggerEvent("chat:removeSuggestion", "/+targetInteract")
    TriggerEvent("chat:removeSuggestion", "/-targetInteract")
end)
