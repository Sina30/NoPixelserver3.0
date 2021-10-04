Build.CurrentInstanceID = -1
Build.CurrentInstance = nil
Build.Players = {}
Build.playerped = nil
Build.plyCoords = nil

Build.loadDistance = 150
Build.InstanceDistance = 100
Build.InstanceEnterPos = nil


RegisterNetEvent('Instance:setCurrentInstance')
AddEventHandler('Instance:setCurrentInstance', function(instanceID,instance)
	Build.CurrentInstanceID = instanceID
	Build.CurrentInstance = instance
	

	if instanceID == -1 then 
		Build.func.ClearPedOfAllInstancing()
	end

	print("ID: "..instanceID)
	print("Table: "..json.encode(instance))
end)


Citizen.CreateThread(function() 
	Build.func.ClearPedOfAllInstancing()
	Build.playerped = PlayerPedId()

    while true do
		Build.plyCoords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(GetActivePlayers()) do
			local target = GetPlayerPed(v)
			local targetCoords = GetEntityCoords(target)
			local distance = Build.func.getDistanceIgnoreZ(Build.plyCoords,targetCoords)

			if distance < Build.loadDistance and target ~= Build.playerped and target ~= nil then
				Build.Players[GetPlayerServerId(v)] = v
			end
		end

		Wait(5000)
		Build.func.WipePrevInstances()
    end
end)

Citizen.CreateThread(function()
    while true do
    	Build.plyCoords = GetEntityCoords(PlayerPedId())
    	--print("Target List "..json.encode(Build.Players))

    	
        for i, target in pairs(Build.Players) do
			--print("curInstance : ",i," Trget : ",target)
        	if Build.CurrentInstance ~= nil and Build.CurrentInstance[i] then
				--print("Player : "..i.." , Target : ",target)
        		local targetped = GetPlayerPed(target)
				local targetCoords = GetEntityCoords(targetped)
				local distance = Build.func.getDistanceIgnoreZ(Build.plyCoords,targetCoords)

				if distance < Build.InstanceDistance then
					--print("Making src "..i.." visiable due to in range of normal")
					NetworkConcealPlayer(target,false,false)
				else
					--print("Making src "..i.." invisiable due to out of range of normal")
					NetworkConcealPlayer(target,true,false)
				end
			else
				if Build.CurrentInstanceID ~= -1 then
					--print("Making src "..i.." invisiable due to not being in instance")
					NetworkConcealPlayer(target,true,false)
				end
			end

        end

        Wait(1000)
    end
end)



function Build.func.getDistanceIgnoreZ(vec1,vec2)
	local holdVec1 = vector3(vec1.x,vec1.y,0.0)
	local holdVec2 = vector3(vec2.x,vec2.y,0.0)
	local distance = #(holdVec1 - holdVec2)


	return distance
end


function Build.func.WipePrevInstances()
	Build.plyCoords = GetEntityCoords(PlayerPedId())

	for i,v in pairs(Build.Players) do
		local target = GetPlayerPed(v)
		local targetCoords = GetEntityCoords(target)

		local distance = Build.func.getDistanceIgnoreZ(Build.plyCoords,targetCoords)

		if distance > Build.InstanceDistance then
			print("Making src "..i.." visiable due to out of range")
			NetworkConcealPlayer(v,false,false)
		end
			
	end

	Build.Players = {}

end

function Build.func.ClearPedOfAllInstancing()
	Build.plyCoords = GetEntityCoords(PlayerPedId())
	for k,v in pairs(GetActivePlayers()) do
		NetworkConcealPlayer(v,false,false)
	end
end



function Build.func.enterInstancedBuilding(plan,genID)

	if type(genID) == "number" then
        TriggerServerEvent("Instance:addToInstance",genID)
    else
    	return false
    end

    Build.InstanceEnterPos = GetEntityCoords(PlayerPedId())

	SetEntityCoords(PlayerPedId(),plan.origin)

	if plan.darken then
		Build.func.CleanUpPeds()
		TriggerEvent("inhotel",true)
	end
		
    return false
end

function Build.func.exitInstancedBuilding(plan)
	TriggerServerEvent("Instance:removeFromInstance")

	if plan.darken then
		TriggerEvent("inhotel",false)
	end

	if Build.InstanceEnterPos ~= nil then
		SetEntityCoords(PlayerPedId(),Build.InstanceEnterPos)
		Build.InstanceEnterPos = nil
	end
end

function Build.func.GetCurrentInstanceID()
	return Build.CurrentInstanceID
end

function Build.func.GetCurrentInstance()
	return Build.CurrentInstance
end

