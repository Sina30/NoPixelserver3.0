RegisterServerEvent("ab-base:sv:player_settings_set")
AddEventHandler("ab-base:sv:player_settings_set", function(settingsTable)
    local src = source
    ABX.DB:UpdateSettings(src, settingsTable, function(UpdateSettings, err)
            if UpdateSettings then
                -- we are good here.
            end
    end)
end)

RegisterServerEvent("ab-base:sv:player_settings")
AddEventHandler("ab-base:sv:player_settings", function()
    local src = source
    ABX.DB:GetSettings(src, function(loadedSettings, err)
        if loadedSettings ~= nil then 
            TriggerClientEvent("ab-base:cl:player_settings", src, loadedSettings) 
        else 
            TriggerClientEvent("ab-base:cl:player_settings",src, nil) 
        end
    end)
end)
