RegisterServerEvent('ab-login:disconnectPlayer')
AddEventHandler('ab-login:disconnectPlayer', function()
    local src = source
    DropPlayer(src, "You have been disconnected from the server")
end)