--Coord Command
RegisterCommand('coords', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    TriggerEvent('DoLongHudText', 'Your Coords and heading is copied to your clipboard.', 1)
    SendNUIMessage({
		coords = ""..coords.x..", "..coords.y..", "..coords.z.." Heading: "..heading
	})
end)


-- Map Zoom Sens
Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0)
end)

local onlinePlayers = 0
RegisterNetEvent('rich:TakePlayers')
AddEventHandler('rich:TakePlayers', function(count)
    onlinePlayers = count
    if SetDiscordRichPresenceAction then
        SetDiscordRichPresenceAction(0, 'Click To Apply', 'https://discord.gg/summit')
    end
end)

Citizen.CreateThread(function()
    TriggerServerEvent('rich:GetPlayers')
    SetDiscordAppId(tonumber(GetConvar("RichAppId", "802593945825443860")))
    SetDiscordRichPresenceAsset(GetConvar("RichAssetId", "srp"))
    while true do
        Citizen.Wait(2000)
        SetDiscordRichPresenceAssetText("discord.gg/summit")
        SetRichPresence(onlinePlayers.."/150 Players")
    end
end)

-- Disable Pistol Whip
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsPedArmed(PlayerPedId(), 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        else
            Citizen.Wait(1500)
        end
    end
end) 

--Blind Fire
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local ped = PlayerPedId()
		if IsPedInCover(ped, 1) and not IsPedAimingFromCover(ped, 1) then 
			DisableControlAction(2, 24, true) 
			DisableControlAction(2, 142, true)
			DisableControlAction(2, 257, true)
		end		
	end
end)



--Basic Weapon Damage
Citizen.CreateThread(function()
    while true do
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.2)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.4)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.4)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIGHTSTICK"), 0.4)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CROWBAR"), 0.4)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HEAVYPISTOL"), 0.85)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPISTOL"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL_MK2"), 0.84)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNSPISTOL"), 0.80)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOl"), 0.81)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CARBINERIFLE_MK2"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHINEPISTOL"), 0.82)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_APPISTOl"), 0.83)
    	Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMG"), 0.83)
    	Wait(0)
    end
end)

-- No Driver Shooting
local passengerDriveBy = true

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, false)
		if car then
			if GetPedInVehicleSeat(car, -1) == playerPed then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)


-- Crosshair
local plyPed = PlayerPedId()
local xhairActive = false
local disableXhair = false

RegisterCommand("togglexhair", function()
    disableXhair = not disableXhair
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        plyPed = PlayerPedId()
        isArmed = IsPedArmed(plyPed, 7)

        if isArmed then
            if IsPlayerFreeAiming(PlayerId()) then
                if not xhairActive then
                    SendNUIMessage("xhairShow")
                    xhairActive = true
                end
            elseif xhairActive then
                SendNUIMessage("xhairHide")
                xhairActive = false
            end
        elseif IsPedInAnyVehicle(plyPed, false) then
            if xhairActive then
                SendNUIMessage("xhairHide")
                xhairActive = false
            end
        else
            if xhairActive then
                SendNUIMessage("xhairHide")
                xhairActive = false
            end
        end
    end
end)

--- Disables wierd run after shooting
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        ped = PlayerPedId()
        if not IsPedInAnyVehicle(ped, false) then
            if IsPedUsingActionMode(ped) then
                SetPedUsingActionMode(ped, -1, -1, 1)
            end
        else
            Citizen.Wait(3000)
        end
    end
end)

--Gets rid of barriers 
local gates = {
	'p_barier_test_s',
	'prop_sec_barier_01a',
	'prop_sec_barier_02a',
	'prop_sec_barier_02b',
	'prop_sec_barier_03a',
	'prop_sec_barier_03b',
	'prop_sec_barier_04a',
	'prop_sec_barier_04b',
	'prop_sec_barier_base_01',
	'prop_sec_barrier_ld_01a',
	'prop_sec_barrier_ld_02a',
	'prop_gate_airport_01',
	'prop_facgate_01',
	'prop_facgate_03_l',
	'prop_facgate_03_r',
	'prop_gate_docks_ld'
}

Citizen.CreateThread(function()
   while true do
		for i=1, #gates do
			local coords = GetEntityCoords(PlayerPedId(), false)
			local gate = GetClosestObjectOfType(coords.x, coords.y, coords.z, 100.0, GetHashKey(gates[i]), 0, 0, 0)
			if gate ~= 0 then
				SetEntityAsMissionEntity(gate, 1, 1)
				DeleteObject(gate)
				SetEntityAsNoLongerNeeded(gate)
			end
		end
	   Citizen.Wait(2500)
   end
end)

-- Delete Props When Hitting Them With a Vehicle
local Props = {
    [729253480] = true,
    [-655644382] = true,
    [589548997] = true,
    [793482617] = true,
    [1502931467] = true,
    [1803721002] = true,
    [-1651641860] = true,
    [-156356737] = true,
    [1043035044] = true,
    [862871082] = true,
    [-1798594116] = true,
    [865627822] = true,
    [840050250] = true,
    [1821241621] = true,
    [-797331153] = true,
    [-949234773] = true,
    [1191039009] = true,
    [-463994753] = true,
    [-276539604] = true,
    [1021745343] = true,
    [-1063472968] = true,
    [1441261609] = true,
    [-667908451] = true,
    [-365135956] = true,
    [-157127644] = true,
    [-1057375813] = true,
    [-639994124] = true,
    [173177608] = true,
    [-879318991] = true,
    [-1529663453] = true,
    [267702115] = true,
    [1847069612] = true,
    [1452666705] = true,
    [681787797] = true,
    [1868764591] = true,
    [-1648525921] = true,
    [-1114695146] = true,
    [-943634842] = true,
    [-331378834] = true,
    [431612653] = true,
    [-97646180] = true,
    [1437508529] = true,
    [-2007495856] = true,
    [-16208233304] = true,
    [2122387284] = true,
    [1411103374] = true,
    [-216200273] = true,
    [1322893877] = true,
    [93794225] = true,
    [373936410] = true,
    [-872399736] = true,
    [-1178167275] = true,
    [1327054116] = true,
}

Citizen.CreateThread(function()
    while true do
        local PropsToDelete = {}
        local ped = PlayerPedId()
        local idle, success = 1000
        local handle, prop = FindFirstObject()
        repeat               
            if Props[GetEntityModel(prop)] then
                if GetObjectFragmentDamageHealth(prop,true) < 1.0 or (GetObjectFragmentDamageHealth(prop,true) ~= nil and GetEntityHealth(prop) < GetEntityMaxHealth(prop)) then
                    PropsToDelete[#PropsToDelete+1] = prop
                end
            end
            
            success, prop = FindNextObject(handle)
        until not success
        EndFindObject(handle)
        Citizen.Wait(1500)
        for i = 1, #PropsToDelete do
            SetEntityCoords(PropsToDelete[i],0,0,0)
        end
        Citizen.Wait(500)
    end
end)

-- Afk Kicker
 local afkTimeout = 1200
 local timer = 0
 local currentPosition  = nil
 local previousPosition = nil
 local currentHeading   = nil
 local previousHeading  = nil
 local disabled = false
 Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(1000)
         if not disabled then
            playerPed = PlayerPedId()
             if playerPed then
                 currentPosition = GetEntityCoords(playerPed, true)
                 currentHeading  = GetEntityHeading(playerPed)

                 if currentPosition == previousPosition and currentHeading == previousHeading then
                     if timer > 0 then
                         if timer == math.ceil(afkTimeout / 4) then
                             TriggerEvent("DoLongHudText", "Move around or else you'll be kicked for being AFK!")
                         end

                         timer = timer - 1
                     else
                         TriggerServerEvent('afk:kick')
                     end
                 else
                     timer = afkTimeout
                 end

                 previousPosition = currentPosition
                 previousHeading  = currentHeading
             end
         end
 	end
 end)

 RegisterNetEvent("srp:afk:update")
 AddEventHandler("srp:afk:update", function(status)
     disabled = status
 end)

-- No NPC Drops
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_CARBINERIFLE'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PISTOL'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PUMPSHOTGUN'))
	end
end)


HudStage = 1
RegisterNetEvent('DoLongHudText')
AddEventHandler('DoLongHudText', function(text,color,length)
    if HudStage > 2 then return end
    if not color then color = 1 end
    if not length then length = 12000 end
    TriggerEvent("tasknotify:guiupdate",color, text, 12000)
end)

RegisterNetEvent('DoShortHudText')
AddEventHandler('DoShortHudText', function(text,color,length)
    if not color then color = 1 end
    if not length then length = 10000 end
    if HudStage > 2 then return end
    TriggerEvent("tasknotify:guiupdate",color, text, 10000)
end)


local waitKeys = false
RegisterNetEvent('car:engineHasKeys')
AddEventHandler('car:engineHasKeys', function(targetVehicle, allow)
    if IsVehicleEngineOn(targetVehicle) then
        if not waitKeys then
            waitKeys = true
            SetVehicleEngineOn(targetVehicle,0,1,1)
            SetVehicleUndriveable(targetVehicle,true)
            TriggerEvent("DoShortHudText", "Engine Halted",1)
            Citizen.Wait(300)
            waitKeys = false
        end
    else
        if not waitKeys then
            waitKeys = true
            TriggerEvent("keys:startvehicle")
            TriggerEvent("DoShortHudText", "Engine Started",1)
            Citizen.Wait(300)
            waitKeys = false
        end
    end
end)

RegisterNetEvent('car:engine')
AddEventHandler('car:engine', function()
    local targetVehicle = GetVehiclePedIsUsing(PlayerPedId())
    TriggerEvent("keys:hasKeys", 'engine', targetVehicle)
end)

-- Pop Tires If To High
local highestZ = 0
Citizen.CreateThread(function()
        local waittime = 100
        while true do
            Citizen.Wait(waittime)
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(veh) and not IsEntityDead(veh) then
                local model = GetEntityModel(veh)
                if not IsThisModelABoat(model) and not IsThisModelAHeli(model) and not IsThisModelAPlane(model) then
                    local vehpos = GetEntityCoords(veh)
					if IsEntityInAir(veh) then
						--print(vehpos.z)
                        waittime = 0
                        if vehpos.z > highestZ then
							highestZ = vehpos.z
							--print(highestZ)
                        end
                        DisableControlAction(0, 59)
                        DisableControlAction(0, 60)
					else						
						if highestZ - vehpos.z >= 16 then
						--	print(highestZ-vehpos.z)
                            local wheels = {0,1,4,5}
                            for i=1, math.random(2) do
								local wheel = math.random(#wheels)
								--print('pop')
                                SetVehicleTyreBurst(veh, wheels[wheel], false, 1000.0)
                                table.remove(wheels, wheel)
                            end
                            highestZ = 0
							waittime = 100
						end
						if highestZ - vehpos.z >= 16 then
						--	print(highestZ-vehpos.z)
                            for i = 0, 5 do
								if not IsVehicleTyreBurst(veh, i, true) or IsVehicleTyreBurst(veh, i, false) then
								--	print('popall')
                                    SetVehicleTyreBurst(veh, i, false, 1000.0)
                                end 
                            end
                            highestZ = 0
                            waittime = 100                           
                        else
                            highestZ = 0
                            waittime = 100
                        end
                    end
                end
            end
        end
	end)

    -- Ai Agression

    local relationshipTypes = {
        "PLAYER",
        "COP",
        "MISSION2",
        "MISSION3",
        "MISSION4",
        "MISSION5",
        "MISSION6",
        "MISSION7",
        "MISSION8",
      }
      
      Citizen.CreateThread(function()
        while true do
        Wait(600)
            for _, group in ipairs(relationshipTypes) do
              if group == "COP" then
                SetRelationshipBetweenGroups(3, `PLAYER`,GetHashKey(group))
                SetRelationshipBetweenGroups(3, GetHashKey(group), `PLAYER`)
                SetRelationshipBetweenGroups(0, `MISSION2`,GetHashKey(group))
                SetRelationshipBetweenGroups(0, GetHashKey(group), `MISSION2`)
      
              else
                SetRelationshipBetweenGroups(0, `PLAYER`,GetHashKey(group))
                SetRelationshipBetweenGroups(0, GetHashKey(group), `PLAYER`)
                SetRelationshipBetweenGroups(0, `MISSION2`,GetHashKey(group))
                SetRelationshipBetweenGroups(0, GetHashKey(group), `MISSION2`)
              end  
            SetRelationshipBetweenGroups(5, GetHashKey(group), `MISSION8`)
          end
      
      
          SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_WEICHENG`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `PLAYER`)
          SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_FAMILY`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `PLAYER`)
          SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_BALLAS`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `PLAYER`)
      
          SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_SALVA`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `PLAYER`)
          SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_MEXICAN`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `PLAYER`)
      
      
      
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_WEICHENG`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `AMBIENT_GANG_LOST`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_FAMILY`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `AMBIENT_GANG_LOST`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_BALLAS`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `AMBIENT_GANG_LOST`)
      
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_SALVA`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `AMBIENT_GANG_LOST`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_MEXICAN`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `AMBIENT_GANG_LOST`)
      
      
      
      --WEST SIDE
          SetRelationshipBetweenGroups(1, `MISSION4`, `AMBIENT_GANG_WEICHENG`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `MISSION4`)
      
      -- MEDIC / POLICE WEST SIDE
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `MISSION2`)
          SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_WEICHENG`)
      
      
      
      --CENTRAL
          SetRelationshipBetweenGroups(1, `MISSION5`, `AMBIENT_GANG_FAMILY`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `MISSION5`)
          SetRelationshipBetweenGroups(1, `MISSION5`, `AMBIENT_GANG_BALLAS`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `MISSION5`)
      
      -- MEDIC / POLICE CENTRAL
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `MISSION2`)
          SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_BALLAS`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `MISSION2`)
          SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_FAMILY`)
      
      
      
      
      
      
      --EAST SIDE
          SetRelationshipBetweenGroups(1, `MISSION6`, `AMBIENT_GANG_SALVA`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `MISSION6`)
          SetRelationshipBetweenGroups(1, `MISSION6`, `AMBIENT_GANG_MEXICAN`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `MISSION6`)
      
      -- MEDIC / POLICE EAST SIDE
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `MISSION2`)
          SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_SALVA`)
          SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_MEXICAN`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `MISSION2`)
      
      
      
      
      
          SetRelationshipBetweenGroups(1, -86095805, `MISSION2`)
          SetRelationshipBetweenGroups(1, `MISSION2`, -86095805)
      
          SetRelationshipBetweenGroups(1,1191392768, `MISSION2`)
          SetRelationshipBetweenGroups(1, `MISSION2`,1191392768)
          
          SetRelationshipBetweenGroups(1, `MISSION2`, 45677184)
          SetRelationshipBetweenGroups(1, 45677184, `MISSION2`)
      
      
      
      
          SetRelationshipBetweenGroups(3, `PLAYER`, `MISSION7`)
          SetRelationshipBetweenGroups(3, `MISSION7`, `PLAYER`)
      
          SetRelationshipBetweenGroups(0, `MISSION7`, `COP`)
          SetRelationshipBetweenGroups(0, `COP`, `MISSION7`)
      
          SetRelationshipBetweenGroups(0, `MISSION2`, `MISSION7`)
          SetRelationshipBetweenGroups(0, `MISSION7`, `MISSION2`)
      
          SetRelationshipBetweenGroups(0, `MISSION7`, `MISSION7`)
      
          SetRelationshipBetweenGroups(3, `COP`,`PLAYER`)
          SetRelationshipBetweenGroups(3, `PLAYER`, `COP`)
      
          SetRelationshipBetweenGroups(0, `PLAYER`, `MISSION3`)
          SetRelationshipBetweenGroups(0, `MISSION3`,`PLAYER`)
      
          -- LOST MC
          SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_LOST`)
          SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `PLAYER`)
          SetRelationshipBetweenGroups(1,  `COP`, `AMBIENT_GANG_LOST`)
          SetRelationshipBetweenGroups(1,  `AMBIENT_GANG_LOST`, `COP`)
      
        end
      end)
      
      RegisterNetEvent('gangs:setDefaultRelations')
      AddEventHandler("gangs:setDefaultRelations",function() 
          Citizen.Wait(1000)
          for _, group in ipairs(relationshipTypes) do
            SetRelationshipBetweenGroups(0, `PLAYER`,GetHashKey(group))
            SetRelationshipBetweenGroups(0, GetHashKey(group), `PLAYER`)
            SetRelationshipBetweenGroups(0, `MISSION2`,GetHashKey(group))
            SetRelationshipBetweenGroups(0, GetHashKey(group), `MISSION2`)
            
            SetRelationshipBetweenGroups(5, GetHashKey(group), `MISSION8`)
          end
          -- mission 7 is guards at vinewood and security guards
          SetRelationshipBetweenGroups(3, `PLAYER`, `MISSION7`)
          SetRelationshipBetweenGroups(3, `MISSION7`, `PLAYER`)
      
          SetRelationshipBetweenGroups(0, `MISSION7`, `COP`)
          SetRelationshipBetweenGroups(0, `COP`, `MISSION7`)
      
          SetRelationshipBetweenGroups(0, `MISSION2`, `MISSION7`)
           SetRelationshipBetweenGroups(0, `MISSION7`, `MISSION2`)
      
          SetRelationshipBetweenGroups(0, `MISSION7`, `MISSION7`)
      
      
      
      
          -- players love each other even if full hatred
          SetRelationshipBetweenGroups(0, `PLAYER`, `MISSION8`)
      
          -- cops from scenarios love cops and ems logged in
          SetRelationshipBetweenGroups(0, `COP`, `MISSION2`)
      
          -- players love cops and ems
          SetRelationshipBetweenGroups(0, `PLAYER`, `MISSION2`)
      
          SetRelationshipBetweenGroups(0, `PLAYER`, `MISSION3`)
          SetRelationshipBetweenGroups(0, `MISSION3`,`PLAYER`)
      end)

      -- Roll Up And Down Windows
      RegisterNetEvent("RollUpWindow")
AddEventHandler('RollUpWindow', function()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
        SetEntityAsMissionEntity(playerCar, true, true)
		if (GetPedInVehicleSeat(playerCar, -1) == playerPed) then 
				RollUpWindow(playerCar, 0)
            else if (GetPedInVehicleSeat(playerCar, 0) == playerPed) then 
                RollUpWindow(playerCar, 1)
                else if (GetPedInVehicleSeat(playerCar, 1) == playerPed) then 
                    RollUpWindow(playerCar, 2)
                    else if (GetPedInVehicleSeat(playerCar, 2) == playerPed) then 
                        RollUpWindow(playerCar, 3)
                    end
                end
            end
		end
	end
end)

RegisterNetEvent("RollDownWindow")
AddEventHandler('RollDownWindow', function()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
        SetEntityAsMissionEntity(playerCar, true, true)
		if (GetPedInVehicleSeat(playerCar, -1) == playerPed) then 
				RollDownWindow(playerCar, 0)
            else if (GetPedInVehicleSeat(playerCar, 0) == playerPed) then 
                RollDownWindow(playerCar, 1)
                else if (GetPedInVehicleSeat(playerCar, 1) == playerPed) then 
                    RollDownWindow(playerCar, 2)
                    else if (GetPedInVehicleSeat(playerCar, 2) == playerPed) then 
                        RollDownWindow(playerCar, 3)
                    end
                end
            end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not isHancuffed and not isDead and IsControlJustPressed(0, 27) then
            TriggerEvent("RollUpWindow")
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not isHancuffed and not isDead and IsControlJustPressed(0, 173) then
            TriggerEvent("RollDownWindow")
        end
    end
end)



RegisterCommand("cid", function(source, args)
    local cid = exports["isPed"]:isPed("cid")
    TriggerEvent("DoLongHudText", "Your CID: "..cid)
end)