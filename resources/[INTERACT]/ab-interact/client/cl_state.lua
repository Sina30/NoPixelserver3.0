cuffStates = {}

isEscorting = false
hasOxygenTankOn = false
isHandcuffed = false
isHandcuffedAndWalking = false

polyChecks = {
    vanillaUnicorn = { isInside = false, data = nil },
    gasStation = { isInside = false, data = nil },
    bennys = { isInside = false, data = nil },
    townhallCourtGavel = { isInside = false, data = nil },
    prison = { isInside = false, data = nil },
    ottosAuto = { isInside = false, data = nil }
}

CurrentJob = 'unemployed'
myJob = "unemployed"

isDoc = false
isPolice = false
isMedic = false
isDead = false
isJudge = false
isDoctor = false
isNews = false
isInstructorMode = false

currentlyRentedBoat = nil

function IsDisabled()
    return isDead or isHandcuffed or isHandcuffedAndWalking
end

function GetPedContext(pEntity, pContext)
    local npcId = DecorGetInt(pEntity, 'NPC_ID')

    if pContext.flags['isJobEmployer'] then
        pContext.job = exports['ab-jobs']:GetNPCJobData(npcId)
    end
end

function GetEntityContext(pEntity, pEntityType, pEntityModel)
    local context = { flags = {}, model = nil, type = nil, isDead = nil, zones = {} }

    if not pEntity then return context end

    context.type = pEntityType or GetEntityType(pEntity)
    context.model = pEntityModel or GetEntityModel(pEntity)
    context.isDead = IsEntityDead(pEntity)

    if context.type == 1 then
        context.flags = exports['ab-flags']:GetPedFlags(pEntity)
        context.flags['isPlayer'] = IsPedAPlayer(pEntity)
        if context.flags['isNPC'] then GetPedContext(pEntity, context) end
    elseif context.type == 2 then
        context.flags = exports['ab-flags']:GetVehicleFlags(pEntity)
    elseif context.type == 3 then
        context.flags = exports['ab-flags']:GetObjectFlags(pEntity)
    end

    if ModelFlags[context.model] then
        for _, flag in ipairs(ModelFlags[context.model]) do
            context.flags[flag] = true
        end
    end

    return context
end

exports('GetEntityContext', GetEntityContext)

function GetBoneDistance(pEntity, pType, pBone)
    local bone

    if pType == 1 then
        bone = GetPedBoneIndex(pEntity, pBone)
    else
        bone = GetEntityBoneIndexByName(pEntity, pBone)
    end

    local boneCoords = GetWorldPositionOfEntityBone(pEntity, bone)
    local playerCoords = GetEntityCoords(PlayerPedId())

    return #(boneCoords - playerCoords)
end

exports("GetBoneDistance", GetBoneDistance)

function HasWeaponEquipped(pWeaponHash)
    return GetSelectedPedWeapon(PlayerPedId()) == pWeaponHash
end

function isDeveloperMode()
    return GetConvar("sv_environment", "prod") == "debug"
end

function IsMenuWanted(pMenu, pEntity)
    return pMenu == 'general' or pMenu == 'peds' and pEntity == 1 or pMenu == 'vehicles' and pEntity == 2 or pMenu == 'objects' and pEntity == 3 or pMenu =='news' and isNews or pMenu == 'k9' and isPolice or pMenu == 'judge' and isJudge
end

function isPersonBeingHeldUp(pEntity)
  return (IsEntityPlayingAnim(pEntity, "dead", "dead_a", 3) or IsEntityPlayingAnim(pEntity, "amb@code_human_cower_stand@male@base", "base", 3) or IsEntityPlayingAnim(pEntity, "amb@code_human_cower@male@base", "base", 3) or IsEntityPlayingAnim(pEntity, "random@arrests@busted", "idle_a", 3) or IsEntityPlayingAnim(pEntity, "mp_arresting", "idle", 3) or IsEntityPlayingAnim(pEntity, "random@mugging3", "handsup_standing_base", 3) or IsEntityPlayingAnim(pEntity, "missfbi5ig_22", "hands_up_anxious_scientist", 3) or IsEntityPlayingAnim(pEntity, "missfbi5ig_22", "hands_up_loop_scientist", 3) or IsEntityPlayingAnim(pEntity, "missminuteman_1ig_2", "handsup_base", 3))
end

function getTrunkOffset(pEntity)
  local minDim, maxDim = GetModelDimensions(GetEntityModel(pEntity))
  return GetOffsetFromEntityInWorldCoords(pEntity, 0.0, minDim.y - 0.5, 0.0)
end

function getFrontOffset(pEntity)
    local minDim, maxDim = GetModelDimensions(GetEntityModel(pEntity))
    return GetOffsetFromEntityInWorldCoords(pEntity, 0.0, maxDim.y + 0.5, 0.0)
  end

function isCloseToTrunk(pEntity, pPlayerPed, pDistance, pMustBeOpen)
  return #(getTrunkOffset(pEntity) - GetEntityCoords(pPlayerPed)) <= (pDistance or 1.0) and GetVehicleDoorLockStatus(pEntity) == 1 and (not pMustBeOpen or GetVehicleDoorAngleRatio(pEntity, 5) >= 0.1)
end

function isCloseToHood(pEntity, pPlayerPed, pDistance, pMustBeOpen)
    return #(getFrontOffset(pEntity) - GetEntityCoords(pPlayerPed)) <= (pDistance or 1.0) and GetVehicleDoorLockStatus(pEntity) == 1 and (not pMustBeOpen or GetVehicleDoorAngleRatio(pEntity, 4) >= 0.1)
end

local ModelData = {}

function GetModelData(pEntity, pModel)
    if ModelData[pModel] then return ModelData[pModel] end

    local modelInfo = {}

    local coords = getTrunkOffset(pEntity)
    local boneCoords, engineCoords = GetWorldPositionOfEntityBone(pEntity, GetEntityBoneIndexByName(pEntity, 'engine'))

    if #(boneCoords - coords) <= 2.0 then
        engineCoords = coords
        modelInfo = { engine = { position = 'trunk', door = 4 }, trunk = { position = 'front', door = 5 } }
    else
        engineCoords = getFrontOffset(pEntity)
        modelInfo = { engine = { position = 'front', door = 4 }, trunk = { position = 'trunk', door = 5 } }
    end

    local hasBonnet = DoesVehicleHaveDoor(pEntity, 4)
    local hasTrunk = DoesVehicleHaveDoor(pEntity, 5)

    if hasBonnet then
        local bonnetCoords = GetWorldPositionOfEntityBone(pEntity, GetEntityBoneIndexByName(pEntity, 'bonnet'))
        
        if #(engineCoords - bonnetCoords) <= 2.0 then
            modelInfo.engine.door = 4
            modelInfo.trunk.door = hasTrunk and 5 or 3
        elseif hasTrunk then
            modelInfo.engine.door = 5
            modelInfo.trunk.door = 4
        end
    elseif hasTrunk then
        local bootCoords = GetWorldPositionOfEntityBone(pEntity, GetEntityBoneIndexByName(pEntity, 'boot'))

        if #(engineCoords - bootCoords) <= 2.0 then
            modelInfo.engine.door = 5
        end
    end

    ModelData[pModel] = modelInfo

    return modelInfo
end

function isCloseToEngine(pEntity, pPlayerPed, pDistance, pModel)
    local model = pModel or GetEntityModel(pEntity)
    local modelData = GetModelData(pEntity, model)

    local playerCoords = GetEntityCoords(pPlayerPed)

    local engineCoords = modelData.engine.position == 'front' and getFrontOffset(pEntity) or getTrunkOffset(pEntity)

    return #(engineCoords - playerCoords) <= pDistance
end

function isCloseToBoot(pEntity, pPlayerPed, pDistance, pModel)
    local model = pModel or GetEntityModel(pEntity)
    local modelData = GetModelData(pEntity, model)

    local playerCoords = GetEntityCoords(pPlayerPed)

    local engineCoords = modelData.trunk.position == 'front' and getFrontOffset(pEntity) or getTrunkOffset(pEntity)

    return #(engineCoords - playerCoords) <= pDistance
end

local CachedEntity, CachedEngineDoor, CachedTrunkDoor = nil, nil, nil

function getEngineDoor(pEntity, pModel)
    if CachedEntity == pEntity and CachedEngineDoor then return CachedEngineDoor end

    local model = pModel or GetEntityModel(pEntity)
    local modelData = GetModelData(pEntity, model)

    CachedEntity, CachedEngineDoor = pEntity, modelData.engine.door

    return modelData.engine.door
end

function getTrunkDoor(pEntity, pModel)
    if CachedEntity == pEntity and CachedTrunkDoor then return CachedTrunkDoor end

    local model = pModel or GetEntityModel(pEntity)
    local modelData = GetModelData(pEntity, model)

    CachedEntity, CachedTrunkDoor = pEntity, modelData.trunk.door

    return modelData.trunk.door
end

function isVehicleDoorOpen(pEntity, pDoor)
    return GetVehicleDoorAngleRatio(pEntity, pDoor) >= 0.1
end

function canRefuelHere(pEntity, pPolyZoneData)
    local vehicleClass = GetVehicleClass(pEntity)
    if (pPolyZoneData and pPolyZoneData.vehicleClassRequirement == vehicleClass) then
        return true
    elseif pPolyZoneData and not pPolyZoneData.vehicleClassRequirement and vehicleClass ~= 15 and vehicleClass ~= 16 and GetBoneDistance(pEntity, 2, 'wheel_lr') <= 1.2  then
        return true
    end
    return false
end

local HasKeysCache = {}
local HasJobPermission = {}
local VehicleOwnerShipCache = {}

function hasKeys(pEntity)
    if HasKeysCache[pEntity] then return HasKeysCache[pEntity] end

    local hasKeys = exports['ab-keys']:hasKey(pEntity)

    HasKeysCache[pEntity] = hasKeys

    return hasKeys
end

function hasJobPermission(pJob, pPermission)
  if not pPermission then
    pPermission = "employee"
  end

  if HasJobPermission[pJob] and HasJobPermission[pJob][pPermission] ~= nil then return HasJobPermission[pJob][pPermission] end

  local hasJobPermission = function()
    if pPermission == "employee" then
      local characterId = exports["isPed"]:isPed("cid")
      return RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = pJob }})
    else
      return RPC.execute('ab-business:hasPermission', pJob, pPermission)
    end
  end

  local hasPerm = hasJobPermission()
  
  if not HasJobPermission[pJob] then HasJobPermission[pJob] = {} end

  HasJobPermission[pJob][pPermission] = hasPerm
  return hasPerm
end

RegisterNetEvent("ab-interact:bustVehicleOwnerShipCache", function(pEntity)
  VehicleOwnerShipCache[pEntity] = nil
end)

function getVehicleOwner(pEntity)
  if VehicleOwnerShipCache[pEntity] ~= nil then return VehicleOwnerShipCache[pEntity] end
  local vin = exports['ab-vehicles']:GetVehicleIdentifier(pEntity)
  local vehicleOwner = RPC.execute("ab-ottosauto:getVehicleOwner", vin)
  VehicleOwnerShipCache[pEntity] = vehicleOwner
  return vehicleOwner
end


RegisterNetEvent("menu:setCuffState")
AddEventHandler("menu:setCuffState", function(pTargetId, pState)
    cuffStates[pTargetId] = pState
end)

RegisterNetEvent("isJudge")
AddEventHandler("isJudge", function()
    isJudge = true
end)

RegisterNetEvent("isJudgeOff")
AddEventHandler("isJudgeOff", function()
    isJudge = false
end)

RegisterNetEvent("ab-jobmanager:playerBecameJob")
AddEventHandler("ab-jobmanager:playerBecameJob", function(job, name, notify)
    if isMedic and job ~= "ems" then isMedic = false end
    if isPolice and job ~= "police" then isPolice = false end
    if isDoc and job ~= "doc" then isDoc = false end
    if isDoctor and job ~= "doctor" then isDoctor = false end
    if isNews and job ~= "news" then isNews = false end
    if job == "police" then isPolice = true end
    if job == "ems" then isMedic = true end
    if job == "news" then isNews = true end
    if job == "doctor" then isDoctor = true end
    if job == "doc" then isDoc = true end
    myJob = job
end)

RegisterNetEvent('ab-jobs:jobChanged')
AddEventHandler('ab-jobs:jobChanged', function(pJobId)
    CurrentJob = pJobId

    HasKeysCache = {}
    HasJobPermission = {}
end)

AddEventHandler("playerSpawned", function()
  HasJobPermission = {}
  VehicleOwnerShipCache = {}
end)

RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end

    HasKeysCache = {}
    HasJobPermission = {}
end)

RegisterNetEvent("drivingInstructor:instructorToggle")
AddEventHandler("drivingInstructor:instructorToggle", function(mode)
    isInstructorMode = mode
end)

RegisterNetEvent("police:currentHandCuffedState")
AddEventHandler("police:currentHandCuffedState", function(pIsHandcuffed, pIsHandcuffedAndWalking)
    isHandcuffedAndWalking = pIsHandcuffedAndWalking
    isHandcuffed = pIsHandcuffed
end)

RegisterNetEvent("menu:hasOxygenTank")
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)

RegisterNetEvent('dr:escortingEnabled')
AddEventHandler('dr:escortingEnabled', function()
    isEscorting = true
end)

RegisterNetEvent('dr:releaseEscort')
AddEventHandler('dr:releaseEscort', function()
    isEscorting = false
end)

AddEventHandler("ab-polyzone:enter", function(zone, data)
    if zone == "ab-jobs:impound:dropOff" then IsImpoundDropOff = true end
    if zone == "vanilla_unicorn_stage" then polyChecks.vanillaUnicorn = { isInside = true, polyData = data } end
    if zone == "gas_station" then polyChecks.gasStation = { isInside = true, polyData = data } end
    if zone == "bennys" then
        local plyPed = PlayerPedId()

        if data and data.type == "boats" and not IsPedInAnyBoat(plyPed) then
            return
        end
        if data and data.type == "planes" and not (IsPedInAnyPlane(plyPed) or IsPedInAnyHeli(plyPed)) then
            return
        end

        polyChecks.bennys = { isInside = true, polyData = data }
    end
    if zone == "townhall_court_gavel" then polyChecks.townhallCourtGavel = { isInside = true, polyData = nil } end
    if zone == "prison" then polyChecks.prison = { isInside = true, polyData = nil } end
    if zone == "ottos_auto" then polyChecks.ottosAuto = { isInside = true, polyData = nil} end
end)

AddEventHandler("ab-polyzone:exit", function(zone)
    if zone == "vanilla_unicorn_stage" then polyChecks.vanillaUnicorn = { isInside = false, polyData = nil } end
    if zone == "gas_station" then polyChecks.gasStation = { isInside = false, polyData = nil } end
    if zone == "bennys" then polyChecks.bennys = { isInside = false, polyData = nil } end
    if zone == "townhall_court_gavel" then polyChecks.townhallCourtGavel = { isInside = false, polyData = nil } end
    if zone == "prison" then polyChecks.prison = { isInside = false, polyData = nil } end
    if zone == "ottos_auto" then
      polyChecks.ottosAuto = { isInside = false, polyData = nil}
      HasJobPermission["ottos_auto"] = {}
    end
end)

AddEventHandler("ab-fishing:currentlyRentedBoat", function(handle)
    currentlyRentedBoat = handle
end)
