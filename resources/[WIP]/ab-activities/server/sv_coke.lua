local hiddenprocess = vector3(1090.43,-3195.72,-39.17) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords
local hiddenstart = vector3(2122.2004394531,4784.7919921875,40.970275878906) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords

RegisterNetEvent('coke:updateTable')
AddEventHandler('coke:updateTable', function(bool)
    TriggerClientEvent('coke:syncTable', -1, bool)
end)

RPC.register("processcoords",function(pSource)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
	return hiddenprocess
end)

RPC.register("coords",function(pSource)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    return hiddenstart
end)

RPC.register("coke:pay",function(pSource)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()

	if (tonumber(user:getCash()) >= 2000) then
        	user:removeMoney(2000)
    	return true
	else
		return false
	end
end)

RegisterServerEvent("coke:processstart")
AddEventHandler("coke:processstart", function(x,y,z)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	TriggerClientEvent('inventory:removeItem', src, 'coke50g', 1)
	TriggerClientEvent('inventory:removeItem', src, 'emptybaggies', 1)
	-- TriggerClientEvent('inventory:removeItem', src, 'smallscales', 1)
end)

RegisterServerEvent("coke:processed")
AddEventHandler("coke:processed", function(x,y,z)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	
	TriggerClientEvent("player:receiveItem",src,"coke5g",10)
end)




-- Oasis.Functions.CreateCallback('coke:process', function(source, cb)
-- 	local src = source
-- 	local Player = Oasis.Functions.GetPlayer(src)
	 
-- 	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
-- 		for k, v in pairs(Player.PlayerData.items) do
-- 		    if Player.Playerdata.items[k] ~= nil then
-- 				if Player.Playerdata.items[k].name == "coke_brick" then
-- 					cb(true)
-- 			    else
-- 					TriggerClientEvent("Oasis:Notify", src, "You do not have any coke bricks", "error", 10000)
-- 					cb(false)
-- 				end
-- 	        end
-- 		end	
-- 	end
-- end)

-- RegisterServerEvent("coke:GiveItem")
-- AddEventHandler("coke:GiveItem", function()
--   	local src = source
-- 	  local Player = Oasis.Functions.GetPlayer(src)
-- 	  local price = Config.price
-- 	  local brick = Config.randBrick
-- 	Player.Functions.AddMoney('cash', price)
-- 	Player.Functions.AddItem('coke_brick', brick)
-- 	TriggerClientEvent('inventory:client:ItemBox', src, Oasis.Shared.Items['coke_brick'], "add")
-- end)


RPC.register("coke:GiveItem",function(pSource,vehname,plate)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	user:addMoney(2000) 
	TriggerClientEvent("player:receiveItem",src,"coke50g",1)
end)