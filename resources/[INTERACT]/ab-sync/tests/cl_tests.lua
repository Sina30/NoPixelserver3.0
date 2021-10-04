RegisterCommand("dv", function()
    local entity = GetEntityInFrontOfPlayer(3.0, PlayerPedId())

    if DoesEntityExist(entity) then
        Sync.DeleteVehicle(entity)

        print(("[Sync] Delete Vehicle | Entity: %s"):format(entity))
    end

end, false)

RegisterCommand("burst", function(source, args)
    local index = tonumber(args[1])
    local entity = GetEntityInFrontOfPlayer(3.0, PlayerPedId())

    if DoesEntityExist(entity) then
        Sync.SetVehicleTyreBurst(entity, index or 1, 1, 1)

        print(("[Sync] Tyre Burst | Entity: %s | Index: %s"):format(entity, index or 1))
    end

end, false)

function GetEntityInFrontOfPlayer(distance, ped)
	local coords = GetEntityCoords(ped, 1)
	local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, distance, 0.0)
	local rayHandle = StartShapeTestRay(coords.x, coords.y, coords.z, offset.x, offset.y, offset.z, -1, ped, 0)
	local a, b, c, d, entity = GetRaycastResult(rayHandle)
	return entity
end

AddEventHandler('event:shit:in', function ()
    print('in')
end)

AddEventHandler('event:shit:out', function ()
    print('out')
end)