RegisterServerEvent("ab-base:sv:player_control_set")
AddEventHandler("ab-base:sv:player_control_set", function(controlsTable)
    local src = source
    ABX.DB:UpdateControls(src, controlsTable, function(UpdateControls, err)
            if UpdateControls then
                -- we are good here.
            end
    end)
end)

RegisterServerEvent("ab-base:sv:player_controls")
AddEventHandler("ab-base:sv:player_controls", function()
    local src = source
    ABX.DB:GetControls(src, function(loadedControls, err)
        if loadedControls ~= nil then 
            TriggerClientEvent("ab-base:cl:player_control", src, loadedControls) 
        else 
            TriggerClientEvent("ab-base:cl:player_control",src, nil) print('controls fucked') 
        end
    end)
end)
