local HotZones = {}

RegisterNetEvent('ab-infinity:hotzones:updateList')
AddEventHandler('ab-infinity:hotzones:updateList', function(zones)
    if not zones then return end

    HotZones = zones

    for _, zone in pairs(HotZones) do
        zone.tick = 0
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)

    TriggerServerEvent('ab-infinity:hotzones:requestList')

    while true do
        local idle = 4000

        local playerCoords = GetEntityCoords(PlayerPedId())

        for zoneId, zone in pairs(HotZones) do
            local isNear = zone and #(zone.coords - playerCoords) <= zone.radius or false

            if isNear and not zone.inside and zone.tick >= 2 then
                zone.inside = true
                TriggerServerEvent('ab-infinity:hotzones:enteredZone', zoneId)
            elseif isNear and not zone.inside then
                zone.tick = zone.tick + 1
            elseif isNear and zone.inside and zone.tick ~= 2 then
                zone.tick = 2
            elseif not isNear and zone and zone.inside and zone.tick <= 0 then
                zone.inside = false
                TriggerServerEvent('ab-infinity:hotzones:exitZone', zoneId)
            elseif not isNear and zone and zone.inside then
                zone.tick = zone.tick - 1
            elseif not isNear and zone and not zone.inside and zone.tick ~= 0 then
                zone.tick = 0
            end
        end

        Citizen.Wait(idle)
    end
end)

if GetConvar('sv_environment', 'production') == 'debug' then
    local debug = false

    RegisterCommand('toggleHotSpotDebug', function()
        debug = not debug

        if not debug then return end

        Citizen.CreateThread(function()
            while debug do
                for zoneId, zone in pairs(HotZones) do
                    DrawMarker(28, zone.coords.x, zone.coords.y, zone.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, zone.radius, zone.radius, zone.radius, 255, 0, 0, 100, false, false, 2, nil, nil, false)
                end

                Citizen.Wait(0)
            end
        end)
    end, false)
end