Build.CurrentRoomPlan = nil
Build.StartingPos = nil
Build.CurrentBuildingOrigin = nil

Build.DefaultBuilding = nil


function Build.func.CleanUpPeds()
    local playerped = PlayerPedId()
    local plycoords = GetEntityCoords(playerped)
    local handle, ObjectFound = FindFirstPed()
    local success
    repeat
        local pos = GetEntityCoords(ObjectFound)
        local distance = #(plycoords - pos)
        if distance < 50.0 and ObjectFound ~= playerped then
    		if IsPedAPlayer(ObjectFound) or IsEntityAVehicle(ObjectFound) then
    		else
    			DeleteEntity(ObjectFound)
    		end            
        end
        success, ObjectFound = FindNextPed(handle)
    until not success
    EndFindPed(handle)
end

function Build.func.CleanUpArea()
    local playerped = PlayerPedId()
    local plycoords = GetEntityCoords(playerped)
    local handle, ObjectFound = FindFirstObject()
    local success
    repeat
        local pos = GetEntityCoords(ObjectFound)
        local distance = #(plycoords - pos)
        if distance < 50.0 and ObjectFound ~= playerped then
        	if IsEntityAPed(ObjectFound) then
        		if IsPedAPlayer(ObjectFound) then
        		else
        			DeleteObject(ObjectFound)
        		end
        	else
        		if not IsEntityAVehicle(ObjectFound) and not IsEntityAttached(ObjectFound) then
	        		DeleteObject(ObjectFound)
	        	end
        	end            
        end
        success, ObjectFound = FindNextObject(handle)
    until not success
    EndFindObject(handle)

	TriggerEvent("inhotel",false)
end



function Build.func.GetOffsets(vect,num,multi,numMultiplier)
    local genAdd = vect

    if num ~= 0 then
        if multi ~= 0 then
            genAdd = num + ((numMultiplier * multi))
        else
            genAdd = num
        end
    end

    return genAdd
end


function Build.func.OffsetsModulo(vect,multi,numMultiplier,xLimit,yLimit)

    local generator = {x = 0.0,y = 0.0,z = 0.0}
    
    local modulo = numMultiplier % xLimit
    
    
    yOffset = math.ceil(numMultiplier / xLimit)
    zOffset = math.ceil(numMultiplier / (yLimit*xLimit))
    
    if modulo == 0 then
    	modulo = numMultiplier / yOffset
    end
    local yModulo = (yOffset % yLimit) + 1
    
    
    modulo = modulo + 0.0
    yOffset = yOffset + 0.0
    
    generator.x = (vect[1]) + ((modulo * multi.x))
    generator.y = (vect[2]) + ((yModulo * multi.y))
    generator.z = (vect[3]) + ((zOffset * multi.z))

    return vector3(generator.x,generator.y,generator.z)
end

function Build.func.CustomPointSpawn(numMultiplier,plan)

    local gen = vector3(0.0,0.0,0.0)
    for k,v in pairs(plan.customLocations) do
        if  numMultiplier > v.numMulStart and numMultiplier < v.numMulEnd then
            gen = vector3(v.gen.x,v.gen.y,v.gen.z)
            if numMultiplier < 7 then
                numMultiplier = numMultiplier - v.numMulStart
                local x,y,z
                x = Build.func.GetOffsets(gen.x,v.offSet.x,v.multi,numMultiplier)
                y = Build.func.GetOffsets(gen.y,v.offSet.y,v.multi,numMultiplier)
                z = Build.func.GetOffsets(gen.z,v.offSet.z,v.multi,numMultiplier)

                gen = vector3(x,y,z)
            end

        end
    end

    return gen
end

function Build.func.getGeneratorFromRoom(numMultiplier,currentPlan)

    local plan = currentPlan
    local generator = vector3(100.0,100.0,20.0)

    if plan.generator then 
        generator = vector3(plan.generator.x,plan.generator.y,plan.generator.z)

        if plan.offsetX ~= nil then
            local x,y,z
            x = Build.func.GetOffsets(generator.x,plan.offsetX.num,plan.offsetX.multi,numMultiplier)

            y = Build.func.GetOffsets(generator.y,plan.offsetY.num,plan.offsetY.multi,numMultiplier)

            z = Build.func.GetOffsets(generator.z,plan.offsetZ.num,plan.offsetZ.multi,numMultiplier)

            generator = vector3(x,y,z)
        elseif plan.modulo ~= nil then
            generator = Build.func.OffsetsModulo(generator,plan.modulo.multi,numMultiplier,plan.modulo.xLimit,plan.modulo.yLimit)
        else
            generator = Build.func.CustomPointSpawn(numMultiplier,plan)
        end

    end

    return generator
end

function Build.func.buildRoom(planName,positionGen,isBackdoor,destroyedObjects,spawnOveride)
    local player = PlayerPedId()
    Build.StartingPos = GetEntityCoords(player)
    FreezeEntityPosition(player,true)

    local plan = Build.Plans[planName]
    Build.CurrentRoomPlan = plan

    if plan.instance then
        FreezeEntityPosition(player,false)
        local instance = Build.func.enterInstancedBuilding(plan,positionGen)
        return instance
    end

    SetEntityCoords(player,plan.origin)


    local buildingObject = exports["ab-ytypparser"]:request(planName,plan.saveClient)
    local mainPos = vector3(0.0,0.0,0.0)
    local objectSpawnCoords = vector3(0.0,0.0,0.0)

    if type(positionGen) == "number" then
        objectSpawnCoords = Build.func.getGeneratorFromRoom(positionGen,plan)
    elseif type(positionGen) == "table" or type(positionGen) == type(vector3(0.0,0.0,0.0)) then
        objectSpawnCoords = positionGen
    end

    Build.CurrentBuildingOrigin = objectSpawnCoords

    for k,v in pairs(buildingObject) do
        if string.lower(v.name) == string.lower(plan.shell) then
            mainPos = vector3(v.x,v.y,v.z)
        end
    end

    Citizen.Wait(4000)
    if type(spawnOveride) == "vector3" then

        SetEntityCoords(player, objectSpawnCoords.x+spawnOveride.x, objectSpawnCoords.y+spawnOveride.y, objectSpawnCoords.z+spawnOveride.z)
    else
        if not isBackdoor or isBackdoor == nil then

            SetEntityCoords(player, objectSpawnCoords.x+plan.spawnOffset.x, objectSpawnCoords.y+plan.spawnOffset.y, objectSpawnCoords.z+plan.spawnOffset.z)
        else

            SetEntityCoords(player, objectSpawnCoords.x+plan.backSpawnOffset.x, objectSpawnCoords.y+plan.backSpawnOffset.y, objectSpawnCoords.z+plan.backSpawnOffset.z)
        end
    end


    Build.func.CleanUpArea()
    Build.func.CleanUpPeds()
    if planName ~= "v_int_16_high" then
        TriggerEvent("inhotel",true)
    end
    local building = CreateObject(GetHashKey(plan.shell),objectSpawnCoords.x+mainPos.x,objectSpawnCoords.y+mainPos.y,objectSpawnCoords.z,false,false,false)
    Build.func.placeObjectCorrectZ(building,(objectSpawnCoords.z+mainPos.z))
    FreezeEntityPosition(building,true)

    local holdingobjects = {}
    for k,v in pairs(buildingObject) do
        if v.name ~= plan.shell then
            local canCreate = true
            local wc = vector3(objectSpawnCoords.x+v.x,objectSpawnCoords.y+v.y,objectSpawnCoords.z+v.z)
            if destroyedObjects ~= nil and destroyedObjects[v.name] ~= nil then
                for u,i in pairs(destroyedObjects[v.name]) do
                    if #(wc-i) <= 1.0 then
                        canCreate = false
                    end
                end 
            end

            if canCreate then
                holdingobjects[k] = CreateObject(GetHashKey(v.name),wc.x,wc.y,wc.z,false,false,false)
                
                Build.func.placeObjectCorrectZ(holdingobjects[k],(objectSpawnCoords.z+v.z))
                SetEntityQuaternion(holdingobjects[k], v.rx, v.ry, v.rz, v.rw*-1)
                FreezeEntityPosition(holdingobjects[k],true)
            end

        else
            SetEntityQuaternion(building, v.rx, v.ry, v.rz, v.rw*-1)
        end
    end

    local safe = Build.func.FloatTilSafe(building)

    DoScreenFadeIn(1000)
    FreezeEntityPosition(player,false)


    TriggerEvent("build:event:inside",true)
    TriggerServerEvent("build:event:inside",true)

    if safe then
        return objectSpawnCoords
    else
        TriggerEvent("inhotel",false)
        --SetEntityCoords(player,Build.StartingPos)
        Build.CurrentRoomPlan = nil
        Build.StartingPos = nil
        Build.CurrentBuildingOrigin = nil

        Build.DefaultBuilding = nil
        return false
    end

end


function Build.func.exitCurrentRoom(overrideVector)
    local plan = Build.CurrentRoomPlan

    if plan ~= nil then
        if plan.instance then
            local instance = Build.func.exitInstancedBuilding(plan)
            return true
        end

        Build.func.CleanUpPeds()
        Build.func.CleanUpArea()


        if overrideVector ~= nil then
            SetEntityCoords(PlayerPedId(),overrideVector)
        else
            if Build.StartingPos ~= nil then
                SetEntityCoords(PlayerPedId(),Build.StartingPos)
            end
        end

        Build.CurrentRoomPlan = nil
        Build.StartingPos = nil
        Build.CurrentBuildingOrigin = nil
        Build.DefaultBuilding = nil

        TriggerEvent("build:event:inside",false)
        TriggerServerEvent("build:event:inside",false)
    end

end

function Build.func.placeObjectCorrectZ(object,z)
    local dist = 0.0

    local d1,d2 = GetModelDimensions(GetEntityModel(object))
    local pos = GetEntityCoords(object)
    local bot = GetOffsetFromEntityInWorldCoords(object, 0.0,0.0,d1["z"])

    local newZ = z + (pos-bot)
    
    SetEntityCoords(object, pos.x, pos.y,newZ)
end

function Build.func.FloatTilSafe(buildingObject)
    SetEntityInvincible(PlayerPedId(),true)
    FreezeEntityPosition(PlayerPedId(),true)

    local count = 500

    while count > 0 do
        Wait(500)
        if HasCollisionLoadedAroundEntity(PlayerPedId()) == 1 and HasCollisionForModelLoaded(GetEntityModel(buildingObject)) == 1 and HasModelLoaded(GetEntityModel(buildingObject)) == 1 then
            count = -9
        end
        count = count -1
    end

    if count <= -9 then return true else return false end
end




function Build.func.getRobLocationsForObjects(planName,positionGen,robinfo)
    local plan = Build.Plans[planName]

    if plan.instance then
        return false
    end


    local buildingObject = exports["ab-ytypparser"]:request(planName,plan.saveClient)
    local objectSpawnCoords = vector3(0.0,0.0,0.0)


    if type(positionGen) == "table" or type(positionGen) == type(vector3(0.0,0.0,0.0)) then
        objectSpawnCoords = positionGen
    else
        return false
    end

    local robObjects = {}
    local index1 = 1
    for k,v in pairs(buildingObject) do
        if v.name ~= plan.shell then
            if robinfo[v.name] ~= nil and robinfo[v.name] ~= "" then
                robObjects[index1] = {["pos"] = vector3(objectSpawnCoords.x+v.x,objectSpawnCoords.y+v.y,objectSpawnCoords.z+v.z),["id"] = v.name}
                index1 = index1 + 1
            end

        end
    end

    return robObjects
end
