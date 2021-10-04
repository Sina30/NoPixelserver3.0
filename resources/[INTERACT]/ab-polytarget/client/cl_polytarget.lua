debugEnabled, IsInVehicle = false, false

CurrentPolyTarget = vector3(0.0, 0.0, 0.0)

TargetZones, TargetComboZone = {}

function AddToComboZone(zone)
    if TargetComboZone ~= nil then
        TargetComboZone:AddZone(zone)
    else
        TargetComboZone = ComboZone:Create({ zone }, { name = "ab-polytarget" })

        TargetComboZone:onPointInOutExhaustive(function() return GetTargetCoords() end,function(isPointInside, point, insideZones, enteredZones, leftZones)
            if enteredZones ~= nil then
                for _, zone in ipairs(enteredZones) do
                    TriggerEvent("ab-polyzone:enter", zone.name, zone.data, zone.center)
                end
            end

            if leftZones ~= nil then
                for _, zone in ipairs(leftZones) do
                    TriggerEvent("ab-polyzone:exit", zone.name)
                end
            end
        end, 250)
    end
end

function CreateZone(options)
    if options.data and options.data.id then
        local key = options.name .. "_" .. tostring(options.data.id)

        if not TargetZones[key] then
            TargetZones[key] = true
        else
            print('polyzone with name/id already added, skipping: ', key)
        end
    end
end

exports("AddBoxZone", function(name, vectors, length, width, options)
    if not options then options = {} end
    options.name = name
    CreateZone(options)
    local boxCenter = type(vectors) ~= 'vector3' and vector3(vectors.x, vectors.y, vectors.z) or vectors
    local zone = BoxZone:Create(boxCenter, length, width, options)
    AddToComboZone(zone)
end)

exports("AddCircleZone", function(name, center, radius, options)
    if not options then options = {} end
    options.name = name
    CreateZone(options)
    local circleCenter = type(center) ~= 'vector3' and vector3(center.x, center.y, center.z) or center
    local zone = CircleZone:Create(circleCenter, radius, options)
    AddToComboZone(zone)
end)

function GetForwardVector(rotation)
    local rot = (math.pi / 180.0) * rotation
    return vector3(-math.sin(rot.z) * math.abs(math.cos(rot.x)), math.cos(rot.z) * math.abs(math.cos(rot.x)), math.sin(rot.x))
end

function RayCast(origin, target, options, ignoreEntity, radius)
    local handle = StartShapeTestRay(origin.x, origin.y, origin.z, target.x, target.y, target.z, options, ignoreEntity, 0)
    return GetShapeTestResult(handle)
end

function GetTargetCoords()
    local CameraCoords = GetGameplayCamCoord()
    local ForwardVectors = GetForwardVector(GetGameplayCamRot(2))
    local ForwardCoords = CameraCoords + (ForwardVectors * (IsInVehicle and 6.5 or 5.0))
    local TargetCoords = vector3(0.0, 0.0, 0.0)
    
    if ForwardVectors then
        local _, hit, targetCoords, _, _ = RayCast(CameraCoords, ForwardCoords, 17, nil, 0.1)

        TargetCoords = targetCoords

        if debugEnabled and hit ~= 0 then
            DrawMarker(28, targetCoords.x, targetCoords.y, targetCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.01, 0.01, 0.01, 255, 0, 0, 255, false, false, 2, nil, nil, false)
        end
    end

    return TargetCoords
end

AddEventHandler('baseevents:enteredVehicle', function()
    IsInVehicle = true
end)

AddEventHandler('baseevents:leftVehicle', function()
    IsInVehicle = false
end)

local function toggleDebug(state)
    if state == debugEnabled then return end
    debugEnabled = state
    if debugEnabled then
        while debugEnabled do
            TargetComboZone:draw()
            Wait(0)
        end
    end
end

if GetConvar("sv_environment", "prod") == "debug" then
    RegisterCommand("ab-polytarget:debug", function (src, args)
        toggleDebug(not debugEnabled)
    end)
end
