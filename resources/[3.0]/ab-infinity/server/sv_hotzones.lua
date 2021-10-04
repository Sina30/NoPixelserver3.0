RegisterServerEvent("ab-infinity:hotzones:requestList")
AddEventHandler("ab-infinity:hotzones:requestList",function()
    local src = source
    TriggerClientEvent("v-infinity:hotzones:updateList",src,Config.hotzones)
end)

RegisterServerEvent("ab-infinity:hotzones:enteredZone")
AddEventHandler("ab-infinity:hotzones:enteredZone",function(zoneId)

end)

RegisterServerEvent("ab-infinity:hotzones:exitZone")
AddEventHandler("ab-infinity:hotzones:exitZone",function(zoneId)

end)