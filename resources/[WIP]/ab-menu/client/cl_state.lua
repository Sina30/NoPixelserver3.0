CurrentJob = 'unemployed'
isJudge = false
isDoctor = false
isNews = false
isInstructorMode = false
myJob = "unemployed"
isHandcuffed = false
isHandcuffedAndWalking = false
isEscorting = false
hasOxygenTankOn = false
isAtGarage = false
cuffStates = {}

polyChecks = {
    vanillaUnicorn = { isInside = false, data = nil },
    gasStation = { isInside = false, data = nil },
    bennys = { isInside = false, data = nil },
    townhallCourtGavel = { isInside = false, data = nil },
    prison = { isInside = false, data = nil },
    police = { isInside = false, data = nil },
}

isDoc = false
isPolice = false
isMedic = false
isMayor = false
isCountyClerk = false
isDead = false

function IsDisabled()
    return isDead or isHandcuffed or isHandcuffedAndWalking
end

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
    if isMayor and job ~= "mayor" then isMayor = false end
    if isCountyClerk and job ~= "county_clerk" then isCountyClerk = false end
    if job == "police" then isPolice = true end
    if job == "ems" then isMedic = true end
    if job == "news" then isNews = true end
    if job == "doctor" then isDoctor = true end
    if job == "doc" then isDoc = true end
    if job == "mayor" then isMayor = true end
    if job == "county_clerk" then isCountyClerk = true end
    myJob = job
    CurrentJob = pJobId
end)

RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end
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
    print("isescorting")
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
    if zone == "police_station" then polyChecks.police = { isInside = true, polyData = nil } end 
end)

AddEventHandler("ab-polyzone:exit", function(zone)
    if zone == "vanilla_unicorn_stage" then polyChecks.vanillaUnicorn = { isInside = false, polyData = nil } end
    if zone == "gas_station" then polyChecks.gasStation = { isInside = false, polyData = nil } end
    if zone == "bennys" then polyChecks.bennys = { isInside = false, polyData = nil } end
    if zone == "townhall_court_gavel" then polyChecks.townhallCourtGavel = { isInside = false, polyData = nil } end
    if zone == "prison" then polyChecks.prison = { isInside = false, polyData = nil } end
    if zone == "police_station" then polyChecks.police = { isInside = false, polyData = nil } end 
end)













--- Garage Shit ---


local approvedGarages = {
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "Richman",
    "casino",
    "Repo",
    "Impound Lot",
    "Perro",
    "Police Department",
    "Pillbox",
    "Harmony",
}

local pCurrentGarage = "None"




function polyZoneEnter(zoneName, zoneData)
    currentZone = zoneName
    for k, v in pairs (approvedGarages) do
        if zoneName == v then
            pCurrentGarage = zoneName
            isAtGarage = true
            print("at this garage dawh")
        end
    end
end

function polyZoneExit(zoneName)
    if currentZone == zoneName then
        isAtGarage = false
        pCurrentGarage = "None"
    end
end


exports("currentGarage", function()
    if isAtGarage then
        return pCurrentGarage
    elseif isAtHouseGarage then
        return pHouseNameGarage
    end
end)

exports("houseGarageCoords", function()
    return pHouseGarages
end)

exports("NearHouseGarage", function()
    return isAtHouseGarage
end)

RegisterNetEvent("menu:send:house:garages", function(pCoords, pGarageName)
    pHouseGarages = pCoords
    isAtHouseGarage = true
    pHouseNameGarage = pGarageName
end)

RegisterNetEvent("menu:housing", function(pState)
    isAtHouseGarage = pState
end)


AddEventHandler('ab-polyzone:entered:garages', polyZoneEnter)
AddEventHandler('ab-polyzone:exited:garages', polyZoneExit)


RegisterCommand("garage", function()
    if isAtGarage then
        print(pCurrentGarage)
    else 
        print('not')
    end
end)


RegisterNetEvent('ab-polyzone:enter')
AddEventHandler('ab-polyzone:enter', function(name)
    for k, v in pairs (approvedGarages) do
        if name == v then
            isAtGarage = true
            pCurrentGarage = name
        end
    end
end)

RegisterNetEvent('ab-polyzone:exit')
AddEventHandler('ab-polyzone:exit', function(name)
    for k, v in pairs (approvedGarages) do
        if name == v then
            isAtGarage = false
            pCurrentGarage = "None"
        end
    end
end)