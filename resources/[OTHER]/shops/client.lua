local vendingMachines = {
	[1] = 690372739,
	[2] = 1114264700,
	[3] = 690372739, 
	[4] = -2015792788,
	[5] = -1318035530,
	[6] = 73774428, 
	[7] = -1317235795, 
	[8] = -654402915,
}

local methlocation = { ['x'] = 1763.75,['y'] = 2499.44,['z'] = 50.43,['h'] = 213.58, ['info'] = ' cell1' }
------------------------------
--FONCTIONS
-------------------------------
local cellcoords = { 
	[1] =  { ['x'] = 1763.75,['y'] = 2499.44,['z'] = 50.43,['h'] = 213.58, ['info'] = ' cell1' },
	[2] =  { ['x'] = 1761.18,['y'] = 2497.56,['z'] = 50.43,['h'] = 208.44, ['info'] = ' cell2' },
	[3] =  { ['x'] = 1758.35,['y'] = 2495.69,['z'] = 50.43,['h'] = 201.86, ['info'] = ' cell3' },
	[4] =  { ['x'] = 1755.23,['y'] = 2494.2,['z'] = 50.43,['h'] = 202.71, ['info'] = ' cell4' },
	[5] =  { ['x'] = 1752.35,['y'] = 2492.39,['z'] = 50.43,['h'] = 201.77, ['info'] = ' cell5' },
	[6] =  { ['x'] = 1749.21,['y'] = 2490.48,['z'] = 50.43,['h'] = 212.78, ['info'] = ' cell6' },
	[7] =  { ['x'] = 1745.86,['y'] = 2488.94,['z'] = 50.43,['h'] = 213.06, ['info'] = ' cell7' },
	[8] =  { ['x'] = 1743.28,['y'] = 2486.98,['z'] = 50.43,['h'] = 212.35, ['info'] = ' cell8' },
	[9] =  { ['x'] = 1743.2,['y'] = 2486.85,['z'] = 45.82,['h'] = 212.24, ['info'] = ' cell9' },
	[10] =  { ['x'] = 1745.87,['y'] = 2489.08,['z'] = 45.82,['h'] = 208.68, ['info'] = ' cell10' },
	[11] =  { ['x'] = 1748.99,['y'] = 2490.77,['z'] = 45.82,['h'] = 202.26, ['info'] = ' cell11' },
	[12] =  { ['x'] = 1752.14,['y'] = 2492.47,['z'] = 45.82,['h'] = 208.49, ['info'] = ' cell12' },
	[13] =  { ['x'] = 1755.08,['y'] = 2494.0,['z'] = 45.82,['h'] = 212.58, ['info'] = ' cell13' },
	[14] =  { ['x'] = 1761.12,['y'] = 2497.27,['z'] = 45.83,['h'] = 215.37, ['info'] = ' cell14' },
	[15] =  { ['x'] = 1763.93,['y'] = 2499.34,['z'] = 45.83,['h'] = 217.65, ['info'] = ' cell15' },
	[16] =  { ['x'] = 1772.74,['y'] = 2482.72,['z'] = 50.43,['h'] = 24.74, ['info'] = ' cell16' },
	[17] =  { ['x'] = 1769.67,['y'] = 2480.9,['z'] = 50.43,['h'] = 29.66, ['info'] = ' cell17' },
	[18] =  { ['x'] = 1766.94,['y'] = 2479.04,['z'] = 50.43,['h'] = 32.87, ['info'] = ' cell18' },
	[19] =  { ['x'] = 1763.79,['y'] = 2477.64,['z'] = 50.42,['h'] = 22.54, ['info'] = ' cell19' },
	[20] =  { ['x'] = 1760.55,['y'] = 2476.16,['z'] = 50.42,['h'] = 38.85, ['info'] = ' cell20' },
	[21] =  { ['x'] = 1757.82,['y'] = 2473.99,['z'] = 50.42,['h'] = 32.59, ['info'] = ' cell21' },
	[22] =  { ['x'] = 1754.61,['y'] = 2472.72,['z'] = 50.42,['h'] = 38.6, ['info'] = ' cell22' },
	[23] =  { ['x'] = 1751.35,['y'] = 2470.67,['z'] = 50.42,['h'] = 31.17, ['info'] = ' cell23' },
	[24] =  { ['x'] = 1772.55,['y'] = 2483.08,['z'] = 45.82,['h'] = 33.01, ['info'] = ' cell24' },
	[26] =  { ['x'] = 1769.41,['y'] = 2481.15,['z'] = 45.82,['h'] = 32.61, ['info'] = ' cell25' },
	[27] =  { ['x'] = 1766.78,['y'] = 2478.99,['z'] = 45.82,['h'] = 27.96, ['info'] = ' cell26' },
	[28] =  { ['x'] = 1763.71,['y'] = 2477.66,['z'] = 45.82,['h'] = 33.65, ['info'] = ' cell27' },
	[29] =  { ['x'] = 1760.7,['y'] = 2475.73,['z'] = 45.82,['h'] = 30.13, ['info'] = ' cell28' },
	[30] =  { ['x'] = 1757.74,['y'] = 2473.94,['z'] = 45.82,['h'] = 29.95, ['info'] = ' cell29' },
	[31] =  { ['x'] = 1754.95,['y'] = 2471.86,['z'] = 45.82,['h'] = 40.79, ['info'] = ' cell30' },
	[32] =  { ['x'] = 1751.72,['y'] = 2470.46,['z'] = 45.82,['h'] = 13.22, ['info'] = ' cell31' },

}

local tool_shops = {
	{ ['x'] = 44.838947296143, ['y'] = -1748.5364990234, ['z'] = 29.549386978149 },
	{ ['x'] = 2749.2309570313, ['y'] = 3472.3308105469, ['z'] = 55.679393768311 },
}

local twentyfourseven_shops = {
	{ ['x'] = 25.925277709961, ['y'] = -1347.4022216797, ['z'] = 29.482055664062},
    { ['x'] = -48.34285736084, ['y'] = -1757.7890625, ['z'] = 29.414672851562},
    { ['x'] = -707.9208984375, ['y'] = -914.62414550781, ['z'] = 19.20361328125},
    { ['x'] = 1135.6878662109, ['y'] = -981.71868896484, ['z'] = 46.399291992188},
    { ['x'] = -1223.6307373047, ['y'] = -906.76483154297, ['z'] = 12.312133789062},
    { ['x'] = 373.81979370117, ['y'] = 326.0439453125, ['z'] = 103.55383300781},
    { ['x'] = 1163.6439208984, ['y'] = -324.13186645508, ['z'] = 69.197021484375},
    { ['x'] = -2968.298828125, ['y'] = 390.59341430664, ['z'] = 15.041748046875},
    { ['x'] = -3242.4658203125, ['y'] = 1001.6703491211, ['z'] = 12.817626953125},
    { ['x'] = -1820.7427978516, ['y'] = 792.36926269531, ['z'] = 138.11279296875},
    { ['x'] = 2557.1472167969, ['y'] = 382.12747192383,['z'] = 108.60876464844},
    { ['x'] = 2678.8879394531, ['y'] = 3280.3911132812, ['z'] = 55.228515625},
    { ['x'] = 1961.5648193359, ['y'] = 3740.6901855469, ['z'] = 32.329711914062},
    { ['x'] = 1392.3824462891, ['y'] = 3604.5495605469, ['z'] = 34.97509765625},
    { ['x'] = 1698.158203125, ['y'] = 4924.404296875, ['z'] = 42.052001953125},
    { ['x'] = 1728.9230957031, ['y'] = 6414.3823242188, ['z'] = 35.025634765625},
    { ['x'] = 1166.4000244141, ['y'] = 2709.1647949219, ['z'] = 38.142822265625},
    { ['x'] = 547.49011230469, ['y'] = 2671.2131347656, ['z'] = 42.153076171875},
    --{ ['x'] = 460.9186706543,['y'] = -982.31207275391, ['z'] = 30.678344726562},
    --{ ['x'] = 448.23297119141, ['y'] = -973.95166015625, ['z'] = 34.958251953125},
    { ['x'] = 161.15, ['y'] = 6642.711,['z'] = 46.01171875},
}

local weashop_locations = {
	{entering = {811.973572,-2155.33862,28.8189938}, inside = {811.973572,-2155.33862,28.8189938}, outside = {811.973572,-2155.33862,28.8189938},delay = 900},
	{entering = { 1692.54, 3758.13, 34.71}, inside = { 1692.54, 3758.13, 34.71}, outside = { 1692.54, 3758.13, 34.71},delay = 600},
	{entering = {252.915,-48.186,69.941}, inside = {252.915,-48.186,69.941}, outside = {252.915,-48.186,69.941},delay = 600},
	{entering = {844.352,-1033.517,28.094}, inside = {844.352,-1033.517,28.194}, outside = {844.352,-1033.517,28.194},delay = 780},
	{entering = {-331.487,6082.348,31.354}, inside = {-331.487,6082.348,31.454}, outside = {-331.487,6082.348,31.454},delay = 600},
	{entering = {-664.268,-935.479,21.729}, inside = {-664.268,-935.479,21.829}, outside = {-664.268,-935.479,21.829},delay = 600},
	{entering = {-1305.427,-392.428,36.595}, inside = {-1305.427,-392.428,36.695}, outside = {-1305.427,-392.428,36.695},delay = 600},
	{entering = {-1119.1, 2696.92, 18.56}, inside = {-1119.1, 2696.92, 18.56}, outside = {-1119.1, 2696.92, 18.56},delay = 600},
	{entering = {2569.978,294.472,108.634}, inside = {2569.978,294.472,108.734}, outside = {2569.978,294.472,108.734},delay = 800},
	{entering = {-3172.584,1085.858,20.738}, inside = {-3172.584,1085.858,20.838}, outside = {-3172.584,1085.858,20.838},delay = 600},
	{entering = {20.0430,-1106.469,29.697}, inside = {20.0430,-1106.469,29.797}, outside = {20.0430,-1106.469,29.797},delay = 600},
}


local weashop_blips = {}

RegisterNetEvent("shop:createMeth")
AddEventHandler("shop:createMeth", function()
	methlocation = cellcoords[math.random(#cellcoords)]
end)


RegisterNetEvent("shop:isNearPed")
AddEventHandler("shop:isNearPed", function()
	local pedpos = GetEntityCoords(PlayerPedId())
	local found = false
	for k,v in ipairs(twentyfourseven_shops)do
		local dist = #(vector3(v.x, v.y, v.z) - vector3(pedpos.x,pedpos.y,pedpos.z))
		if(dist < 10 and not found)then
			found = true
			TriggerServerEvent("exploiter", "User sold to a shop keeper at store.")
		end
	end
end)

function setShopBlip()

	for station,pos in pairs(weashop_locations) do
		local loc = pos
		pos = pos.entering
		local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
		-- 60 58 137
		SetBlipSprite(blip,110)
		SetBlipScale(blip, 0.5)
		SetBlipColour(blip, 17)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Ammunation')
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip,true)
		SetBlipAsMissionCreatorBlip(blip,true)
		weashop_blips[#weashop_blips+1]= {blip = blip, pos = loc}
	end

	for k,v in ipairs(twentyfourseven_shops)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 52)
		SetBlipScale(blip, 0.5)
		SetBlipColour(blip, 0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Shop")
		EndTextCommandSetBlipName(blip)
	end

	for k,v in ipairs(tool_shops)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 643)
		SetBlipScale(blip, 0.5)
		SetBlipColour(blip, 0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Tool Shop")
		EndTextCommandSetBlipName(blip)
	end	

	---- Apartments 1-----

	modelHash = GetHashKey("a_m_y_business_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end

	ped = CreatePed(0, modelHash , -271.40979003906, -956.65411376953, 31.227432250977 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 227.97456359863)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
	---- Apartments 2-----

	modelHash = GetHashKey("a_m_y_business_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	ped = CreatePed(0, modelHash , -1237.0874023438, -859.64361572266, 12.884674072266 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 215.12763977051)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

	---- Apartments 3-----

	modelHash = GetHashKey("a_m_y_business_01")
	RequestModel(modelHash)
	while not HasModelLoaded(modelHash) do
	 	Wait(1)
	end
	
	ped = CreatePed(0, modelHash , 279.36193847656, -639.64379882812, 42.018657684326 - 1,true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetEntityHeading(ped, 118.95565795898)
	SetBlockingOfNonTemporaryEvents(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)	

end



Citizen.CreateThread(function()
	setShopBlip()
	while true do
		local found = false
		local dstscan = 3.0
		local pos = GetEntityCoords(PlayerPedId(), false)
		Citizen.Wait(1)
		if(Vdist(methlocation["x"],methlocation["y"],methlocation["z"], pos.x, pos.y, pos.z) < 10.0)then
			found = true
			if(Vdist(methlocation["x"],methlocation["y"],methlocation["z"], pos.x, pos.y, pos.z) < 5.0)then
				--TriggerEvent('ab-ui:ShowUI', 'show', ("Press [E] what dis?"))
				if IsControlJustPressed(1, 38) then
					local finished = exports["ab-taskbar"]:taskBar(60000,"Searching...")
      				if (finished == 100) and Vdist(methlocation["x"],methlocation["y"],methlocation["z"], pos.x, pos.y, pos.z) < 7.0 then
						TriggerEvent("server-inventory-open", "25", "Shop");
						Wait(1000)
					end
					--TriggerEvent("openSubMenu","burgershot")
			    end
            end
        end   
	

	end
end)


RegisterNetEvent('smelt:gold')
AddEventHandler('smelt:gold', function()
	local finished = exports["ab-taskbar"]:taskBar(10000,"Smelting...")
	if (finished == 100) then
		TriggerEvent("server-inventory-open", "17", "Craft");	
		Wait(1000)
	else
	end
end)

RegisterNetEvent('shop:general')
AddEventHandler('shop:general', function()
	TriggerEvent("server-inventory-open", "2", "Shop")
	Wait(1000)
end)

RegisterNetEvent('vending:general')
AddEventHandler('vending:general', function()
	TriggerEvent("server-inventory-open", "8", "Shop")
	Wait(1000)
end)

RegisterNetEvent('police:general')
AddEventHandler('police:general', function()
	local job = exports["isPed"]:isPed("myJob")
	if (job == "police") then
		TriggerEvent("server-inventory-open", "10", "Shop");	
		Wait(1000)
	else
	end
end)

RegisterNetEvent('toolshop:general')
AddEventHandler('toolshop:general', function()
	TriggerEvent("server-inventory-open", "4", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('den:general')
AddEventHandler('den:general', function()
	TriggerEvent("server-inventory-open", "42073", "Shop");	
	Wait(1000)
end)



RegisterNetEvent('bean:general')
AddEventHandler('bean:general', function()
	TriggerEvent("server-inventory-open", "12", "Shop");	
	Wait(1000)
end)

RegisterNetEvent('evidence:general')
AddEventHandler('evidence:general', function()
	local job = exports["isPed"]:isPed("myJob")
	if (job == "police") then
		TriggerEvent("server-inventory-open", "1", "trash-1")
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'LockerOpen', 0.4)
		Wait(1000)
	else
	end
end)

RegisterNetEvent('personallocker:general')
AddEventHandler('personallocker:general', function()
	local cid = exports["isPed"]:isPed("cid")
	local job = exports["isPed"]:isPed("myJob")
	if (job == "police") then
		TriggerEvent("server-inventory-open", "1", "personalMRPD-"..cid)
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'LockerOpen', 0.4)
		Wait(1000)
	else
	end
end)

RegisterNetEvent('prisonap:general')
AddEventHandler('prisonap:general', function()
	local finished = exports["ab-taskbar"]:taskBar(60000,"Searching...")
	if (finished == 100) then
	  	TriggerEvent("server-inventory-open", "26", "Shop");
	  	Wait(1000)
  	end
end)


RegisterNetEvent('prisonlp:general')
AddEventHandler('prisonlp:general', function()
	local finished = exports["ab-taskbar"]:taskBar(60000,"Searching...")
	if (finished == 100) then
	  	TriggerEvent("server-inventory-open", "23", "Craft");
	  	Wait(1000)
  	end
end)

RegisterNetEvent('slushy:general')
AddEventHandler('slushy:general', function()
	local finished = exports["ab-taskbar"]:taskBar(60000,"Making a god slushy...")
	if (finished == 100) then
		TriggerEvent("server-inventory-open", "27", "Shop")
		Wait(1000)
	end
end)

RegisterNetEvent('lockpickshit:general')
AddEventHandler('lockpickshit:general', function()
	local finished = exports["ab-taskbar"]:taskBar(60000,"What dis????")
	if (finished == 100) then
		TriggerEvent("server-inventory-open", "205", "Shop")
		Wait(1000)
	end
end)

RegisterNetEvent('pfood:general')
AddEventHandler('pfood:general', function()
	TriggerEvent("server-inventory-open", "22", "Shop")
	Wait(1000)
end)

RegisterNetEvent('autoe:stash')
AddEventHandler('autoe:stash', function()
	local rankT = exports["isPed"]:GroupRank("auto_exotic")
	if rankT > 0 then 
		TriggerEvent("server-inventory-open", "1", "storage-auto")
		Wait(1000)
	else
	end
end)

RegisterNetEvent('tuner:stash')
AddEventHandler('tuner:stash', function()
	local rankT = exports["isPed"]:GroupRank("tuner_carshop")
	if rankT > 0 then 
		TriggerEvent("server-inventory-open", "1", "storage-tuner")
		Wait(1000)
	else
	end
end)

RegisterNetEvent('burgershot:stash')
AddEventHandler('burgershot:stash', function()
	local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank > 0 then     
		TriggerEvent("server-inventory-open", "1", "storage-burgershot")
		Wait(1000)
	else
	end
end)

RegisterNetEvent('autoe:crafting')
AddEventHandler('autoe:crafting', function()
	local rankT = exports["isPed"]:GroupRank("auto_exotic")
	if rankT > 0 then 
		TriggerEvent("server-inventory-open", "220", "Craft");	
		Wait(1000)
	else
	end
end)

RegisterNetEvent('tuner:crafting')
AddEventHandler('tuner:crafting', function()
	local rankT = exports["isPed"]:GroupRank("tuner_carshop")
	if rankT > 0 then 
		TriggerEvent("server-inventory-open", "206", "Craft");	
		Wait(1000)
	else
	end
end)

RegisterNetEvent('burgershot:tray')
AddEventHandler('burgershot:tray', function()
    TriggerEvent("server-inventory-open", "1", "burgerjob_counter");
end)

RegisterNetEvent('burgershot:craftburger')
AddEventHandler('burgershot:craftburger', function()
	local rank = exports["isPed"]:GroupRank("burger_shot")
    if rank > 0 then     
		local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
		LoadDict(dict)
		FreezeEntityPosition(GetPlayerPed(-1),true)
		TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
		SetEntityHeading(GetPlayerPed(-1), 124.72439575195)
		local finished = exports['ab-taskbar']:taskBar(20000, 'Making Burger')
		if (finished == 100) then
    		TriggerEvent("server-inventory-open", "12", "Craft");
			FreezeEntityPosition(GetPlayerPed(-1),false)
			ClearPedTasks(GetPlayerPed(-1))
		end
	else
        TriggerEvent('DoLongHudText', 'You are not a burgershot worker!', 2)
	end
end)

RegisterNetEvent('ems:general')
AddEventHandler('ems:general', function()
	local job = exports["isPed"]:isPed("myJob")
	if (job == "ems" or job == "doctor") then
		TriggerEvent("server-inventory-open", "15", "Shop");	
	else
		TriggerEvent("server-inventory-open", "29", "Shop");	
	end
end)


RegisterNetEvent('weapon:general')
AddEventHandler('weapon:general', function()
	TriggerEvent("server-inventory-open", "5", "Shop")
	Wait(1000)
end)


RegisterNetEvent('weapon:black')
AddEventHandler('weapon:black', function()
	--local weaponslicence = exports["isPed"]:isPed("weaponslicence")
--	if weaponslicence == "1" then
		TriggerEvent("server-inventory-open", "31", "Craft");
	--	Wait(1000)
	--[[else
		TriggerEvent("server-inventory-open", "001", "Shop");
		Wait(1000)
		TriggerEvent("DoLongHudText", "You dont have an active weapons license, contact the police.", 2)
	end--]]

end)
RegisterNetEvent('illegal:cunts')
AddEventHandler('illegal:cunts', function()
	--local weaponslicence = exports["isPed"]:isPed("weaponslicence")
--	if weaponslicence == "1" then
		TriggerEvent("server-inventory-open", "105", "Craft");
	--	Wait(1000)
	--[[else
		TriggerEvent("server-inventory-open", "001", "Shop");
		Wait(1000)
		TriggerEvent("DoLongHudText", "You dont have an active weapons license, contact the police.", 2)
	end--]]

end)

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end