local OxySaleCompleted = Config.MoneyAmount

RegisterServerEvent("np-oxy:pay")
AddEventHandler("np-oxy:pay", function(money)
        local pSrc = source
        local player = GetPlayerName(pSrc)
        local user = exports["np-base"]:getModule("Player"):GetUser(pSrc)
        if money ~= nil then
            user:addMoney(money)
        end
    end
)

RegisterServerEvent('np-delivery:giveitem')
AddEventHandler('np-delivery:giveitem', function()
    TriggerEvent("inventory:removeItem", config.DeliveryItem, 1)

    if Config.GiveMoney then
        TriggerServerEvent("np-oxy:pay", OxySaleCompleted)
    end
    if Config.GiveItem then
        TriggerClientEvent('player:receiveItem', source, Config.ItemReward,math.random(Config.ItemMin,Config.ItemMax))

        RegisterServerEvent('np-oxy:DeliveryAmount')
        AddEventHandler('np-oxy:DeliveryAmount', function()
            if Config.MultipleDeliveries then
                local totalDeliveries = Config.DeliveryAmount + Config.DeliveryAmount2
                TriggerClientEvent('player:receiveItem', source, Config.DeliveryItem,totalDeliveries)
            else
                TriggerClientEvent('player:receiveItem', source, Config.DeliveryItem, Config.DeliveryAmount)
            end
        end)