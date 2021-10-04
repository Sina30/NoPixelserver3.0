ABX.Commands = ABX.Commands or {}
ABX.Commands.Registered = ABX.Commands.Registered or {}

AddEventHandler("ab-base:exportsReady", function()
    addModule("Commands", ABX.Commands)
end)

function ABX.Commands.AddCommand(self, command, suggestion, source, cb, args)
    --print('hi from commands')
    print("adding command "..command)
    if ABX.Commands.Registered[command] then return end
      table.insert(ABX.Commands.Registered, { ['command'] = command, ['suggestion'] = suggestion, ['args'] = args })
      ABX.Commands.Registered[command] = true
    cb(ok)
end

function ABX.Commands.RemoveCommand(self, command, suggestion, source, cb, args)
    print('command removed')
    if not ABX.Commands.Registered[command] or nil then return end
      -- table.remove(ABX.Commands.Registered, { ['command'] = command, ['suggestion'] = suggestion, ['args'] = args })
    ABX.Commands.Registered[command] = false
    cb(ok)
end

RegisterCommand('commands', function()
  print(json.encode(ABX.Commands.Registered))
end)

--[[
AddEventHandler('chatMessage', function(Source, Color, Message)
    if Message:sub(1, 1) == '/' then
        local fullcmd = stringsplit(Message, ' ')
        local cmd = fullcmd[1]
		local Comment

		if #fullcmd > 1 then
			Comment = fullcmd[2]
			if #fullcmd > 2 then
				for i=3, #fullcmd do
					Comment = Comment .. ' ' .. fullcmd[i]
				end
			end
		end
		
        if cmd:lower() == '/savepos' then
        	TriggerClientEvent('CoordSaver:GetCoords', Source, Comment)
        	CancelEvent()
        end
    end
end)

function stringsplit(Input, Seperator)
	if Seperator == nil then
		Seperator = '%s'
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(Input, '([^'..Seperator..']+)') do
		t[i] = str
		i = i + 1
	end
	
	return t
end

]]