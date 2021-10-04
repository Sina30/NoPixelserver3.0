Spawn.defaultSpawns = {
	[1] =  { ["pos"] = vector4(272.16, 185.44, 104.67, 320.57), ['info'] = ' Vinewood Blvd Taxi Stand'},
	[2] =  { ["pos"] = vector4(-1833.96, -1223.5, 13.02, 310.63), ['info'] = ' The Boardwalk'},
	[3] =  { ["pos"] = vector4(145.62, 6563.19, 32.0, 42.83), ['info'] = ' Paleto Gas Station'},
	[4] =  { ["pos"] = vector4(-214.24, 6178.87, 31.17, 40.11), ['info'] = ' Paleto Bus Stop'},
	[5] =  { ["pos"] = vector4(1122.11, 2667.24, 38.04, 180.39), ['info'] = ' Harmony Motel'},
	[6] =  { ["pos"] = vector4(453.29, -662.23, 28.01, 5.73), ['info'] = ' LS Bus Station'},
	[7] =  { ["pos"] = vector4(-1266.53, 273.86, 64.66, 28.52), ['info'] = ' The Richman Hotel'},
}

Spawn.motel = {
	[1] = { ["pos"] = vector4(-270.13,-957.28,31.23, 166.11), ['info'] = ' Apartments 1'},
	[2] = { ["pos"] = vector4(-1236.27,-860.84,12.91,213.56), ['info'] = ' Apartments 2'},
	[3] = { ["pos"] = vector4(173.96, -631.29, 47.08, 303.12), ['info'] = ' Apartments 3'}
}

Spawn.housingCoords = nil
Spawn.isNew = false

Spawn.tempHousing = {}
Spawn.defaultApartmentSpawn = {}

RegisterNetEvent('spawn:clientSpawnData') 
AddEventHandler('spawn:clientSpawnData', function(spawnData)
		
		Login.Selected = false
	    Login.CurrentPedInfo = nil
	    Login.CurrentPed = nil
	    Login.CreatedPeds = {}

		Login.SetTestCam()
		DoScreenFadeIn(1)
		
		--TriggerServerEvent("kGetWeather")
	
		if spawnData.hospital.illness == "dead" or spawnData.hospital.illness == "icu" then
			return 
		end

		if spawnData.overwrites ~= nil then
			if spawnData.overwrites == "jail" or spawnData.overwrites == "maxsec" or spawnData.overwrites == "rehab" then
				Spawn.overwriteSpawn(spawnData.overwrites)
			elseif spawnData.overwrites == "new" then
				Spawn.isNew = true 
				Spawn.selectedSpawn(' Apartments 1')
				-- Spawn.selectedSpawn(' Vinewood Blvd Taxi Stand')
				-- TriggerEvent("ab-spawn:firstspawnyo")
			end
			return
		end

		SendNUIMessage({
			showSpawnMenu = true,
		})

		--[[if Spawn.housingCoords == nil then
			Spawn.housingCoords = exports["ab-housing"]:retriveHousingTable();
		end]]
		
		local currentSpawns = Spawn.shallowCopy(Spawn.defaultSpawns)
		local currentCheckList = {}

		currentSpawns[#currentSpawns + 1] = Spawn.getDevSpawn()
		currentSpawns[#currentSpawns + 1] = Spawn.getRoosterSpawn()
		currentSpawns[#currentSpawns + 1] = Spawn.motel[spawnData.motelRoom.roomType]
		Spawn.defaultApartmentSpawn = spawnData.motelRoom
		Spawn.tempHousing = {}

		for k,v in pairs(spawnData.houses) do
			local data = Spawn.createDefaultData(k)
			currentSpawns[#currentSpawns + 1] = data
			Spawn.tempHousing[#Spawn.tempHousing+1] = data
			currentCheckList[k] = true
		end



		for k,v in pairs(spawnData.keys) do
			if not currentCheckList[k] then
				currentSpawns[#currentSpawns + 1] = Spawn.createDefaultData(k)
			end
		end

		
		-- fuck json , makes me only send the info of the table :( , json does not support vector4 kek
		local infoTable = {}
		for i=1,#currentSpawns do
			local spawn = currentSpawns[i]
			infoTable[i] = {["info"] = spawn.info,["posX"] = spawn.pos.x,["posY"] = spawn.pos.y,["checkS"] = i}	
		end


		local fav = exports["storage"]:tryGet("string","npfavorite")
		if fav == nil then fav = "" end

		local fonund = false
		for k,v in pairs(currentSpawns) do
			if fav == v.info then fonund = true end
		end

		if not fonund then fav = "" end

		Wait(200)
		SetNuiFocus(true,true)
		SendNUIMessage({
			updateSpawnMenu = true,
			spawns = infoTable,
			fav = fav
		})

		Spawn.housingCoords = nil
end)

RegisterNetEvent("ab-spawn:firstspawnyo")
AddEventHandler("ab-spawn:firstspawnyo", function()
    if GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01") then
        TriggerEvent("ab-spawn:finishedClothingstuffbish")
    else
        TriggerEvent("ab-spawn:finishedClothingstuff")
    end
end)

RegisterNetEvent('ab-spawn:finishedClothingstuff')
AddEventHandler('ab-spawn:finishedClothingstuff', function()
	RequestCutsceneWithPlaybackList('mp_intro_concat',31,8)

	SetEntityCoords(GetPlayerPed(-1), -1146.89, -1655.06, 4.38)
	FreezeEntityPosition(GetPlayerPed(-1), false)
	while not HasCutsceneLoaded() do
		Citizen.Wait(1)
		print('not loaded')
	end
	SetCutsceneEntityStreamingFlags('MP_Male_Character', 0, 1)
    local female = RegisterEntityForCutscene(0,"MP_Female_Character",3,0,64)
    
    RegisterEntityForCutscene(GetPlayerPed(-1), 'MP_Male_Character', 0, GetEntityModel(GetPlayerPed(-1)), 64)
    GetEntityIndexOfCutsceneEntity('MP_Female_Character', GetHashKey(GetEntityModel('MP_Female_Character')))
    NetworkSetEntityInvisibleToNetwork(female, true)
	StartCutscene(
		0 
	)
	DoScreenFadeIn(0)  
	Citizen.CreateThread(function()
        while true do
            Wait(0)    
			if IsCutsceneActive() then 
				Wait(100)
			else
				SetEntityCoords(GetPlayerPed(-1), 199.40014648438,-929.05792236328,30.691421508789)
				FreezeEntityPosition(GetPlayerPed(-1), true)
				Wait(3000)
				FreezeEntityPosition(GetPlayerPed(-1), false)
				if not exports["ab-inventory"]:hasEnoughOfItem("idcard",1,false) then
					TriggerEvent("player:receiveItem","idcard",1,true)
				end
				if not exports["ab-inventory"]:hasEnoughOfItem("mobilephone",1,false)then
					TriggerEvent("player:receiveItem","mobilephone",1)
				end
				break
			end
        end
    end)
--	Wait(142000)
--	StopCutsceneImmediately()
--	RemoveCutscene()
end)

RegisterNetEvent('ab-spawn:finishedClothingstuffbish')
AddEventHandler('ab-spawn:finishedClothingstuffbish', function()
	RequestCutsceneWithPlaybackList('mp_intro_concat',103,8)

	SetEntityCoords(GetPlayerPed(-1), -1146.89, -1655.06, 4.38)
	FreezeEntityPosition(GetPlayerPed(-1), false)
	while not HasCutsceneLoaded() do
		Citizen.Wait(1)
		print('not loaded')
	end
	SetCutsceneEntityStreamingFlags('MP_Female_Character', 0, 1)
    local male = RegisterEntityForCutscene(0,"MP_Male_Character",3,0,64)
    
    RegisterEntityForCutscene(GetPlayerPed(-1), 'MP_Female_Character', 0, GetEntityModel(GetPlayerPed(-1)), 64)
    GetEntityIndexOfCutsceneEntity('MP_Male_Character', GetHashKey(GetEntityModel('MP_Male_Character')))
    NetworkSetEntityInvisibleToNetwork(male, true)
	StartCutscene(
		0 
	)
	DoScreenFadeIn(0)
	Citizen.CreateThread(function()
        while true do
            Wait(0)    
			if IsCutsceneActive() then 
				Wait(100)
			else
				SetEntityCoords(GetPlayerPed(-1), 199.40014648438,-929.05792236328,30.691421508789)
				FreezeEntityPosition(GetPlayerPed(-1), true)
				Wait(5000)
				FreezeEntityPosition(GetPlayerPed(-1), false)
				if not exports["ab-inventory"]:hasEnoughOfItem("idcard",1,false) then
					TriggerEvent("player:receiveItem","idcard",1,true)
				end
				if not exports["ab-inventory"]:hasEnoughOfItem("mobilephone",1,false)then
					TriggerEvent("player:receiveItem","mobilephone",1)
				end
				break
			end
        end
    end)
end)



function round(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end

function Login.SetTestCam()
	--LoginSafe.Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
	local camCoords = {-3968.85, 2015.93,502.22 }
	SetCamRot(LoginSafe.Cam, -90.0, 0.0, 250.0, 2)
	SetCamCoord(LoginSafe.Cam, camCoords[1], camCoords[2], camCoords[3])
	StopCamShaking(LoginSafe.Cam, true)
	SetCamFov(LoginSafe.Cam, 50.0)
	SetCamActive(LoginSafe.Cam, true)
	RenderScriptCams(true, false, 0, true, true)
end



function Spawn.getDevSpawn()
	local spawn = nil


	local devspawn = exports["storage"]:tryGet("vector4","devspawn")
	if devspawn then
		spawn = { ["pos"] = devspawn, ['info'] = 'Dev Spawn'}
	end

	return spawn
end


function Spawn.getRoosterSpawn()
	local spawn = nil


	local rooster = exports["isPed"]:GroupRank("rooster_academy")
	if rooster >= 2 then
		spawn = { ["pos"] = vector4(-172.83,331.17,93.76,266.08), ['info'] = ' Rooster Cab'}
	end

	return spawn
end

function Spawn.createDefaultData(housing_id)
	local defaultData = nil

	if Spawn.housingCoords == nil or Spawn.housingCoords[housing_id] == nil then return end
	if Spawn.housingCoords[housing_id].assigned then return end

	local housing = Spawn.housingCoords[housing_id]
	defaultData = {["pos"] = vector4(housing[1]),["info"] = housing.Street}

	return defaultData
end



function Spawn.selectedSpawn(spawnInfo)

	if spawnInfo == nil or spawnInfo == "" or type(spawnInfo) ~= "string" then
		return
	end

	Login.DeleteCamera()
	SetNuiFocus(false,false)
	TriggerEvent("inSpawn",false)
	local apartment = Spawn.obtainApartmentType(spawnInfo)
	if apartment then
		DoScreenFadeOut(2)
		TriggerServerEvent("apartment:serverApartmentSpawn",apartment,Spawn.isNew,nil,true)
	else
		local pos = Spawn.obtainWorldSpawnPos(spawnInfo)
		if pos then
			SetEntityCoords(PlayerPedId(),pos.x,pos.y,pos.z)
			SetEntityHeading(PlayerPedId(),pos.w)

			doCamera(pos.x,pos.y,pos.z)
			DoScreenFadeOut(2)

			Login.DeleteCamera()
			
			Wait(200)
			
			TriggerServerEvent("apartment:serverApartmentSpawn",Spawn.defaultApartmentSpawn.roomType,Spawn.isNew,nil,false)
			DoScreenFadeIn(2500)
			TriggerEvent("ab-spawn:characterSpawned")
			TriggerEvent("ab-spawn:characterSpawned")
		else 

			local pos = Spawn.obtainHousingPos(spawnInfo)
			if pos then

				doCamera(pos.x,pos.y,pos.z)
				DoScreenFadeOut(2)

				Login.DeleteCamera()
				SetEntityCoords(PlayerPedId(),pos.x,pos.y,pos.z)
				SetEntityHeading(PlayerPedId(),pos.w)
				Wait(200)

				DoScreenFadeIn(2500)	
				Login.characterSpawned()
				TriggerEvent("housing:playerSpawned",spawnInfo)

			end
		end
 	end
	
	isNear = false
 	Spawn.tempHousing  = {}
end


function Spawn.overwriteSpawn(overwrite)

	local pos = vector4(1802.51,2607.19,46.01,93.0) -- default prison 

	if overwrite == "maxsec" then
		pos = vector4(1690.75,2593.14,45.61,178.75)
	elseif overwrite == "rehab" then
		pos = vector4(-1475.86,884.47,182.93,93.0)
	end

	Login.DeleteCamera()
	SetNuiFocus(false,false)
 	doCamera(pos.x,pos.y,pos.z)
 	Wait(300)
	DoScreenFadeOut(2)
	Login.DeleteCamera()

	TriggerServerEvent("jail:characterFullySpawend")

	Wait(200)

	DoScreenFadeIn(2500)	
	Login.characterSpawned()
end

cam = 0
function doCamera(x,y,z)

	DoScreenFadeOut(1)
	if(not DoesCamExist(cam)) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	end

	i = 3200
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
	SetCamActive(cam,  true)
	RenderScriptCams(true,  false,  0,  true,  true)
	DoScreenFadeIn(1500)
	local camAngle = -90.0
	while i > 1 do
		local factor = i / 50
		if i < 1 then i = 1 end
		i = i - factor
		SetCamCoord(cam, x,y,z+i)
		if i < 1200 then
			DoScreenFadeIn(600)
		end
		if i < 90.0 then
			camAngle = i - i - i
		end
		SetCamRot(cam, camAngle, 0.0, 0.0)
		Citizen.Wait(2/i)
	end

end