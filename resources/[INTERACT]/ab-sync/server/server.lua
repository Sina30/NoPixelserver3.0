RegisterServerEvent("np:sync:player:ready")
AddEventHandler("np:sync:player:ready",function()
    
end)

RegisterServerEvent("sync:request")
AddEventHandler("sync:request",function(native,pTargetId,NetId, ...)
    TriggerClientEvent("sync:execute", -1, native,NetId, ...)
end)

RegisterServerEvent("ab-sync:executeSyncNative")
AddEventHandler("ab-sync:executeSyncNative",function(name, netEntity, options, args)
    TriggerClientEvent("ab-sync:clientExecuteSyncNative",-1,name, netEntity, options, args)
end)