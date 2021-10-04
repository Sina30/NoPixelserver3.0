RegisterServerEvent('ab-driftschool:takemoney')
AddEventHandler('ab-driftschool:takemoney', function(data)
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(source)

	if user:getCash() >= data then
        user:removeMoney(data)
    TriggerClientEvent('ab-driftschool:tookmoney', source, true)
    else
        TriggerClientEvent('DoLongHudText', source, 'You dont have enough money to do that little bitch.', 2)
    end
end)


