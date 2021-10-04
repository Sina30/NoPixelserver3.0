RegisterServerEvent("v-flags:set")
AddEventHandler("v-flags:set", function(callID, netID, flagType, flags)
    local src = source
    local entity = NetworkGetEntityFromNetworkId(netID)
    local eType = GetEntityType(entity)
    TriggerClientEvent("v-flags:set", -1, netID, eType, flagType, flags)
end)