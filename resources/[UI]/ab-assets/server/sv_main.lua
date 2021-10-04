
--Rich Pres
local count = 0
RegisterNetEvent('rich:GetPlayers')
AddEventHandler('rich:GetPlayers', function()
    count = 0
    for _, playerId in ipairs(GetPlayers()) do
       count = count + 1
    end
    TriggerClientEvent('rich:TakePlayers', -1, count)
end)

-- Afk kick Hawmie
local reason = 'You have been disconnected | Reason: AFK'
RegisterNetEvent('afk:kick')
AddEventHandler('afk:kick', function()
    local name = GetPlayerName(source)
    DropPlayer(source, reason)
    RconPrint("Player Disconnected: Reason: " ..reason)
end)