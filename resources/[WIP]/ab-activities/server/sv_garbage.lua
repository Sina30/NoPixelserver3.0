RPC.register("ab-garbage:checkmyneek",function(pSource,cash)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    if (tonumber(user:getCash()) >= cash.param) then
        exports.ghmattimysql:execute("SELECT * FROM garbage_crews WHERE cid = ?", {Player.id}, function(result)
            if(result[1]) then
                local data = {
                    {
                        title = "Crew Actions",
                        description = "Join group to do with friends.",
                        key = {"join"},
                        children = {
                            { title = "1 Person Job", action = "ab-ui:garbageruns",description = "Pay = $60 - $80", key = true },
                            { title = "2 Person Job", action = "ab-ui:garbageruns",description = "Pay = $80 - $100", key = true },
                            { title = "3 Person Job", action = "ab-ui:garbageruns",description = "Pay = $100 - $120", key = true },
                        },
                    },
                    {
                        title = "Solo Job",
                        description = "Do a job on your own.",
                        key = {"solo"},
                        action = "ab-ui:garbageruns",
                    },
                }
                TriggerClientEvent('event:list:garbagejob', src,data)
            else    
                local data = {
                    -- {
                    --     title = "Join Group",
                    --     description = "Join group to do with friends.",
                    --     key = {"join"},
                    --     action = "ab-ui:garbagerunstext",
                    -- },
                    -- {
                    --     title = "Create Group",
                    --     description = "Create Job group to do with friends.",
                    --     key = {"create"},
                    --     action = "ab-ui:garbagerunstext",
                    -- },
                    {
                        title = "Solo Job",
                        description = "Do a job on your own.",
                        key = {"solo"},
                        action = "ab-ui:garbageruns",
                    },
                }
                TriggerClientEvent('event:list:garbagejob', src,data)
            end
        end)
    end
end)

RPC.register("ab-garbage:joicrew",function(pSource,pin,name)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    exports.ghmattimysql:execute('SELECT * FROM garbage_crews WHERE crew_name = @crew_name AND pin = @pin ', { ['@crew_name'] = name.param, ["pin"] = pin.param }, function(result)
		if (result and result[1]) then
            if result[1].cid2 == 0 then
                exports.ghmattimysql:execute("UPDATE garbage_crews SET `cid2` = @cid2 WHERE `crew_name` = @crew_name", {
                    ['@cid2'] = Player.id,
                    ['@crew_name'] = name.param
                }, function(result)
                    TriggerClientEvent('DoLongHudText', src, 'You received key to a house.')
                end)
            elseif result[1].cid3 == 0 then
                exports.ghmattimysql:execute("UPDATE garbage_crews SET `cid3` = @cid3 WHERE `crew_name` = @crew_name", {
                    ['@cid3'] = Player.id,
                    ['@crew_name'] = name.param
                }, function(result)
                    TriggerClientEvent('DoLongHudText', src, 'You received key to a house.')
                end)
            elseif result[1].cid4 == 0 then
                exports.ghmattimysql:execute("UPDATE garbage_crews SET `cid4` = @cid4 WHERE `crew_name` = @crew_name", {
                    ['@cid4'] = Player.id,
                    ['@crew_name'] = name.param
                }, function(result)
                    TriggerClientEvent('DoLongHudText', src, 'You received key to a house.')
                end)
            else
                TriggerClientEvent('DoLongHudText', src, 'Crew is Full !', 1)
            end
        else
            TriggerClientEvent('DoLongHudText', src, 'Invalid Credentials', 2)
        end
	end)
end)

RPC.register("ab-garbage:gencrew",function(pSource,pin,name)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()

    exports.ghmattimysql:execute("INSERT INTO garbage_crews (crew_name,cid,pin) VALUES (@crew_name,@cid,@pin)",
	{['crew_name'] = name.param,['cid'] = Player.id,['pin'] = pin.param})
end)

RPC.register("ab-garage:ballagang",function(pSource,solo,name)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    if solo then
        TriggerClientEvent("ab-garbage:Imacunt",src,true,true)
    end
end)

RPC.register("mission:finished",function(pSource,payout)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    if payout <= 1000 then
        user:addMoney(payout.param) 
    end
end)









