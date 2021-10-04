Spawn.gameplayFunction = false
function runGameplay()
    if Spawn.gameplayFunction then return end
    Citizen.CreateThread(function()
        for i = 1, 15 do
            EnableDispatchService(i, false)
        end

        -- enable pvp
        for i = 0, 255 do
            if NetworkIsPlayerConnected(i) then
                if NetworkIsPlayerConnected(i) and GetPlayerPed(i) ~= nil then
                    SetCanAttackFriendly(GetPlayerPed(i), true, true)
                end
            end
        end

        SetMaxWantedLevel(0)

        NetworkSetFriendlyFireOption(true)

        -- Disable vehicle rewards
        DisablePlayerVehicleRewards(PlayerId())
    end)
end