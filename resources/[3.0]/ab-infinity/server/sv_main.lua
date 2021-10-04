pCoordsActivePlayers = {}

RegisterServerEvent("np:infinity:player:ready")
AddEventHandler("np:infinity:player:ready",function()
    local src = source
    local ped = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(ped)
    table.insert( pCoordsActivePlayers, src, playerCoords )
end)

RegisterServerEvent("np:infinity:entity:coords")
AddEventHandler("np:infinity:entity:coords",function(pNetId)
    local src = source
    local pEntity = NetworkGetEntityFromNetworkId(pNetId)
    local pCoords = GetEntityCoords(pEntity)
    TriggerClientEvent("np:infinity:entity:coords", src, pNetId,pCoords)
end)

AddEventHandler("playerDropped", function()
    local src = source
    if #pCoordsActivePlayers > 0 then
        pCoordsActivePlayers[src] = nil
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if #pCoordsActivePlayers > 0 then
            for k,v in pairs(pCoordsActivePlayers) do
                if v ~= nil then
                    local ped = GetPlayerPed(k)
                    local playerCoords = GetEntityCoords(ped)
                    pCoordsActivePlayers[k] = playerCoords
                end
            end
            TriggerClientEvent("np:infinity:player:coords", -1, pCoordsActivePlayers)
        end
    end
end)

function GetPlayerCoords(serverid)
    if pCoordsActivePlayers[serverid] then
        return pCoordsActivePlayers[serverid]
    else
        return false
    end
end

exports("GetPlayerCoords",GetPlayerCoords)