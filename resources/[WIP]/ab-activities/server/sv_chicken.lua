RegisterServerEvent('cunt:pay')
AddEventHandler('cunt:pay', function(money)
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    if money ~= nil then
        user:addMoney(money)
       TriggerClientEvent('DoLongHudText', src, 'You Got $'.. money .. ' For 2 Packaged Chicken', 1)
    end
end)

RegisterServerEvent('ab-chickenjob:reward')
AddEventHandler('ab-chickenjob:reward', function()
    StartResource('ab-ac')
end)

