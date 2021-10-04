local drawable_names = {"face", "masks", "hair", "torsos", "legs", "bags", "shoes", "neck", "undershirts", "vest", "decals", "jackets"}
local prop_names = {"hats", "glasses", "earrings", "mouth", "lhand", "rhand", "watches", "braclets"}
local head_overlays = {"Blemishes","FacialHair","Eyebrows","Ageing","Makeup","Blush","Complexion","SunDamage","Lipstick","MolesFreckles","ChestHair","BodyBlemishes","AddBodyBlemishes"}
local face_features = {"Nose_Width","Nose_Peak_Hight","Nose_Peak_Lenght","Nose_Bone_High","Nose_Peak_Lowering","Nose_Bone_Twist","EyeBrown_High","EyeBrown_Forward","Cheeks_Bone_High","Cheeks_Bone_Width","Cheeks_Width","Eyes_Openning","Lips_Thickness","Jaw_Bone_Width","Jaw_Bone_Back_Lenght","Chimp_Bone_Lowering","Chimp_Bone_Lenght","Chimp_Bone_Width","Chimp_Hole","Neck_Thikness"}
tatCategory = nil
tattooHashList = nil

function Login.LoadPed(ped, data, model)
    SetClothing(ped, data.drawables, data.props, data.drawtextures, data.proptextures)
    Citizen.Wait(500)
    if (model == `mp_f_freemode_01` or model == `mp_m_freemode_01`) then
        SetPedHeadBlend(ped, data.headBlend)
        SetHeadStructure(ped, data.headStructure)
        SetHeadOverlayData(ped, data.headOverlay)
        SetPedHairColor(ped, tonumber(data.hairColor[1]), tonumber(data.hairColor[2]))
    end
    return
end


function SetClothing(ped,drawables, props, drawTextures, propTextures)
    for i = 1, #drawable_names do
        if drawables[0] == nil then
            if drawable_names[i] == "undershirts" and drawables[tostring(i-1)][2] == -1 then
                SetPedComponentVariation(ped, i-1, 15, 0, 2)
            else
                SetPedComponentVariation(ped, i-1, drawables[tostring(i-1)][2], drawTextures[i][2], 2)
            end
        else
            if drawable_names[i] == "undershirts" and drawables[i-1][2] == -1 then
                SetPedComponentVariation(ped, i-1, 15, 0, 2)
            else
                SetPedComponentVariation(ped, i-1, drawables[i-1][2], drawTextures[i][2], 2)
            end
        end
    end

    for i = 1, #prop_names do
        local propZ = (drawables[0] == nil and props[tostring(i-1)][2] or props[i-1][2])
        ClearPedProp(ped, i-1)
        SetPedPropIndex(
            ped,
            i-1,
            propZ,
            propTextures[i][2], true)
    end
end


function SetPedHeadBlend(ped,data)
    SetPedHeadBlendData(ped,
        tonumber(data['shapeFirst']),
        tonumber(data['shapeSecond']),
        tonumber(data['shapeThird']),
        tonumber(data['skinFirst']),
        tonumber(data['skinSecond']),
        tonumber(data['skinThird']),
        tonumber(data['shapeMix']),
        tonumber(data['skinMix']),
        tonumber(data['thirdMix']),
        false)
end

function SetHeadStructure(ped,data)
    for i = 1, #face_features do
        SetPedFaceFeature(ped, i-1, data[i])
    end
end

function SetHeadOverlayData(ped,data)
    if json.encode(data) ~= "[]" then
        for i = 1, #head_overlays do
            SetPedHeadOverlay(ped,  i-1, tonumber(data[i].overlayValue),  tonumber(data[i].overlayOpacity))
            -- SetPedHeadOverlayColor(ped, i-1, data[i].colourType, data[i].firstColour, data[i].secondColour)
        end

        SetPedHeadOverlayColor(ped, 0, 0, tonumber(data[1].firstColour), tonumber(data[1].secondColour))
        SetPedHeadOverlayColor(ped, 1, 1, tonumber(data[2].firstColour), tonumber(data[2].secondColour))
        SetPedHeadOverlayColor(ped, 2, 1, tonumber(data[3].firstColour), tonumber(data[3].secondColour))
        SetPedHeadOverlayColor(ped, 3, 0, tonumber(data[4].firstColour), tonumber(data[4].secondColour))
        SetPedHeadOverlayColor(ped, 4, 2, tonumber(data[5].firstColour), tonumber(data[5].secondColour))
        SetPedHeadOverlayColor(ped, 5, 2, tonumber(data[6].firstColour), tonumber(data[6].secondColour))
        SetPedHeadOverlayColor(ped, 6, 0, tonumber(data[7].firstColour), tonumber(data[7].secondColour))
        SetPedHeadOverlayColor(ped, 7, 0, tonumber(data[8].firstColour), tonumber(data[8].secondColour))
        SetPedHeadOverlayColor(ped, 8, 2, tonumber(data[9].firstColour), tonumber(data[9].secondColour))
        SetPedHeadOverlayColor(ped, 9, 0, tonumber(data[10].firstColour), tonumber(data[10].secondColour))
        SetPedHeadOverlayColor(ped, 10, 1, tonumber(data[11].firstColour), tonumber(data[11].secondColour))
        SetPedHeadOverlayColor(ped, 11, 0, tonumber(data[12].firstColour), tonumber(data[12].secondColour))
    end
end

function VecLerp(x1, y1, z1, x2, y2, z2, l, clamp)
    if clamp then
        if l < 0.0 then l = 0.0 end
        if l > 1.0 then l = 1.0 end
    end
    local x = Lerp(x1, x2, l)
    local y = Lerp(y1, y2, l)
    local z = Lerp(z1, z2, l)
    return vector3(x, y, z)
end

function Lerp(a, b, t)
    return a + (b - a) * t
end

function LocationInWorld(coords,camera)

    local position = GetCamCoord(camera)

    --- Getting Object using raycast
    local ped = PlayerPedId()
    local raycast = StartShapeTestRay(position.x,position.y,position.z, coords.x,coords.y,coords.z, 8, ped, 0)
    local retval, hit, endCoords, surfaceNormal, entity = GetShapeTestResult(raycast)
    
    return entity

end

function SetSkin(model, setDefault)
    -- TODO: If not isCop and model not in copModellist, do below.
    -- Model is a hash, GetHashKey(modelName)
    SetEntityInvincible(PlayerPedId(),true)
    if IsModelInCdimage(model) and IsModelValid(model) then
        RequestModel(model)
        while (not HasModelLoaded(model)) do
            Citizen.Wait(0)
        end

        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)
        player = GetPlayerPed(-1)
        FreezePedCameraRotation(player, true)
        
        if (model ~= `mp_f_freemode_01` and model ~= `mp_m_freemode_01`) then
            SetPedRandomComponentVariation(GetPlayerPed(-1), true)
        else
            SetPedHeadBlendData(player, 0, 0, 0, 15, 0, 0, 0, 1.0, 0, false)
            SetPedComponentVariation(player, 11, 0, 11, 0)
            SetPedComponentVariation(player, 8, 0, 1, 0)
            SetPedComponentVariation(player, 6, 1, 2, 0)
            SetPedHeadOverlayColor(player, 1, 1, 0, 0)
            SetPedHeadOverlayColor(player, 2, 1, 0, 0)
            SetPedHeadOverlayColor(player, 4, 2, 0, 0)
            SetPedHeadOverlayColor(player, 5, 2, 0, 0)
            SetPedHeadOverlayColor(player, 8, 2, 0, 0)
            SetPedHeadOverlayColor(player, 10, 1, 0, 0)
            SetPedHeadOverlay(player, 1, 0, 0.0)
            SetPedHairColor(player, 1, 1)
        end
        
    end
    SetEntityInvincible(PlayerPedId(),false)
end


function Login.RequestModel(model, callback)
    CreateThread(function()
        local modelHash
        
        if type(model) == "number" then
            modelHash = model
            model = false
        else
            modelHash = GetHashKey(model)
        end

        if not IsModelInCdimage(modelHash) then
            callback(false, model, modelHash)
            error("Model: " .. tostring(model or modelHash) .. " doesn't exist!")
        end

        RequestModel(modelHash)

        local timeOut = GetGameTimer()
        local breakOut = false

        while not HasModelLoaded(modelHash) and not breakOut do
            Wait(100)

            --RequestModel(modelHash)

            if GetGameTimer() - timeOut >= 10000 then
                callback(false, model, modelHash)
                error("Model: " .. tostring(model or modelHash) .. " request timed while loading!")
                breakOut = true
            end
        end

        callback(true, model, modelHash)
    end)
end

function CleanUpArea()
    local playerped = PlayerPedId()
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = #(playerCoords - pos)
        if canPedBeUsed(ped) and distance < 90.0 then
            distanceFrom = distance
            DeleteEntity(ped)

        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
end

function canPedBeUsed(ped)
    if ped == nil then
        return false
    end
    if ped == PlayerPedId() then
        return false
    end
    if not DoesEntityExist(ped) then
        return false
    end
    return true
end


function Spawn.obtainApartmentType(spawnInfo)
    local found = false
    for k,v in pairs(Spawn.motel) do
        if v.info == spawnInfo then 
            found = k
        end
    end
    return found 
end

function Spawn.obtainWorldSpawnPos(spawnInfo)
    local found = false
    for k,v in pairs(Spawn.defaultSpawns) do
        if v.info == spawnInfo then 
            found = v.pos
        end
    end

    local dev = Spawn.getDevSpawn()
    local rooster = Spawn.getRoosterSpawn()

    if dev and dev.info == spawnInfo then 
        found = dev.pos
    end

    if rooster and rooster.info == spawnInfo then 
        found = rooster.dev
    end

    return found 
end

function Spawn.shallowCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        copy[key] = value
    end
    return copy
end

-- temp function REMOVE WHEN REMOVING TEMPT FIX FOR HOUSING / OFFICES 
function Spawn.obtainHousingPos(spawnInfo)
    local found = false
    for k,v in pairs(Spawn.tempHousing) do
        if v.info == spawnInfo then 
            found = v.pos
        end
    end
    return found 
end

--[[
    Functions below: 2dTo3dWorld char finder
    Description: takes the outcome of 2dto3dworld and finds the corrisponding ped and generates info for them
]]

function findCharPed(ped,isHover)

    if ped == 0 and Login.Selected and not isHover then
        Login.CurrentPedInfo = nil
        return nil
    end

    if ped == 0 and not Login.Selected and isHover then
        Login.CurrentPedInfo = nil
        return nil
    end

    if ped ~= 0 then
        if ped == Login.CurrentPed and Login.CurrentPedInfo ~= nil then 
            return Login.CurrentPedInfo
        else
            if (not isHover and Login.Selected) or (not Login.Selected) then
                local pedCoords =  GetEntityCoords(ped)
                for i=1,#Login.spawnLoc do
                    if Login.CreatedPeds[i] ~= nil then
                        local spawnPos = vector3(Login.spawnLoc[i].x,Login.spawnLoc[i].y,Login.spawnLoc[i].z)
                        local dist = #(pedCoords - spawnPos)
                        if dist <= 1.0 then
                            Login.CurrentPed = ped
                            Login.CurrentPedInfo = {
                                charId = Login.CreatedPeds[i].charId,
                                position = i
                            }
                        end
                    end
                end
            end
        end
    end
    return Login.CurrentPedInfo
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end
