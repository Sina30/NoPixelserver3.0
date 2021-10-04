RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    if not askingPrice
    then
        askingPrice = 0
    end

    if (tonumber(user:getCash()) >= amount) then
        user:removeMoney(amount)
        user:addBank(amount)
    else
        TriggerClientEvent('DoShortHudText', src, 'You do not have enough money to deposit')
    end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    if not askingPrice
    then
        askingPrice = 0
    end

    if (tonumber(user:getBalance()) >= amount) then
        user:removeBank(amount)
        user:addMoney(amount)
    else
        TriggerClientEvent('DoShortHudText', src, 'You do not have enough money to deposit')
    end
end)

RegisterServerEvent('bank:givecash')
AddEventHandler('bank:givecash', function(receiver, amount)
    local user = exports["ab-base"]:getModule("Player"):GetUser(source)
    local player = exports["ab-base"]:getModule("Player"):GetUser(tonumber(receiver))

    print(user:getCash())

    if tonumber(amount) <= user:getCash() then
        user:removeMoney(amount)
        player:addMoney(amount)      
        exports["ab-log"]:AddLog("Transfer", user, "User gave cash to "..tonumber(receiver).." $"..tonumber(amount), {target = receiver , src = source})
    else
        TriggerClientEvent('DoShortHudText', source, 'Not enough money', 2)
    end

end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(receiver, amount)
    local user = exports["ab-base"]:getModule("Player"):GetUser(source)
    local player = exports["ab-base"]:getModule("Player"):GetUser(tonumber(receiver))


    if tonumber(amount) <= user:getBalance() then
        user:removeBank(amount)
        player:addBank(amount)
        exports["ab-log"]:AddLog("Bank Transfer", user, "User transfered to "..tonumber(receiver).." $"..amount, {target = receiver , src = source})
    else
        TriggerClientEvent('DoShortHudText', source, 'Not enough money', 2)
    end
end)

RegisterCommand('cash', function(source, args)
    local user = exports["ab-base"]:getModule("Player"):GetUser(source)
    local char = user:getCurrentCharacter()
    local cash = char.cash
    TriggerClientEvent('banking:updateCash', source, cash, true)
end)

RegisterServerEvent('bank:withdrawAmende')
AddEventHandler('bank:withdrawAmende', function(amount)
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    user:removeMoney(amount)
end)

RegisterCommand('givecash', function(source, args)
    print(args[1])
    print(args[2])
    TriggerClientEvent('bank:givecash', source, args[1], args[2])
end)