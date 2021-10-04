RegisterServerEvent('ab-pizza:cash')
AddEventHandler('ab-pizza:cash', function(money)
    local source = source
    local LocalPlayer = exports['ab-base']:getModule('LocalPlayer')
    if money ~= nil then
       TriggerClientEvent('ab-ac:InfoPass', source, money)
       TriggerClientEvent('DoLongHudText', source, 'You got $'.. money .. '.', 1)
    end
end)


RPC.register("server:givepayJob",function(pSource,amount)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()

    exports.ghmattimysql:execute("SELECT id,paycheck FROM characters WHERE id = @id", {['id'] = Player.id}, function(result)
        if result[1] ~= nil then
          local curPaycheck = result[1].paycheck
          TriggerClientEvent("DoLongHudText",src,"A payslip of $"..amount.param.." making a total of $"..tonumber(curPaycheck).." with $"..(math.floor(tonumber(curPaycheck) / 15)).." tax withheld on your last payment.")
        end
      end)
    
      exports.ghmattimysql:execute("UPDATE characters SET paycheck = paycheck + @amount WHERE id = @cid",
       {
         ['cid'] = Player.id,
         ['amount'] = amount.param
       }
      )
end)
