Sync = {}

function RequestSyncExecution(native, entity, ...)
    if DoesEntityExist(entity) then
        TriggerServerEvent('sync:request', native, GetPlayerServerId(NetworkGetEntityOwner(entity)), NetworkGetNetworkIdFromEntity(entity), ...)
    end
end

Sync.DeleteVehicle = function (vehicle)
    if NetworkHasControlOfEntity(vehicle) then
        DeleteVehicle(vehicle)
    else
        RequestSyncExecution("DeleteVehicle", vehicle)
    end
end

Sync.DeleteEntity = function (entity)
    if NetworkHasControlOfEntity(entity) then
        DeleteEntity(entity)
    else
        RequestSyncExecution("DeleteEntity", entity)
    end
end

Sync.DeletePed = function (ped)
    if NetworkHasControlOfEntity(ped) then
        DeletePed(ped)
    else
        RequestSyncExecution("DeletePed", ped)
    end
end

Sync.DeleteObject = function (object)
    if NetworkHasControlOfEntity(object) then
        DeleteObject(object)
    else
        RequestSyncExecution("DeleteObject", object)
    end
end

Sync.SetVehicleFuelLevel = function (vehicle, level)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleFuelLevel(vehicle, level)
    else
        RequestSyncExecution("SetVehicleFuelLevel", vehicle, level)
    end
end

Sync.SetVehicleTyreBurst = function (vehicle, index, onRim, p3)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleTyreBurst(vehicle, index, onRim, p3)
    else
        RequestSyncExecution("SetVehicleTyreBurst", vehicle, index, onRim, p3)
    end
end

Sync.SetVehicleDoorShut = function (vehicle, doorIndex, closeInstantly)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleDoorShut(vehicle, doorIndex, closeInstantly)
    else
        RequestSyncExecution("SetVehicleDoorShut", vehicle, doorIndex, closeInstantly)
    end
end

Sync.SetVehicleDoorOpen = function (vehicle, doorIndex, loose, openInstantly)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleDoorOpen(vehicle, doorIndex, loose, openInstantly)
    else
        RequestSyncExecution("SetVehicleDoorOpen", vehicle, doorIndex, loose, openInstantly)
    end
end

Sync.SetVehicleDoorBroken = function (vehicle, doorIndex, deleteDoor)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleDoorBroken(vehicle, doorIndex, deleteDoor)
    else
        RequestSyncExecution("SetVehicleDoorBroken", vehicle, doorIndex, deleteDoor)
    end
end

Sync.SetVehicleEngineOn = function(vehicle, value, instantly, noAutoTurnOn)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleEngineOn(vehicle, value, instantly, noAutoTurnOn)
    else
        RequestSyncExecution("SetVehicleEngineOn", vehicle, value, instantly, noAutoTurnOn)
    end
end

Sync.SetVehicleUndriveable = function(vehicle, toggle)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleUndriveable(vehicle, toggle)
    else
        RequestSyncExecution("SetVehicleUndriveable", vehicle, toggle)
    end
end

Sync.DecorSetFloat = function (entity, propertyName, value)
    if NetworkHasControlOfEntity(entity) then
        DecorSetFloat(entity, propertyName, value)
    else
        RequestSyncExecution("DecorSetFloat", entity, propertyName, value)
    end
end

Sync.DecorSetBool = function (entity, propertyName, value)
    if NetworkHasControlOfEntity(entity) then
        DecorSetBool(entity, propertyName, value)
    else
        RequestSyncExecution("DecorSetBool", entity, propertyName, value)
    end
end

Sync.DecorSetInt = function (entity, propertyName, value)
    if NetworkHasControlOfEntity(entity) then
        DecorSetInt(entity, propertyName, value)
    else
        RequestSyncExecution("DecorSetInt", entity, propertyName, value)
    end
end

Sync.DetachEntity = function (entity, p1, collision)
    if NetworkHasControlOfEntity(entity) then
        DetachEntity(entity, p1, collision)
    else
        RequestSyncExecution("DetachEntity", entity, p1, collision)
    end
end

Sync.SetEntityCoords = function (entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea)
    if NetworkHasControlOfEntity(entity) then
        SetEntityCoords(entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea)
    else
        RequestSyncExecution("SetEntityCoords", entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea)
    end
end

Sync.SetEntityHeading = function (entity, heading)
    if NetworkHasControlOfEntity(entity) then
        SetEntityHeading(entity, heading)
    else
        RequestSyncExecution("SetEntityHeading", entity, heading)
    end
end

Sync.FreezeEntityPosition = function (entity, freeze)
    if NetworkHasControlOfEntity(entity) then
        FreezeEntityPosition(entity, freeze)
    else
        RequestSyncExecution("FreezeEntityPosition", entity, freeze)
    end
end

Sync.SetVehicleDoorsLocked = function (entity, status)
    if NetworkHasControlOfEntity(entity) then
        SetVehicleDoorsLocked(entity, status)
    else
        RequestSyncExecution("SetVehicleDoorsLocked", entity, status)
    end
end

Sync.NetworkExplodeVehicle = function (vehicle, isAudible, isInvisible, p3)
    if NetworkHasControlOfEntity(vehicle) then
        NetworkExplodeVehicle(vehicle, isAudible, isInvisible, p3)
    else
        RequestSyncExecution("NetworkExplodeVehicle", vehicle, isAudible, isInvisible, p3)
    end
end

Sync.SetBoatAnchor = function (vehicle, state)
    if NetworkHasControlOfEntity(vehicle) then
        SetBoatAnchor(vehicle, state)
    else
        RequestSyncExecution("SetBoatAnchor", vehicle, state)
    end
end

Sync.SetBoatFrozenWhenAnchored = function (vehicle, state)
    if NetworkHasControlOfEntity(vehicle) then
        SetBoatFrozenWhenAnchored(vehicle, state)
    else
        RequestSyncExecution("SetBoatFrozenWhenAnchored", vehicle, state)
    end
end

Sync.SetForcedBoatLocationWhenAnchored = function (vehicle, state)
    if NetworkHasControlOfEntity(vehicle) then
        SetForcedBoatLocationWhenAnchored(vehicle, state)
    else
        RequestSyncExecution("SetForcedBoatLocationWhenAnchored", vehicle, state)
    end
end

Sync.SetVehicleOnGroundProperly = function (vehicle)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleOnGroundProperly(vehicle)
    else
        RequestSyncExecution("SetVehicleOnGroundProperly", vehicle)
    end
end