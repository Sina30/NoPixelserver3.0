Citizen.CreateThread(function() 
    while true do
		Citizen.Wait(30 * 60000)
		TriggerServerEvent('coke:updateTable', false)
	end
end)

local inUse = false
local process 
local coord 
local location = nil
local enroute
local fueling
local dodo
local delivering
local hangar
local jerrycan
local checkPlane
local flying
local landing
local hasLanded
local pilot
local airplane
local planehash
local driveHangar
local blip
local isProcessing = false

Citizen.CreateThread(function()
	Citizen.Wait(20000)
    process = RPC.execute("processcoords")
end)

Citizen.CreateThread(function()
	Citizen.Wait(20000)
    coord = RPC.execute("coords")
end)

-- Citizen.CreateThread(function()
-- 	local sleep
-- 	while not coord do
-- 		Citizen.Wait(0)
-- 	end
-- 	while true do
-- 		sleep = 5
-- 		local player = GetPlayerPed(-1)
-- 		local playercoords = GetEntityCoords(player)
-- 		local dist = #(vector3(playercoords.x, playercoords.y, playercoords.z)-vector3(coord.x, coord.y, coord.z))
-- 		if not inUse then
-- 			if dist <= 1 then
-- 				sleep = 5
-- 				DrawText3D(coord.x, coord.y, coord.z, '[~g~E~w~] Pay $2000 to rent a plane')
--                 if IsControlJustPressed(1, 51) then
-- 					    local success = RPC.execute("coke:pay")
-- 					    	if success then
-- 					    		main()
-- 					    	end
-- 				end
-- 			else
-- 				sleep = 2000
-- 			end
-- 		elseif dist <= 3 and inUse then
-- 			sleep = 5
-- 			DrawText3D(coord.x, coord.y, coord.z, 'Someone has already requested a plane.')
-- 		else
-- 			sleep = 3000
-- 		end
-- 		Citizen.Wait(sleep)
-- 	end
-- end)

RegisterNetEvent('coke:int:ban')
AddEventHandler('coke:int:ban', function()
	sleep = 5
	local player = GetPlayerPed(-1)
	local playercoords = GetEntityCoords(player)
	local dist = #(vector3(playercoords.x, playercoords.y, playercoords.z)-vector3(coord.x, coord.y, coord.z))
	if not inUse then
		if dist <= 1 then
			sleep = 5
			local success = RPC.execute("coke:pay")
			if success then
				main()
			end
		else
			TriggerEvent('DoLongHudText', " Guy Says : I don't know what you are talknig about !", 2)
			sleep = 2000
		end
	elseif dist <= 3 and inUse then
		sleep = 5
	else
		sleep = 3000
	end
	Citizen.Wait(sleep)
end)

RegisterNetEvent('coke:syncTable')
AddEventHandler('coke:syncTable', function(bool)
    inUse = bool
end)

RegisterNetEvent('coke:onUse')
AddEventHandler('coke:onUse', function()
	if Config.useMythic then
		TriggerEvent('DoLongHudText', 'You used Coke')
	end
	local crackhead = GetPlayerPed(-1)
	SetPedArmour(crackhead, 30)
	SetTimecycleModifier("DRUG_gas_huffin")
	Citizen.Wait(Config.cokeTime)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	DoScreenFadeIn(2000)
	if Config.useMythic then
		TriggerEvent('DoLongHudText', 'You are feeling normal now..')
	end
	SetPedArmour(crackhead, 0)
	ClearTimecycleModifier()
end)

function main()
	local player = GetPlayerPed(-1)
	SetEntityCoords(player, coord.x-0.1,coord.y-0.1,coord.z-1, 0.0,0.0,0.0, false)
	SetEntityHeading(player, Config.doorHeading)
	playAnim("oddjobs@assassinate@vice@hooker", "argue_a", 2000)
	Citizen.Wait(1000)
	TriggerServerEvent('coke:updateTable', true)
	TriggerServerEvent('coke:tookPlane')
	if Config.useMythic then
		TriggerEvent('DoLongHudText', 'Good Luck.')
	end
	rand = math.random(1,#Config.locations)
	location = Config.locations[rand]
	blip1 = AddBlipForCoord(location.fuel.x,location.fuel.y,location.fuel.z)
	SetBlipRoute(blip1, true)
	enroute = true
	Citizen.CreateThread(function()
		while enroute do
			sleep = 5	
			local player = GetPlayerPed(-1)
			playerpos = GetEntityCoords(player)
			local disttocoord = #(vector3(location.fuel.x,location.fuel.y,location.fuel.z)-vector3(playerpos.x,playerpos.y,playerpos.z))
			if disttocoord <= 20 then
				PlaneSpawn()
				enroute = false
			else
				sleep = 1500
			end
			Citizen.Wait(sleep)
		end
	end)
end

function PlaneSpawn()

	if DoesEntityExist(airplane) then
	    SetVehicleHasBeenOwnedByPlayer(airplane,false)
		SetEntityAsNoLongerNeeded(airplane)
		DeleteEntity(airplane)
		Citizen.Wait(100)
	end

	local planehash = GetHashKey("dodo")
	
    RequestModel(planehash)
    while not HasModelLoaded(planehash) do
        Citizen.Wait(0)
    end
	Citizen.Wait(100)
    airplane = CreateVehicle(planehash, location.parking.x, location.parking.y, location.parking.z, 27.5, true, false)
    local plt = GetVehicleNumberPlateText(airplane)
	SetVehicleHasBeenOwnedByPlayer(airplane,true)
	local plate = GetVehicleNumberPlateText(airplane)
	TriggerEvent("keys:addNew",airplane,plate)

	RemoveBlip(blip1)
	SetBlipRoute(blip1, false)
	
	dodo = false
	delivering = true
	delivery()
end

-- IsSpawnClear = (function(coords, area)
--     local vehicles = Oasis.Functions.GetVehicles()
--     local vehiclesInArea = {}

--     for i=1, #vehicles, 1 do
--         local vehicleCoords = GetEntityCoords(vehicles[i])
--         local distance = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

--         if distance <= area then
--             table.insert(vehiclesInArea, vehicles[i])
--         end
--     end
    
--     return #vehiclesInArea == 0
-- end)

function planeFly()
	--[[local pilothash = GetHashKey(Config.pilotPed)
    RequestModel(pilothash)
    while not HasModelLoaded(pilothash) do
        Citizen.Wait(0)
    end
    local planehash = GetHashKey("dodo")
	RequestModel(planehash)
	while not HasModelLoaded(planehash) do
		Citizen.Wait(0)
	end
	if Config.useMythic then
		exports['mythic_notify']:SendAlert('inform', 'wait_plane')
	end
	airplane = CreateVehicle(planehash, location.plane.x,location.plane.y,location.plane.z, location.plane.h, true, true)

    SetEntityDynamic(airplane, true)
    ActivatePhysics(airplane)
    SetVehicleForwardSpeed(airplane, 100.0)
    SetHeliBladesFullSpeed(airplane) 
    SetVehicleEngineOn(airplane, true, true, false)
    ControlLandingGear(airplane, 0) 
    SetEntityProofs(airplane, true, false, true, false, false, false, false, false)
    SetPlaneTurbulenceMultiplier(airplane, 0.0)

    pilot = CreatePedInsideVehicle(airplane, 1, pilothash, -1, true, true)
    SetBlockingOfNonTemporaryEvents(pilot, true) 
    SetPedRandomComponentVariation(pilot, false)
    SetPedKeepTask(pilot, true)
    SetTaskVehicleGotoPlaneMinHeightAboveTerrain(airplane, 93.0) 
    Citizen.CreateThread(function()
        flying = true
        local planecoords
        while flying do
            Citizen.Wait(100)
            planecoords = GetEntityCoords(airplane)
            local disttocoord = #(vector3(location.plane.x,location.plane.y,location.plane.z)-vector3(planecoords.x,planecoords.y,planecoords.z))
            if disttocoord < 100 then
                flying = false
                taskLand()       
                return
            else
                TaskVehicleDriveToCoord(pilot, airplane, location.plane.x,location.plane.y,location.plane.z, 100.0, 0, planehash, 262144, 15.0, -1.0)
                Citizen.Wait(1000)
            end
        end
	end)--]]
	
end

--[[function taskLand()
	landing = true 
	if landing then
		TaskPlaneLand(pilot, airplane, location.runwayEnd.x,location.runwayEnd.y,location.runwayEnd.z, location.runwayStart.x,location.runwayStart.y,location.runwayStart.z)
	end
	 Citizen.CreateThread(function()
        local planecoords
        while landing do
            sleep = 1000
            planecoords = GetEntityCoords(airplane)
            local disttocoord = #(vector3(location.runwayStart.x,location.runwayStart.y,location.runwayStart.z)-vector3(planecoords.x,planecoords.y,planecoords.z))
            if disttocoord <= 30 then
            	landing = false
            	landed()
            else
                sleep = 1500
            end
            Citizen.Wait(sleep)
        end
    end)
end

function landed()
	hasLanded = true
	local sleep
	RemoveBlip(blip)
	SetBlipRoute(blip, false)
	while hasLanded do
		sleep = 500
		planecoords = GetEntityCoords(airplane)
        local disttocoord = #(vector3(location.landingLoc.x, location.landingLoc.y, location.landingLoc.z)-vector3(planecoords.x,planecoords.y,planecoords.z))
        SetDriveTaskDrivingStyle(pilot, 2883621)
		TaskVehicleDriveToCoord(pilot, airplane, location.landingLoc.x, location.landingLoc.y, location.landingLoc.z, 10.0, 156, planehash, 786603, 1.0, true)
		if disttocoord <= 10 then
			hasLanded = false
			parkHangar()
		end
		Citizen.Wait(sleep)
	end
end

function parkHangar()
	driveHangar = true
	local player = GetPlayerPed(-1)
	local sleep
	while driveHangar do
		sleep = 500
		planecoords = GetEntityCoords(airplane)
        local disttocoord = #(vector3(location.parking.x, location.parking.y, location.parking.z)-vector3(planecoords.x,planecoords.y,planecoords.z))
        SetDriveTaskDrivingStyle(pilot, 2883621)
		TaskVehicleDriveToCoord(pilot, airplane, location.parking.x, location.parking.y, location.parking.z, 10.0, 156, planehash, 786603, 1.0, true)
        if disttocoord <= 2 then
        	FreezeEntityPosition(airplane, true) 	
        	Citizen.Wait(1000)
        	TaskLeaveVehicle(pilot, airplane, 0)
        	Citizen.Wait(2000)
        	if Config.useMythic then
				exports['mythic_notify']:SendAlert('inform', 'no_fuel')
				Oasis.Functions.Notify("You used Coke", "success")

        	end
        	TaskTurnPedToFaceEntity(pilot, player, 5000)
        	fuel(location.fuel.x,location.fuel.y,location.fuel.z)
        	playAnimPed("anim@mp_player_intincarsalutestd@ds@", "idle_a", 5000)
        	Citizen.Wait(5000)
        	SetEntityAsNoLongerNeeded(pilot)
        	driveHangar = false
        end
        Citizen.Wait(sleep)
	end
end

function fuel(x,y,z)
	local prop = GetHashKey("prop_ld_jerrycan_01")
	RequestModel(prop)
	while not HasModelLoaded(prop) do
		Citizen.Wait(0)
	end
	jerrycan = GetHashKey("WEAPON_PETROLCAN")
	local fuelSpawn = CreateObject(prop, x,y,z-1, true, true, false)
	local player = GetPlayerPed(-1)
	local fuelCoords = GetEntityCoords(fuelSpawn)
	FreezeEntityPosition(fuelSpawn, true)
	fueling = true
	Citizen.CreateThread(function()
		while fueling do
			sleep = 5	
			local playerpos = GetEntityCoords(player)
			local disttocoord = #(vector3(fuelCoords.x,fuelCoords.y,fuelCoords.z)-vector3(playerpos.x,playerpos.y,playerpos.z))
			if disttocoord <= 3 then
				DrawText3Ds(fuelCoords.x,fuelCoords.y,fuelCoords.z, 'pick_jerry')
				if IsControlJustPressed(1, 51) then
					TaskTurnPedToFaceEntity(player, fuelSpawn, 3000)
					FreezeEntityPosition(player, true)
					if Config.progBar then
						exports['progressBars']:startUI(1000, 'picking_jerry')
					end
					DoScreenFadeOut(1000)
					Citizen.Wait(1000)
					DeleteEntity(fuelSpawn)
					Citizen.Wait(500)
					DoScreenFadeIn(2000)
					GiveWeaponToPed(player, jerrycan, 0, false, true)
					FreezeEntityPosition(player, false)
					if Config.useMythic then
						exports['mythic_notify']:SendAlert('inform', 'fill_plane')
						Oasis.Functions.Notify("You used Coke", "success")

					end
					plane(fuel)
					fueling = false
					dodo = true
				end
			else
				sleep = 1500
			end
			Citizen.Wait(sleep)
		end
	end)
end

function plane(fuel)
	local player = GetPlayerPed(-1)
	Citizen.CreateThread(function()
		while dodo do
			sleep = 5	
			local playerpos = GetEntityCoords(player)
			local disttocoord = #(vector3(location.parking.x,location.parking.y,location.parking.z)-vector3(playerpos.x,playerpos.y,playerpos.z))
			if disttocoord <= 5 then
				DrawText3Ds(location.parking.x,location.parking.y,location.parking.z, 'refuel')
				DrawMarker(27, location.parking.x,location.parking.y,location.parking.z-0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 0.2, 3, 252, 152, 100, false, true, 2, false, false, false, false)
				if IsControlJustPressed(1, 51) then
					dodo = false
					delivering = true
					SetCurrentPedWeapon(player, jerrycan, true)
					TaskTurnPedToFaceEntity(player, airplane, 20000)
					FreezeEntityPosition(player, true)
					playAnim("weapon@w_sp_jerrycan", "fire", 20000)
					if Config.progBar then
						exports['progressBars']:startUI(20000, 'refueling')
					end
					Citizen.Wait(20000)
					if Config.useMythic then
						exports['mythic_notify']:SendAlert('success', 'finish_refuel')
						Oasis.Functions.Notify("You used Coke", "success")

					end
					RemoveWeaponFromPed(player, jerrycan)
					FreezeEntityPosition(airplane, false)
					FreezeEntityPosition(player, false)
					ClearPedTasksImmediately(player)
					delivery()
				end
			else
				sleep = 1500
			end
			Citizen.Wait(sleep)
		end
	end)
end---]]

Citizen.CreateThread(function()
	checkPlane = true
	while checkPlane do
		sleep = 100 
		if DoesEntityExist(airplane) then
			if GetVehicleEngineHealth(airplane) < 0 then
				if Config.useMythic then
					TriggerEvent('DoLongHudText', 'Canceling')
				end
				TriggerServerEvent('coke:updateTable', false)
				checkPlane = false
			end
		else
			sleep = 3000
		end
		Citizen.Wait(sleep)
	end
end)

function delivery()
	if Config.useMythic then
		TriggerEvent('DoLongHudText', 'Get in the plane and pick up the delivery marked on your GPS')
	end
	local pickup = GetHashKey("prop_barrel_float_1")
	blip = AddBlipForCoord(location.delivery.x,location.delivery.y,location.delivery.z)
	SetBlipRoute(blip, true)
	RequestModel(pickup)
	while not HasModelLoaded(pickup) do
		Citizen.Wait(0)
	end
	local pickupSpawn = CreateObject(pickup, location.delivery.x,location.delivery.y,location.delivery.z, true, true, true)
	local player = GetPlayerPed(-1)
	Citizen.CreateThread(function()
		while delivering do
			sleep = 5	
			local playerpos = GetEntityCoords(player)
			local disttocoord = #(vector3(location.delivery.x,location.delivery.y,location.delivery.z)-vector3(playerpos.x,playerpos.y,playerpos.z))
			local veh = GetVehiclePedIsIn(PlayerPedId(),false)

			if disttocoord <= 30 then
				RemoveBlip(blip)
				SetBlipRoute(blip, false)
				DrawText3D(location.delivery.x,location.delivery.y,location.delivery.z-1, '[~g~E~w~] Pick up the delivery')
				if IsControlJustPressed(1, 51) then
					if veh == airplane then
						delivering = false
						local finished = exports['ab-taskbar']:taskBar(5000, 'Picking up the Package', false, false)
    						if (finished) == 100 then
								DeleteEntity(pickupSpawn)
							else

							end
						Citizen.Wait(2000)
						TriggerEvent('DoLongHudText', 'Picked up the delivery. Return to the airfield marked on your GPS.')
						Citizen.Wait(2000)
						final()
					else
						TriggerEvent('DoLongHudText', 'You are not in the vehicle which was provided to you.')
						DeleteEntity(airplane)
					end
				end
			else
				sleep = 1500
			end
			Citizen.Wait(sleep)
		end
	end)
end
function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z, 0)
	DrawText(0.0, 0.0)
	local factor = (string.len(text)) / 370
	DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()
end
function final()
	--exports['mythic_notify']:SendAlert('inform', 'deliv_plane')
	-- Oasis.Functions.Notify("Deliver the plane back to a hangar", "success")
	TriggerEvent('DoLongHudText', 'Deliver the plane back to a hangar')
	blip = AddBlipForCoord(location.hangar.x,location.hangar.y,location.hangar.z)
	SetBlipRoute(blip, true)
	hangar = true
	local player = GetPlayerPed(-1)
	Citizen.CreateThread(function()
		while hangar do
			sleep = 5	
			local playerpos = GetEntityCoords(player)
			local disttocoord = #(vector3(location.hangar.x,location.hangar.y,location.hangar.z)-vector3(playerpos.x,playerpos.y,playerpos.z))
			local veh = GetVehiclePedIsIn(PlayerPedId(),false)

			if disttocoord <= 10 then
				RemoveBlip(blip)
				SetBlipRoute(blip, false)
				DrawText3D(location.hangar.x,location.hangar.y,location.hangar.z+1, '[~g~E~w~] Park the plane.')
				DrawMarker(27, location.hangar.x,location.hangar.y,location.hangar.z-0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 3, 252, 152, 100, false, true, 2, false, false, false, false)
				if IsControlJustPressed(1, 51) then
					if veh == airplane then
						hangar = false
						FreezeEntityPosition(airplane, true)
						local finished = exports['ab-taskbar']:taskBar(5000, 'Returning Plane', false, false)
                        if (finished) == 100 then
							DeleteEntity(airplane)
						end
						Citizen.Wait(2000)
						RPC.execute("coke:GiveItem")
						TaskLeaveVehicle(player, airplane, 0)
						SetVehicleDoorsLocked(airplane, 2)
						TriggerEvent('DoLongHudText', 'You received your deposit money back deducting $1000 as rent')
						Citizen.Wait(1000)
						if Config.useCD then		
							cooldown()
						else
							TriggerServerEvent('coke:updateTable', false)
						end
					else
						TriggerEvent('DoLongHudText', 'This is not the vehicle which was provided to you.')
						DeleteEntity(airplane)
					end
				end
			else
				sleep = 1500
			end
			Citizen.Wait(sleep)
		end
	end)
end

RegisterNetEvent('coke:sync:ban')
AddEventHandler('coke:sync:ban', function()
	local sleep
	sleep = 5
	local player = GetPlayerPed(-1)
	local playercoords = GetEntityCoords(player)
	local dist = #(vector3(playercoords.x,playercoords.y,playercoords.z)-vector3(1090.43,-3195.72,-39.17))
	if dist <= 4 and not isProcessing then
		sleep = 5
			isProcessing = true
			if exports["ab-inventory"]:getQuantity("coke50g") >= 1 then
				if exports["ab-inventory"]:getQuantity("emptybaggies") >= 1 then
					if exports["ab-inventory"]:getQuantity("smallscales") >= 1 then
						processing()
						-- TriggerServerEvent('coke:processstart')
					else
						TriggerEvent('DoLongHudText', 'How will you weight the powder')
					
					    isProcessing = false		
					end
				else
					TriggerEvent('DoLongHudText', 'Where will you pack stuff ?')
					isProcessing = false
				end
			else
				TriggerEvent('DoLongHudText', 'what the fuck you wanna do ?')
				isProcessing = false
			end
	else
		sleep = 1500
	end
end)


Citizen.CreateThread(function()
	local sleep = 50
	while not process do
		Citizen.Wait(0)
	end
	while true do
		Citizen.Wait(sleep)
	end
end)

function processing()
	local player = GetPlayerPed(-1)
	SetEntityCoords(player, process.x,process.y+.8,process.z-1, 0.0, 0.0, 0.0, false)
	SetEntityHeading(player, 178.36)
	FreezeEntityPosition(player, false)
	playAnim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 30000)
	local finished = exports['ab-taskbar']:taskBar(math.random(7000, 15000), 'Breaking down the coke And Packing It', false, false)
    if (finished) == 100 then
		if exports["ab-inventory"]:getQuantity("coke50g") >= 1 then
			if exports["ab-inventory"]:getQuantity("emptybaggies") >= 1 then
				TriggerEvent('inventory:removeItem', 'coke50g', 1)
				TriggerEvent('inventory:removeItem', 'emptybaggies', 1)
				FreezeEntityPosition(player, false)
				TriggerEvent("player:receiveItem","coke5g",10)
				isProcessing = false
			else
				isProcessing = false
				ClearPedTasksImmediately(player)
				FreezeEntityPosition(player, false)
			end
		else
			isProcessing = false
			ClearPedTasksImmediately(player)
			FreezeEntityPosition(player, false)
		end
	else		
		isProcessing = false
		ClearPedTasksImmediately(player)
		FreezeEntityPosition(player, false)
	end
end

function cooldown()
	Citizen.Wait(Config.cdTime)
	TriggerServerEvent('coke:updateTable', false)
end

function playAnimPed(animDict, animName, duration, buyer, x,y,z)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Citizen.Wait(0) 
    end
    TaskPlayAnim(pilot, animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Citizen.Wait(0) 
    end
    TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end


-- (Optional) Shows your coords, useful if you want to add new locations.


Config = {}
Config.Locale = 'en' -- English, German or Spanish - (en/de/es)

Config.useMythic = true -- change this if you want to use mythic_notify or not
Config.progBar = true -- change this if you want to use Progress Bar or not
Config.useCD = true -- change this if you want to have a global cooldown or not
Config.cdTime = 900000 -- global cooldown in ms. Set to 20 minutes by default - (https://www.timecalculator.net/minutes-to-milliseconds)
Config.doorHeading = 112.32 -- change this to the proper heading to look at the door you start the runs with
Config.price = 4000 -- amount you get after the run 
Config.amount = 5000 --amount you have to pay to start a run 
Config.cokeTime = 60000 -- time in ms the effects of coke will last for
Config.pickupTime = 5000 -- time it takes to pick up the delivery 
Config.randBrick = math.random(1,1) -- change the numbers to how much coke you want players to receive after breaking down bricks
Config.takeBrick = 1 -- amount of brick you want to take after processing
Config.getCoords = false -- gets coords with /mycoords
Config.pilotPed = "s_m_m_pilot_02" -- change this to have a different ped as the planes pilot - (lsit of peds: https://wiki.rage.mp/index.php?title=Peds)
Config.landPlane = false -- change this if you want the plane to fly and land or if it should spawn on the ground

Config.locations = {
	[1] = { 
		fuel = {x = 2134.91, y = 4780.38, z = 40.74}, -- location of the jerry can/waypoint
		landingLoc = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		plane = {x = 2134.91, y = 4780.38, z = 40.74, h = 360.0}, -- don't mess with this unless you know what you're doing
		runwayStart = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		runwayEnd = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		fuselage = {x = 2134.91, y = 4780.38, z = 40.74}, -- location of the 3D text to fuel the plane
		stationary = {x = 2134.91, y = 4780.38, z = 40.74, h = 360.0}, -- location of the plane if Config.landPlane is false 
		delivery = {x = 149.2108, y = 4086.845, z = 31.6526}, -- delivery location
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, -- end location
		parking = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing															
	},
	[2] = { 
		fuel = {x = 2134.91, y = 4780.38, z = 40.74}, -- location of the jerry can/waypoint
		landingLoc = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		plane = {x = 2134.91, y = 4780.38, z = 40.74, h = 360.0}, -- don't mess with this unless you know what you're doing
		runwayStart = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		runwayEnd = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		fuselage = {x = 2134.91, y = 4780.38, z = 40.74}, -- location of the 3D text to fuel the plane
		stationary = {x = 2134.91, y = 4780.38, z = 40.74, h = 360.0}, -- location of the plane if Config.landPlane is false 
		delivery = {x = 104.39, y = 7450.84, z = 0.0}, -- delivery location
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, -- end location
		parking = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing															
	},
	[3] = { 
		fuel = {x = 2134.91, y = 4780.38, z = 40.74}, -- location of the jerry can/waypoint
		landingLoc = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		plane = {x = 2134.91, y = 4780.38, z = 40.74, h = 360.0}, -- don't mess with this unless you know what you're doing
		runwayStart = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		runwayEnd = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		fuselage = {x = 2134.91, y = 4780.38, z = 40.74}, -- location of the 3D text to fuel the plane
		stationary = {x = 2134.91, y = 4780.38, z = 40.74, h = 360.0}, -- location of the plane if Config.landPlane is false 
		delivery = {x = 1904.34, y = 115.59, z = 160.35}, -- delivery location
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, -- end location
		parking = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing															
	},
	[4] = { 
		fuel = {x = 2134.91, y = 4780.38, z = 40.74}, -- location of the jerry can/waypoint
		landingLoc = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		plane = {x = 2134.91, y = 4780.38, z = 40.74, h = 360.0}, -- don't mess with this unless you know what you're doing
		runwayStart = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		runwayEnd = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing
		fuselage = {x = 2134.91, y = 4780.38, z = 40.74}, -- location of the 3D text to fuel the plane
		stationary = {x = 2134.91, y = 4780.38, z = 40.74, h = 360.0}, -- location of the plane if Config.landPlane is false 
		delivery = {x = 3801.77, y = 438.11, z = 0.0}, -- delivery location
		hangar = {x = 2134.474, y = 4780.939, z = 40.97027}, -- end location
		parking = {x = 2134.91, y = 4780.38, z = 40.74}, -- don't mess with this unless you know what you're doing															
	},
}




