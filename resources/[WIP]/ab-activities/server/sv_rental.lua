RPC.register("ab-rental:checkcash",function(pSource,pussy,args)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    if (tonumber(user:getCash()) >= pussy.param) then
        user:removeMoney(pussy.param)
        TriggerClientEvent('ab-rental:createvehicle', src,args.param)
    else
        TriggerClientEvent("DoLongHudText", src, "You need $ "..pussy.param, 2)
    end
end)

RPC.register("ab-rental:checkcashboat",function(pSource,pussy,args)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    if (tonumber(user:getCash()) >= pussy.param) then
        user:removeMoney(pussy.param)
        TriggerClientEvent('ab-rental:createvehicleboat', src,args.param)
    else
        TriggerClientEvent("DoLongHudText", src, "You need $ "..pussy.param, 2)
    end
end)

RPC.register("ab-rental:genreceipt",function(pSource,vehname,plate)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()

    information = {
        ["Name"] = Player.first_name .. ' ' ..Player.last_name,
        ["Plate"] = plate.param,
        ["Vehicle"] = vehname.param,
    }  

    TriggerClientEvent("player:receiveItem",src,"rentalpapers",1,true,information)
end)