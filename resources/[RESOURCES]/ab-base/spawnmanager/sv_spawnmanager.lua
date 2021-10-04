ABX.SpawnManager = {}

RegisterServerEvent('ab-base:spawnInitialized')
AddEventHandler('ab-base:spawnInitialized', function()
    local src = source
    TriggerClientEvent('ab-base:spawnInitialized', src)
end)