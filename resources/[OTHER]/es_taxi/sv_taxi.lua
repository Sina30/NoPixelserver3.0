RegisterServerEvent('taskleavetaxi')
AddEventHandler('taskleavetaxi', function()
    local src = source
	local user = exports["ab-base"]:getModule("Player"):GetUser(src)

	user:removeMoney(math.random(100,350))
end)