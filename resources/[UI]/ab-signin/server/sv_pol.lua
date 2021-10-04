local activepolice = 0

RegisterServerEvent('ab-signin:duty')
AddEventHandler('ab-signin:duty', function(job)
	if src == nil or src == 0 then 
    src = source 
  end
	local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	local jobs = exports["ab-base"]:getModule("JobManager")
    if job == 'ems' then
      jobs:SetJob(user, job, false, function()
        TriggerClientEvent("DoLongHudText", src,"You are 10-41!",17)
        TriggerClientEvent("hasSignedOnEms",src)
        TriggerClientEvent('police:officerOnDuty', src)
        TriggerEvent('badBlips:server:registerPlayerBlipGroup', src, job)
      end)
    elseif job == 'police' then
      jobs:SetJob(user, job, false, function()
        TriggerClientEvent('nowCopGarage', src)
        TriggerClientEvent("DoLongHudText", src,"10-41 and Restocked.",17)
        TriggerClientEvent("startSpeedo",src)
        TriggerClientEvent('police:officerOnDuty', src)
        TriggerEvent('badBlips:server:registerPlayerBlipGroup', src, job)
        activepolice = activepolice + 1
		    TriggerClientEvent("job:counts", -1, activepolice)
      end)
    end
end)


RegisterServerEvent("ab-signoff:duty")
AddEventHandler("ab-signoff:duty", function(job)
	local src = source
  if job == 'police' then
    if activepolice > 1 then
      activepolice = activepolice - 1
    else
      activepolice = 0
    end
    TriggerClientEvent("job:counts", -1, activepolice)
    TriggerEvent('badBlips:server:removePlayerBlipGroup', src, 'police')
  elseif job == 'ems' then
	  TriggerEvent('badBlips:server:removePlayerBlipGroup', src, 'ems')
  end
end)

RegisterServerEvent('reset:blips')
AddEventHandler('reset:blips', function()
	local src = source
	local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	local characterID = user:getCurrentCharacter().id
	exports.ghmattimysql:execute("SELECT * FROM character_passes WHERE cid = @cid", {['cid'] = characterID}, function(result)
        if result[1] then
			if  result[1].pass_type == "police" then
				TriggerEvent('badBlips:server:removePlayerBlipGroup', src, 'police')
				if activepolice > 1 then
					activepolice = activepolice - 1
				else
					activepolice = 0
				end
				TriggerClientEvent("job:counts", -1, activepolice)
			elseif result[1].pass_type == "ems" then
				TriggerEvent('badBlips:server:removePlayerBlipGroup', src, 'ems')
			end
		end
	end)
end)
