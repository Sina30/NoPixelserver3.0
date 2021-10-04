local instances = {}

RegisterServerEvent("Instance:addToInstance")
AddEventHandler("Instance:addToInstance",function(genID)
    print("AddToInstance",genID)
    local src = source
    instances[src] = true
    TriggerClientEvent("Instance:setCurrentInstance", -1, genID,instances)
end)

RegisterServerEvent("Instance:removeFromInstance")
AddEventHandler("Instance:removeFromInstance",function(genID)
    print("removeFromInstance",genID)
    local src = source
    instances[src] = false
    TriggerClientEvent("Instance:setCurrentInstance", -1, genID,instances)
end)