RegisterServerEvent('ab-scuba:checkAndTakeDepo')
AddEventHandler('ab-scuba:checkAndTakeDepo', function()
local src = source
local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    user:removeMoney(400)
end)

RegisterServerEvent('ab-scuba:returnDepo')
AddEventHandler('ab-scuba:returnDepo', function()
local src = source
local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    user:addMoney(200)
end)

RegisterServerEvent('ab-scuba:findTreasure')
AddEventHandler('ab-scuba:findTreasure', function()
local source = source
    local roll = math.random(1,8)
    if roll == 1 then
        TriggerClientEvent('player:receiveItem', source, "ironbar", math.random(6,9))
    end
    if roll == 2 then
        TriggerClientEvent('player:receiveItem', source, 'ironbar', math.random(6,11))
    end
    if roll == 3 then
        TriggerClientEvent('player:receiveItem', source, 'ironbar', math.random(6,9))
    end
    if roll == 5 then
        TriggerClientEvent('player:receiveItem', source, "ironbar", math.random(6,11))
    end
    if roll == 6 then
        TriggerClientEvent('player:receiveItem', source, "ironbar", math.random(5,7))
    end
    if roll == 7 then
        TriggerClientEvent('player:receiveItem', source, "umetal", math.random(2,3))
    end
    if roll == 8 then
        TriggerClientEvent('player:receiveItem', source, "umetal", math.random(2,3))
    end
end)

RegisterServerEvent('ab-scuba:paySalvage')
AddEventHandler('ab-scuba:paySalvage', function(money)
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    if money ~= nil then
        user:addMoney(tonumber(money))
    end
end)

RegisterServerEvent('ab-scuba:makeGold')
AddEventHandler('ab-scuba:makeGold', function()
 local source = source
 TriggerClientEvent('inventory:removeItem', source, 'umetal', 10)
 TriggerClientEvent("player:receiveItem", source, "goldbar", 1)
end)