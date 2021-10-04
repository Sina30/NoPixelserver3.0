--- removes a player from the call for everyone in the call.
---@param source number the player to remove from the call
---@param currentChannel number the call channel to remove them from
function removePlayerFromCall(source, currentChannel)
    callData[currentChannel] = callData[currentChannel] or {}
    for player, _ in pairs(callData[currentChannel]) do
        TriggerClientEvent('ab-voice:removePlayerFromCall', player, source)
    end
    callData[currentChannel][source] = nil
    voiceData[source] = voiceData[source] or defaultTable(source)
    voiceData[source].call = 0
end

--- adds a player to a call
---@param source number the player to add to the call 
---@param channel number the call channel to add them to
function addPlayerToCall(source, channel)
    print("[ab-voice]PLAYER ON PHONE ", source, channel)
    -- check if the channel exists, if it does set the varaible to it
    -- if not create it (basically if not callData make callData)
    callData[channel] = callData[channel] or {}
    for player, _ in pairs(callData[channel]) do
        print("[ab-voice]PLAYER ON PHONE 2 ", source, channel)
        -- don't need to send to the source because they're about to get sync'd!
        if player ~= source then
            TriggerClientEvent('ab-voice:addPlayerToCall', player, source)
        end
    end
    callData[channel][source] = false
    voiceData[source] = voiceData[source] or defaultTable(source)
    voiceData[source].call = channel
    print("[ab-voice]syncCallData ", source, json.encode(callData[channel]))
    TriggerClientEvent('ab-voice:syncCallData', source, callData[channel])
end

--- set the players call channel
---@param source number the player to set the call off
---@param callChannel number the channel to set the player to (or 0 to remove them from any call channel)
function setPlayerCall(source, callChannel)
    print('[ab-voice:setPlayerCall] SetPlayer', source, callChannel)
	if GetConvarInt('voice_enablePhones', 1) ~= 1 then return end
    if GetInvokingResource() then
        -- got set in a export, need to update the client to tell them that their radio
        -- changed
        TriggerClientEvent('ab-voice:clSetPlayerCall', source, callChannel)
    end
    voiceData[source] = voiceData[source] or defaultTable(source)
    local plyVoice = voiceData[source]
    local callChannel = tonumber(callChannel)

    if callChannel ~= 0 and plyVoice.call == 0 then
        addPlayerToCall(source, callChannel)
    elseif callChannel == 0 then
        removePlayerFromCall(source, plyVoice.call)
    elseif plyVoice.call > 0 then
        removePlayerFromCall(source, plyVoice.call)
        addPlayerToCall(source, callChannel)
    end
end
exports('setPlayerCall', setPlayerCall)

RegisterNetEvent('ab-voice:setPlayerCall', function(callChannel)
    setPlayerCall(source, callChannel)
end)


function setTalkingOnCall(talking)
	if GetConvarInt('voice_enablePhones', 1) ~= 1 then return end
    local source = source
    voiceData[source] = voiceData[source] or defaultTable(source)
    local plyVoice = voiceData[source]
    local callTbl = callData[plyVoice.call]
    if callTbl then
        for player, _ in pairs(callTbl) do
            if player ~= source then
                TriggerClientEvent('ab-voice:setTalkingOnCall', player, source, talking)
            end
        end
    end
end
RegisterNetEvent('ab-voice:setTalkingOnCall', setTalkingOnCall)