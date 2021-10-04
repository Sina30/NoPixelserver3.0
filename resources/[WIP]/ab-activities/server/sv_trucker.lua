RegisterServerEvent('trucker:CarUsed')
AddEventHandler('trucker:CarUsed', function(id)
    TriggerClientEvent('trucker:acceptspawn',source,id)
end)

RegisterServerEvent('trucker:pickup')
AddEventHandler('trucker:pickup',function(job)
    --print('triggering pickup', job)
   -- TriggerClientEvent('trucker:updateJobs', job) -- this makes error
end)

RegisterServerEvent('trucker:jobFinished')
AddEventHandler('trucker:jobFinished', function(job)
    exports.ghmattimysql:execute("UPDATE delivery_job SET active = @active WHERE id = @id", {
      ['active'] = 0,
      ['id'] = job
    })
    TriggerEvent('trucker:returnCurrentJobs', -1)
end)

RegisterServerEvent('trucker:jobfailure')
AddEventHandler('trucker:jobfailure', function(job)
    exports.ghmattimysql:execute("UPDATE delivery_job SET active = @active WHERE id = @id", {
      ['active'] = 0,
      ['id'] = job
    })
    TriggerEvent('trucker:returnCurrentJobs', -1)
end)

RegisterServerEvent('trucker:jobTaken')
AddEventHandler('trucker:jobTaken', function(job)
  exports.ghmattimysql:execute("UPDATE delivery_job SET active = @active WHERE id = @id", {
    ['active'] = 1,
    ['id'] = job
  })
  TriggerEvent('trucker:returnCurrentJobs', -1)
end)

RegisterServerEvent('trucker:returnCurrentJobs')
AddEventHandler('trucker:returnCurrentJobs',function(currentJobs)
local jobLists = {}

  exports.ghmattimysql:execute("SELECT * FROM delivery_job", {}, function(result)
    for i = 1, #result do

       table.insert(jobLists, {
                id = result[i].id,
                active = tonumber(result[i].active),
                pickup = json.decode(result[i].pickup),
                JobType = result[i].jobType,
                drop = json.decode(result[i].drop),
                dropAmount = result[i].dropAmount,
            }
       )
    end
    TriggerClientEvent('trucker:updateJobs',-1,jobLists)
  end)
end)





RegisterCommand('truckerjoblist', function(source, args, user)
  TriggerEvent('trucker:returnCurrentJobs')
end)

RPC.register("ab-npcs:idcard",function(pSource)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local Player = user:getCurrentCharacter()
    if (tonumber(user:getCash()) >= 100) then
        user:removeMoney(100)
        TriggerClientEvent("player:receiveItem",src,"idcard",1)
    else
        TriggerClientEvent("DoLongHudText", src, "You need $ 100 ", 2)
    end
end)

