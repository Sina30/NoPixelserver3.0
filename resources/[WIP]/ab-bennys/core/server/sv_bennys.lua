local koil = vehicleBaseRepairCost

RegisterServerEvent('ab-bennys:attemptPurchase')
AddEventHandler('ab-bennys:attemptPurchase', function(cheap, type, upgradeLevel)
	local src = source
	local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    if type == "repair" then
        if user:getCash() >= koil then
            user:removeMoney(koil)
            TriggerClientEvent('ab-bennys:purchaseSuccessful', source)
        else
            TriggerClientEvent('ab-bennys:purchaseFailed', source)
        end
    elseif type == "performance" then
        if user:getCash() >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('ab-bennys:purchaseSuccessful', source)
            user:removeMoney(vehicleCustomisationPrices[type].prices[upgradeLevel])
        else
            TriggerClientEvent('ab-bennys:purchaseFailed', source)
        end
    else
        if user:getCash() >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('ab-bennys:purchaseSuccessful', source)
            user:removeMoney(vehicleCustomisationPrices[type].price)
        else
            TriggerClientEvent('ab-bennys:purchaseFailed', source)
        end
    end
end)

RegisterServerEvent('ab-bennys:updateRepairCost')
AddEventHandler('ab-bennys:updateRepairCost', function(cost)
    koil = cost
end)

RegisterServerEvent('ab-bennys:repairciv')
AddEventHandler('ab-bennys:repairciv', function()
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    user:removeMoney(450)
end)