
function ABX.Core.ConsoleLog(self, msg, mod, ply)
	if not tostring(msg) then return end
	if not tostring(mod) then mod = "No Module" end

	local pMsg = string.format("^3[ABX LOG - %s]^7 %s", mod, msg)
	if not pMsg then return end
	
	print(pMsg)

	if ply and tonumber(ply) then
		TriggerClientEvent("ab-base:consoleLog", ply, msg, mod)
	end
end

AddEventHandler("onResourceStart", function(resource)
	TriggerClientEvent("ab-base:waitForExports", -1)

	if not ABX.Core.ExportsReady then return end

	Citizen.CreateThread(function()
		while true do 
			Citizen.Wait(0)
			if ABX.Core.ExportsReady then
				TriggerEvent("ab-base:exportsReady")
				return
			else
			end
		end
	end)
end)

RegisterNetEvent("ab-base:playerSessionStarted")
AddEventHandler("ab-base:playerSessionStarted", function()

	local src = source
	local name = GetPlayerName(src)
	local user = ABX.Player:GetUser(src)
	-- local hexId = ABX.Util.GetHexId(src)
	-- local steamId = ABX.Util:HexIdToSteamId(hexId) 

	--exports["ab-log"]:AddLog("Player Joined", tostring(steamId), name .. " Has joined the server", {name= name, steamid = tostring(steamId)})
	if user then exports["ab-log"]:AddLog("Player Left", user, user:getVar("name").." Has joined the server") end
	print("^0" .. name .. "^7 spawned into the server")
end)

AddEventHandler("ab-base:characterLoaded", function(user, char)
	local src = source
	local hexId = user:getVar("hexid")

	if char.phone_number == 0 then
		ABX.Core:CreatePhoneNumber(source, function(phonenumber, err)	
			local q = [[UPDATE characters SET phone_number = @phone WHERE owner = @owner and id = @cid]]
			local v = {
				["phone"] = phoneNumber,
				["owner"] = hexId,
				["cid"] = char.id
			}

			exports.ghmattimysql.execute(q, v, function()
				char.phone_number = math.floor(char.phone_number)
				user:setCharacter(char)
			end)
		end)
	end
end)
-- sway, jamerson, hawkeye was here 29.11.2020
-- and nikez too
