local controlling = false
local controllingEntity = nil
local interactionUp = false
local grabLoop = false
local listening = false
local grabbed = false

local function listenForKeyPress(ck, cb, entity)
    if listening then return end
    listening = true
    Citizen.CreateThread(function()
        while listening do
            if IsControlJustReleased(0, ck) then
                controlling = false
                listening = false
                cb(entity)
            end
            Wait(0)
        end
    end)
end

local function release(entity)
    grabbed = false
    exports["ab-ui"]:hideInteraction("success")
    ClearPedTasksImmediately(PlayerPedId())
    NetworkRequestControlOfEntity(entity)
    Citizen.Wait(500)
    ClearPedTasksImmediately(entity)
    Citizen.Wait(0)
    DetachEntity(PlayerPedId(), true, false)
    DetachEntity(entity, true, false)
    Citizen.Wait(0)
    ClearPedTasksImmediately(PlayerPedId())
    ClearPedTasksImmediately(entity)
    SetBlockingOfNonTemporaryEvents(entity, false)
    SetEntityInvincible(entity, 0)
    -- SetEntityCollision(entity, 1, 1)
    TaskReactAndFleePed(entity, PlayerPedId())
    if IsEntityDead(entity) or IsPedDeadOrDying(entity) then
        Sync.DeleteEntity(entity)
    end
end

local function grab(entity)
    if grabbed then return end
    grabbed = true
    lib = "anim@gangops@hostage@"
    anim1 = "perp_idle"
    anim2 = "victim_idle"
    distans = 0.11 --Higher = closer to camera
    distans2 = -0.24 --higher = left
    height = 0.0
    spin = 0.0		
    length = 100000
    controlFlagMe = 49
    controlFlagTarget = 49
    animFlagTarget = 50
    attachFlag = true

    DecorSetBool(entity, 'ScriptedPed', true)

    RequestAnimDict(lib)
    while not HasAnimDictLoaded(lib) do
        Citizen.Wait(0)
    end

    ClearPedTasks(PlayerPedId())
    ClearPedSecondaryTask(PlayerPedId())
    ClearPedTasksImmediately(PlayerPedId())
    ClearPedTasks(entity)
    ClearPedSecondaryTask(entity)
    ClearPedTasksImmediately(entity)
    SetPedSeeingRange(entity, 0.0)
    SetPedHearingRange(entity, 0.0)
    SetPedFleeAttributes(entity, 0, false)
    SetEntityInvincible(entity, 1)
    -- SetEntityCollision(entity, 0, 1)
    Wait(0)
    AttachEntityToEntity(entity, PlayerPedId(), 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
    Wait(0)
    TaskPlayAnim(PlayerPedId(), lib, anim1, 8.0, -8.0, length, 50, 0, false, false, false)
    TaskPlayAnim(entity, lib, anim2, 8.0, -8.0, length, 17, 0, false, false, false)
    Wait(0)

    Citizen.CreateThread(function()
        while grabbed do
            if not IsEntityPlayingAnim(PlayerPedId(), lib, anim1, 3) then
                TaskPlayAnim(PlayerPedId(), lib, anim1, 8.0, -8.0, length, 50, 0, false, false, false)
            end
            if not IsEntityPlayingAnim(entity, lib, anim2, 3) then
                TaskPlayAnim(entity, lib, anim2, 8.0, -8.0, length, 17, 0, false, false, false)
            end
            Citizen.Wait(250)
        end
    end)

    Citizen.CreateThread(function()
        while grabbed do
            DisableControlAction(0, 21, true) -- disable sprint
            DisableControlAction(0, 22, true) -- disable jump
            DisableControlAction(0, 24, true) -- disable attack
            DisableControlAction(0, 25, true) -- disable aim
            DisableControlAction(0, 47, true) -- disable weapon
            DisableControlAction(0, 58, true) -- disable weapon
            DisablePlayerFiring(PlayerPedId(), true)
            Citizen.Wait(0)
        end
    end)

    Citizen.CreateThread(function()
        while grabbed do
            TriggerEvent("client:newStress", true, 50, true)
            Citizen.Wait(5000)
        end
    end)

    Wait(2000)
    exports["ab-ui"]:showInteraction("[F] Release!", "success")
    listenForKeyPress(23, release, entity)
end

local function showInteraction()
    if not interactionUp then
        interactionUp = true
        listenForKeyPress(58, grab, controllingEntity)
        exports["ab-ui"]:showInteraction("[G] Grab!", "error")
    end
end
local function hideInteraction()
    if interactionUp then
        listening = false
        interactionUp = false
        exports["ab-ui"]:hideInteraction("error")
    end
end
local function controlPed(entity)
    controlling = true
    controllingEntity = entity

    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), false)
    SetBlockingOfNonTemporaryEvents(entity, true)
    TaskSetBlockingOfNonTemporaryEvents(entity, true)

    local offset = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
    TaskGoStraightToCoord(entity, offset, 0.5, -1, 0, 0)
    if not IsEntityPlayingAnim(entity, "missfbi5ig_22", "hands_up_anxious_scientist", 3) then
        TaskPlayAnim(entity, "missfbi5ig_22", "hands_up_anxious_scientist", 8.0, 1.0, -1, 50, -1, false, false, false)
    end

    if grabLoop then return end
    grabLoop = true
    Citizen.CreateThread(function()
        while controlling do
            if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(entity)) < 3.0 then
                showInteraction()
            else
                hideInteraction()
            end
            Citizen.Wait(250)
        end
        hideInteraction()
        grabLoop = false
    end)
end

local function isWeaponPistol()
    local pistols = {
        [453432689] = true,
        [-1075685676] = true,
        [1593441988] = true,
        [-120179019] = true,
        [2578377531] = true,
        [-1716589765] = true,
    }
    return pistols[GetSelectedPedWeapon(PlayerPedId())] == true
end

local inCasino = false
AddEventHandler("ab-casino:casinoEnteredEvent", function() inCasino = true end)
AddEventHandler("ab-casino:casinoExitedEvent", function() inCasino = false end)

Citizen.CreateThread(function()
    -- ClearPedTasksImmediately(PlayerPedId())
    -- DetachEntity(PlayerPedId(), true, false)
    local lastEntity = nil
    local isNPC = false
    while true do
        local ply = PlayerId()
        local aiming, entity = GetEntityPlayerIsFreeAimingAt(ply)
        local freeAiming = IsPlayerFreeAiming(ply)

        if freeAiming
            and entity ~= 0
            and (GetPedType(entity) == 4 or GetPedType(entity) == 5)
            and not (IsEntityDead(entity) or IsPedDeadOrDying(entity))
            and not IsPedAPlayer(entity)
            and not IsPedInAnyVehicle(entity, true)
            and not IsPedInAnyVehicle(PlayerPedId(), true)
            and not IsPedRagdoll(entity)
            and not IsPedArmed(entity, 7)
            and (not IsPedFleeing(entity) or math.random() > 0.75)
            and #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(entity)) < 8.0
            --and not StoreIsManager(entity)
            and not inCasino
            and not DecorGetBool(entity, 'ScriptedPed')
            and isWeaponPistol()
        then
            NetworkRequestControlOfEntity(entity)
            Citizen.Wait(0)
            RequestAnimDict("missfbi5ig_22")
            while not HasAnimDictLoaded("missfbi5ig_22") do
                Citizen.Wait(0)
            end

            if lastEntity ~= entity then
                local flags = exports["ab-flags"]:GetPedFlags(entity)
                isNPC = (flags and flags.isNPC or false)
                lastEntity = entity
            end

            if not isNPC and NetworkRequestControlOfEntity(entity) then
                controlPed(entity)
            end

        elseif controlling then
            SetBlockingOfNonTemporaryEvents(controllingEntity, false)
            ClearPedTasksImmediately(controllingEntity)
            Citizen.Wait(0)
            controlling = false
            controllingEntity = nil
        end
        Citizen.Wait(500)
    end
end)
