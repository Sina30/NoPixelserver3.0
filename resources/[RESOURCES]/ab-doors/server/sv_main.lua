local doors = {}

RegisterServerEvent("ab-doors:request-lock-state")
AddEventHandler("ab-doors:request-lock-state",function()
    TriggerClientEvent("ab-doors:initial-lock-state", source, doors)
end)

RegisterServerEvent("ab-doors:change-lock-state")
AddEventHandler("ab-doors:change-lock-state",function(pDoorId,pDoorLockState)
    if doors[pDoorId] then
        doors[pDoorId].lock = pDoorLockState
        -- doors[pDoorId].forceUnlocked = pDoorLockState
        TriggerClientEvent("ab-doors:change-lock-state", -1, pDoorId,pDoorLockState,doors[pDoorId].forceUnlocked)
    end
end)

Citizen.CreateThread(function()
    for _,door in ipairs(DOOR_CONFIG) do
        doors[#doors + 1] = door
    end
end)

RegisterServerEvent("ab-door:add")
AddEventHandler("ab-door:add",function(pDoorCoords,pDoorModel)
    file = io.open("doorConfig.log","a")
    io.output(file)
    io.write(("\n vector3(%s , %s, %s)\t %s"):format(pDoorCoords.x, pDoorCoords.y, pDoorCoords.z, pDoorModel))
    io.close(file)
end)