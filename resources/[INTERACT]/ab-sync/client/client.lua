TriggerServerEvent("np:sync:player:ready")

RegisterNetEvent("sync:execute")
AddEventHandler("sync:execute", function(native, netID, ...)
    local entity = NetworkGetEntityFromNetworkId(netID)

    if Sync[native] then
        Sync[native](entity, ...)
    end
end)

function SyncedExecution(native, entity, ...)
    if NetworkHasControlOfEntity(entity) then
        Sync[native](entity, ...)
    else
        RequestSyncExecution(native, entity, ...)
    end
end

exports("SyncedExecution", SyncedExecution)

--
-- better sync method
-- prob wanna use this instead
-- onesync needs to be better
--
-- options table:
-- - entity = { 1, 2, 4 }
-- - - table key IDs for network conversion

function syncNative(name, netEntity, options, ...)
    TriggerServerEvent("ab-sync:executeSyncNative", name, netEntity, options, table.pack(...))
end
exports("syncNative", syncNative)

RegisterNetEvent("ab-sync:clientExecuteSyncNative")
AddEventHandler("ab-sync:clientExecuteSyncNative", function(native, netEntity, options, args)
    if options and options.entity then
        for _, v in pairs(options.entity) do
            args[v] = NetworkGetEntityFromNetworkId(args[v])
        end
    end
    if native == "0xB736A491E64A32CF" then
        SetEntityAsNoLongerNeeded(args[1])
        return
    end
    local result = Citizen.InvokeNative(native, table.unpack(args))
end)
