voiceData = {}
radioData = {}
callData = {}

function calculateVoiceTransmissionWithPixels(p1,p2,p3,p4)
	local result = (p1 / p2 * p3 / p1 % p4 * (24 / 3) * 2)
	return result
end

function defaultTable(source)
	return {
		radio = 0,
		call = 0,
		lastRadio = 0,
		lastCall = 0
	}
end

-- temp fix before an actual fix is added
CreateThread(function()
    for i = 1, 1024 do
        MumbleCreateChannel(i)
    end
end)

RegisterNetEvent('playerJoined', function()
	if not voiceData[source] then
		voiceData[source] = defaultTable(source)
		Player(source).state:set('routingBucket', 0, true)
	end
end)

--- update/sets the players routing bucket
---@param source number the player to update/set
---@param routingBucket number the routing bucket to set them to
function updateRoutingBucket(source, routingBucket)
	local route
	-- make it optional to provide the routing bucket just incase 
	-- people use another resource to manage their routing buckets.
	if routingBucket then
		SetPlayerRoutingBucket(source, routingBucket)
	else
		route = GetPlayerRoutingBucket(source)
	end
	Player(source).state:set('routingBucket', route or routingBucket, true)
end
exports('updateRoutingBucket', updateRoutingBucket)

AddEventHandler("playerDropped", function()
	local source = source
	if voiceData[source] then
		local plyData = voiceData[source]

		if plyData.radio ~= 0 then
			removePlayerFromRadio(source, plyData.radio)
		end

		if plyData.call ~= 0 then
			removePlayerFromCall(source, plyData.call)
		end

		voiceData[source] = nil
	end
end)

AddEventHandler('onResourceStart', function(resource)
	if resource ~= GetCurrentResourceName() then return end
	if GetConvar('onesync') == 'on' then
		local players = GetPlayers()
		for i = 1, #players do
			local ply = players[i]
			if not voiceData[ply] then
				voiceData[ply] = defaultTable(ply)
				Player(ply).state:set('routingBucket', GetPlayerRoutingBucket(ply), true)
			end
		end
	end
end)

RegisterCommand('mute', function(source, args)
	local mutePly = tonumber(args[1])
	if mutePly then
		if voiceData[mutePly] then
			TriggerClientEvent('ab-voice:mutePlayer', mutePly)
		end
	end
end, true)
