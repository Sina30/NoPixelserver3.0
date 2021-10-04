local hudDisplay = false

RegisterCommand("hud", function(source)
    SetNuiFocus(true,true)
    SendNUIMessage({
        response = "hud"
    })
end)

function setDisplayHud(bool)
    
    SendNUIMessage({
        response = "hud"
    })
end

RegisterNUICallback('closeHud', function()
    print("FUCK CLOSE MY HUD MENU")
    SetNuiFocus(false, false)
    hudDisplay = false
end)

RegisterNUICallback('UpdateHudSettings', function(data)
    print("SETTINGS HUD FROM JS", json.encode(data))
    TriggerEvent("DoLongHudText","Hud Settings Save!") 
    TriggerEvent('hudmenu:set',data)
end)