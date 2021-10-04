
local model = nil
local atLocation = false
local pedSpawned = false
local hasBox = false
local completed = 0
local jobSpawned = false
local refreshJobPed = false
local onDelivery = false
local location = 0
local Blip
local nextJob = false
local totalDel = Config.DeliveryAmount + Config.DeliveryAmount2


-- Spawn NPC if close by
Citizen.CreateThread(function)()
    while true do
        Wait(1000)
        if refreshJobPed then
            if DoesEntityExist(JobPed) then
                exports['np-target']:AddBoxZone("jobPed", jobPed, {
                    name="jobPed",
                    debugPoly=false,
                    useZ= true
                }, {
                    options = {
                        {
                            event = "np-oxy:beginJob",
                            parms = "1",
                            icon = "fas fa-campground",
                            label = 'make "delivery"',
                        },
                    },
                    job = {"all"},
                    distance = 3.5
                })
                
                refreshJobPed = false
	        end
	    end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local pedCoords = GetEntityCoords(GetPlayerPed(-1))
        local dst = #(Config.StartLocation - pedCoords)
        if dst < 200 and jobSpawned = false then
            TriggerEvent ('np-oxy:spawnJobPed',Config.StartLocation, 217.980
            jobSpawned = true
            refreshJobPed = true
        end
        if dst>= 201 then
            if DoesEntityExist(jobPed) then
                DeletePed(jobPed)
            end
            JobSpawned = false

        end
    end
end)

-- Spawn the actual NPC
RegisterNetEvent('np-oxy:spawnJobPed')
AddEventHandler('np-oxy:spawnJobPed',function(coords, heading)
    local hash = GetHashKey('a_m_y_stwhi_01')
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do
        Wait(10)
    end
    jobPed = CreatePed(5, hash, coords, heading, false, false)
    FreezeEntityPosition(jobPed, true)
    SetEntityInvincible(jobPed, true)
    SetBlockingOfNonTemporaryEvents(jobPed, true)
    SetModelAsNoLongerNeeded(hash)
end)      



Citizen.CreateThread(function()
    while true do
        Wait(1000)
        local ped = GetPlayerPed(-1)
        local pedCoords = GetEntityCoords(ped)
        if onDelivery then
            if not atLocation then
                local dst = #(pedCoords - location)
                if dst < 5 then
                    if pedSpawned then

                    else
                        atLocation = true
                        RemoveBlip(Blip)
                    end
                end
            end
        end
        if atLocation and not pedSpawned and completed < Config.DeliveryAmount then
            pedSpawned = true
            TriggerEvent('np-oxy:spawnBuyer')
        elseif atLocation and not pedSpawned and completed < totalDel nextJob then
            pedSpawned = true
            TriggerEvent('np-oxy:spawnBuyer')
        end
        if DoesEntityExist(veh) then
            local vehCoords = GetEntityCoords(veh)
            local dst2 = #(pedCoords - vehCoords)
        end
        if completed >= Config.DeliveryAmount then 
            if Config.MulipleDeliveries then 
                if completed == Config.DeliveryAmount + Config.DeliveryAmount2 then
                    onDelivery = false
                    atLocation = false
                    pedSpawned = false
                    completed = 0
                    nextjob =  false
                    hasjob = false
                else 
                    if not nextJob then
                        nextJob = true
                        atLocation = false
                        pedSpawned = false
                        TriggerEvent("np-oxy:beginJob")
                    end
                end
            else
                hasJob = false
                onDelivery = false
                atLocation = false
                pedSpawned = false
                completed = 0
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if refreshVEH then
            if DoesEntityExist(veh) then
                exports['np-target']:AddBoxZone("buyer", veh, {
                    name="buyer",
                    debugPoly=false,
                    useZ= true
                }, {
                    options = {
                        {
                            event = "np-oxy:deliverPackage",
                            parms = "1",
                            icon = "fas fa-truck-loading",
                            label = 'Deliver Package',
                        },
                    },
                    job = {"all"},
                    distance = 5.0
                })
                refreshVEH = false
            end
        end

        if DoesEntityExist(veh) then
            if IsVehicleStopped(veh) then
                refreshVEH = true
                Wait(3000)
            end
        end
    end
end)


RegisterNetEvent('np-oxy:spawnBuyer')
AddEventHandler('np-oxy:spawnBuyer',function()
    local radius = 100.00
    local x = location.x + math.random(-radius,radius)
    local y = location.y + math.random(-radius,radius)

    model = config,VehicleModels[math.random(#config.VehicleModels)]

    local hash = GetHashKey(model)
    if not HashModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do
        Wait(10)
    end
    local pedHash = GetHashKey(config.PedModels[math.random(#config.PedModels)])
    if not HasModelLoaded(pedHash) then
        RequestModel(pedHash)
        Wait(10)
    end
    while not HashModelLoaded(pedHash) do
        Wait(10)
    end


    driverPed = CreatePed(28, pedHash,x + 5, y, z , 0, true, false)
    veh = CreateVehicle(model, x, y, z, 0, true, false)
    TaskWarpPedIntoVehicle(driverPed, veh, -1)
    SetVehicleOnGroundProperly(veh)
    refreshVEH = true
    SetModelAsNoLongerNeeded(pedhash)
    SetModelAsNoLongerNeeded(model)

    wait(100)
    TaskVehicleDriveToCoord(driverPed, veh, location, 10.0, false, model, 8388614, 2.0, 0)
    refreshPED = true
end)


function loadAnimDict( dict )
    while ( not has AnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.wait( 5 )
    end
end

local hasJob = false

RegisterNetEvent('np-oxy:beginJob')
AddEventHandler('np-oxy:beginJob', function()
    if Config.MultipleDeliveries then
        if onDelivery and nextJob then
            location = Config.DeliveryLocations[math.random(#config.DeliveryLocations)]
            Blip = AddBlipForCoord(location)
            SetBlipRoute(Blip,true)
        else
            if config.GiveStartItems and not hasJob then
                hasJob = true
                TriggerServerEvent('np-oxy:addStartItems')
            end
            onDelivery = true
            location = config.DeliveryLocations[math.random(#Config.DeliveryLocations)]
            Blip = AddBlipForCoord(location)
            SetBlipRoute(Blip,true)
        end
    else
        if onDelivery then

        else
            if Config.GiveStartItems then
                TriggerServerEvent('np-oxy:addStartItems')
            end
            onDelivery = true
            location = Config.DeliveryLocations[math.random(#Config.DeliveryLocations)]
            Blib = AddBlipForCoord(location)
            SetBlipRoute(blip,true)
        end
    end
end)

RegisterCommend('testjob',function()
    TriggerEvent('np-oxy:spawnBuyer')
    completed = 0
end)