veh = 0
canSpawn = true
oxyOn = false
canAfford = false
run = 0
payed = false
model = 'dinghy'

local locations = {
    [1] = {['x'] = -942.350, ['y'] = 6608.752, ['z'] = -20.912, ['active'] = 1, ['info'] = 'Plane Crash'},
    [2] = {['x'] = 3199.748, ['y'] = -379.018, ['z'] = -22.500, ['active'] = 1, ['info'] = 'Sunked Cargo Ship'},
    [3] = {['x'] = 759.68, ['y'] = 7393.15, ['z'] = -110.35, ['active'] = 1, ['info'] = 'UFO'},
    [4] = {['x'] = 4201.633, ['y'] = 3643.821, ['z'] = -39.016, ['active'] = 1, ['info'] = 'WW2 Tank'},
    [5] = {['x'] = 4273.950, ['y'] = 2975.714, ['z'] = -170.746, ['active'] = 1, ['info'] = 'Weird Hatch'},
}

local subLocations = {
    [1] = { -- Plane
        [1] = {['x'] = -898.538, ['y'] = 6647.697, ['z'] = -29.874, ['active'] = 1},
        [2] = {['x'] = -914.726, ['y'] = 6667.997, ['z'] = -30.874, ['active'] = 1},
        [3] = {['x'] = -990.015, ['y'] = 6704.833, ['z'] = -38.874, ['active'] = 1},
        [4] = {['x'] = -843.702, ['y'] = 6665.688, ['z'] = -25.850, ['active'] = 1},
    },
    [2] = { -- Cargo
        [1] = {['x'] = 3176.239, ['y'] = -332.582, ['z'] = -27.491, ['active'] = 1},
        [2] = {['x'] = 3156.464, ['y'] = -310.117, ['z'] = -21.493, ['active'] = 1},
        [3] = {['x'] = 3198.967, ['y'] = -374.249, ['z'] = -23.493, ['active'] = 1},
        [4] = {['x'] = 3149.900, ['y'] = -330.070, ['z'] = -25.489, ['active'] = 1},
        [5] = {['x'] = 3179.739, ['y'] = -352.232, ['z'] = -29.449, ['active'] = 1},
        [6] = {['x'] = 3203.572, ['y'] = -386.377, ['z'] = -17.749, ['active'] = 1},
    },
    [3] = { -- UFO
        [1] = {['x'] = 758.858, ['y'] = 7400.528, ['z'] = -114.819, ['active'] = 1},
        [2] = {['x'] = 773.897, ['y'] = 7364.618, ['z'] = -124.838, ['active'] = 1},
        [3] = {['x'] = 753.218, ['y'] = 7406.714, ['z'] = -130.958, ['active'] = 1},
    },
    [4] = { -- Tank
        [1] = {['x'] = 4213.614, ['y'] = 3652.727, ['z'] = -43.602, ['active'] = 1},
        [2] = {['x'] = 4213.902, ['y'] = 3641.896, ['z'] = -43.602, ['active'] = 1},
        [3] = {['x'] = 4206.029, ['y'] = 3647.475, ['z'] = -43.602, ['active'] = 1},
    },
    [5] = { -- Hatch
        [1] = {['x'] = 4290.381, ['y'] = 2968.111, ['z'] = -182.745, ['active'] = 1},
        [2] = {['x'] = 4279.702, ['y'] = 2967.264, ['z'] = -182.745, ['active'] = 1},
    },
}


function StartDive()
    Citizen.Wait(10)
    if run == 5 then
        run = 0
        TriggerEvent('DoLongHudText', 'No More Runs, Head Back To The Dock To Start Another One!.', 1)
        for i = 1, #locations do
            locations[i]['active'] = 1
            for c = 1, #subLocations[i] do
                subLocations[i][c]['active'] = 1
            end
        end
        return
    end

    local rand = math.random(1,5)
    local active = locations[rand]
    local scavanged = 0

    if active['active'] == 1 then
        active['active'] = 0
        addBlip(rand)
        if run == 0 then
            TriggerEvent("phone:addnotification", "SpongeBob","Yo, So I've got a location for you. It should be marked on your GPS... I think its a " .. tostring(active['info']) .. " ~ <b>Regards Pu$$y Destroyer</b>")
        elseif run == 1 then
            TriggerEvent("phone:addnotification", "SpongeBob","Yo, So I've got another location for you. It should be marked on your GPS... I think its a " .. tostring(active['info']) .. " ~ <b>Regards Pu$$y Destroyer</b>")
        elseif run == 2 then
            TriggerEvent("phone:addnotification", "SpongeBob","Yo, So I've got another location for you. It should be marked on your GPS... I think its a " .. tostring(active['info']) .. " ~ <b>Regards Pu$$y Destroyer</b>")
        elseif run == 3 then
            TriggerEvent("phone:addnotification", "SpongeBob","Yo, So I've got another location for you. It should be marked on your GPS... I think its a " .. tostring(active['info']) .. " ~ <b>Regards Pu$$y Destroyer</b>")
        elseif run == 4 then
            TriggerEvent("phone:addnotification", "SpongeBob","Yo, So I've got another location for you. It should be marked on your GPS... I think its a " .. tostring(active['info']) .. " ~ <b>Regards Pu$$y Destroyer</b>")
        elseif run == 5 then
            TriggerEvent("phone:addnotification", "SpongeBob","Yo, So I've got another location for you. It should be marked on your GPS... I think its a " .. tostring(active['info']) .. " ~ <b>Regards Pu$$y Destroyer</b>")
        end
        while true do
            Citizen.Wait(0)
            for index, value in pairs(subLocations[rand]) do
                local plyCords = GetEntityCoords(PlayerPedId())
                local dis = GetDistanceBetweenCoords(plyCords, value['x'], value['y'], value['z'], true)
                if dis <= 20 and value['active'] == 1 then
                    DrawText3Ds(value['x'], value['y'], value['z'],'[E] Scavange for Treasure')
                    if dis <= 5 then
                        if IsControlJustReleased(0, 38) then
                            value['active'] = 0
                            scavanged = scavanged + 1
                            TaskStartScenarioAtPosition(PlayerPedId(), 'WORLD_HUMAN_WELDING', value['x'], value['y'], value['z'], GetEntityHeading(PlayerPedId()), 1000, 0, 1) --10000
                            Citizen.Wait(10000) --10000
                            ClearPedTasksImmediately(PlayerPedId())
                            TriggerServerEvent('ab-scuba:findTreasure')
                        end
                    end
                else
                end
                if scavanged == #subLocations[rand] then
                    RemoveBlip(allBlips)
                    RemoveBlip(allBlipsSprite)
                    run = run + 1
                    StartDive()
                    return
                end
            end
        end
    else
        StartDive()
    end
end

function addBlip(num)
    allBlips = AddBlipForCoord(locations[num]['x'],locations[num]['y'],locations[num]['z'])
    allBlipsSprite = AddBlipForCoord(locations[num]['x'],locations[num]['y'],locations[num]['z'])

    SetBlipSprite(allBlips , 404)
    SetBlipSprite(allBlipsSprite, 161)
    SetBlipColour(allBlipsSprite, 3)
    SetBlipScale(allBlipsSprite, 1.0)
    SetBlipScale(allBlips , 1.0)
    SetBlipColour(allBlips, 40)
    PulseBlip(allBlipsSprite)
    SetBlipAsShortRange(allBlips, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Diving Location')
    EndTextCommandSetBlipName(allBlips)
end

local blips = {
{title="Millars Bait Tackle", colour=29, id=356, scale=0.5, x = -1613.079, y = 5262.372, z = 3.974097}
 }
      
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, info.scale)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


RegisterNetEvent('toggleOxy')
AddEventHandler('toggleOxy', function(value)
    oxyOn = value
end)


function SellItems()
    if exports["ab-inventory"]:hasEnoughOfItem("ironbar",10,false) then 
        TriggerEvent("inventory:removeItem", "ironbar", 10)
        TriggerServerEvent('ab-scuba:paySalvage', 250)
    else
        TriggerEvent('DoLongHudText', 'You dont have enough Material in your pockets to sell!', 2)
    end
end

RegisterNetEvent('fuckoffdinghyomfgwhyisntitspawning')
AddEventHandler('fuckoffdinghyomfgwhyisntitspawning', function()
	Citizen.Wait(1)
	local closest = GetClosestVehicle(-1617.0656738281, 5270.9838867188, 3.4332039356232, 3.000, 0, 70)
	if DoesEntityExist(closest) then
		TriggerEvent("DoLongHudText", "The area is crowded",2)
		return
	end

	if lastPlate ~= nil then
		TriggerEvent("keys:remove",lastPlate)
	end
	

	local myPed = PlayerPedId()
	local player = PlayerId()
	local vehicle = `dinghy`
	RequestModel(vehicle)
	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

    local plate = "EMS ".. GetRandomIntInRange(1000, 9000)
	local spawned_car = CreateVehicle(vehicle, -1617.0656738281, 5270.9838867188, 3.4332039356232, -20.0, true, false)
	SetVehicleNumberPlateText(spawned_car, plate)
    TriggerEvent("keys:addNew",spawned_car,plate)
	SetPedIntoVehicle(myPed, spawned_car, - 1)
	lastPlate = plate
    veh = spawned_car
    Wait(250)
    TriggerEvent('car:engine')
end)