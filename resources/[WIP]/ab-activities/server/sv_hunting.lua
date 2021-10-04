-- RegisterServerEvent('srp:huntingreturnree')
-- AddEventHandler('srp:huntingreturnree', function()
-- local src = source
-- local user = exports["ab-base"]:getModule("Player"):GetUser(src)
--     user:addMoney(250)
-- end)

-- -- RegisterServerEvent('crowded')
-- -- AddEventHandler('crowded', function()
-- --     local src = source
-- --     local user = exports["ab-base"]:getModule("Player"):GetUser(src)
-- --     user:addMoney(1000)
-- -- end)

-- RegisterServerEvent('srp:huntingdeposit')
-- AddEventHandler('srp:huntingdeposit', function()
--     local src = source
--     local user = exports["ab-base"]:getModule("Player"):GetUser(src)
--     if (tonumber(user:getCash()) >= 500) then
--         user:removeMoney(500)
--         TriggerClientEvent('hunting:start', src)
--     else
--         TriggerClientEvent("DoLongHudText", src, "You need $1000", 2)
--     end
-- end)

-- RegisterServerEvent('ab-hunting:sell')
-- AddEventHandler('ab-hunting:sell', function()
-- local src = source
-- local user = exports["ab-base"]:getModule("Player"):GetUser(src)
-- local randompayout = math.random(60, 85)
--     user:addMoney(randompayout)
-- end)

-- RegisterServerEvent('ab-hunting:giveloadout')
-- AddEventHandler('ab-hunting:giveloadout', function()
--     TriggerClientEvent('player:receiveItem', source, '100416529', 1)
-- end)

-- RegisterServerEvent('ab-hunting:removeloadout')
-- AddEventHandler('ab-hunting:removeloadout', function()
--     TriggerClientEvent('inventory:removeItem', source, '100416529', 1)
-- end)


-- RegisterServerEvent("ab-hunting:retreive:license")
-- AddEventHandler("ab-hunting:retreive:license", function()
--     local src = source
-- 	local user = exports["ab-base"]:getModule("Player"):GetUser(src)
-- 	local character = user:getCurrentCharacter()
--     exports.ghmattimysql:execute('SELECT * FROM user_licenses WHERE `owner`= ? AND `type` = ? AND `status` = ?', {character.id, "Hunting", "1"}, function(data)
-- 		if data[1] then
--             TriggerClientEvent("ab-hunting:allowed", src, true)
--         end
--     end)
-- end)