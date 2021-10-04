ActiveAreaEvents = {}

Citizen.CreateThread(function()
    ActiveAreaEvents = RPC.execute('np:sync:getActiveEvents') or {}
    while true do
        local idle = 1000

        Player = PlayerId()
        PlayerPed = PlayerPedId()
        ActivePlayers = GetActivePlayers()

        Citizen.Wait(idle)
    end
end)

function GetEventData(pEventId)
    for index, event in pairs(ActiveAreaEvents) do
        if event and event.id == pEventId then
            return event, index
        end
    end
end

function PlayerExist(pTargetId)
    for _, playerId in pairs(ActivePlayers) do
        if playerId == pTargetId then return true end
    end
end

function GetEventCoords(area)
    local coords = nil

    if area.type == 1 then
        coords = area.target
    elseif (area.type == 2 or area.type == 3) and area.entity ~= nil  then
        coords = GetEntityCoords(area.entity)
    end

    return coords
end

function IsInsideEventArea(coords, radius)
    local inside = false

    if coords and radius then
        inside = #(coords - PlayerCoords) <= radius
    end

    return inside
end

function TriggerInOutEvent(isInside, event, params)
    local eventName = nil

    if isInside then
        eventName = event.inEvent or ("%s:in"):format(event.eventName)
    else
        eventName = event.outEvent or ("%s:out"):format(event.eventName)
    end

    if not eventName then return end

    if event.server == true then
        TriggerServerEvent(eventName, table.unpack(params))
    else
        TriggerEvent(eventName, table.unpack(params))
    end
end

Citizen.CreateThread(function()
    while true do
        local idle = 1000

        if ActiveAreaEvents then
            for _, event in pairs(ActiveAreaEvents) do
                if event and event.area.type == 2 then
                    local playerId = GetPlayerFromServerId(event.area.target)

                    if PlayerExist(playerId) then
                        event.area.entity = GetPlayerPed(playerId)
                    else
                        event.area.entity = nil
                    end
                elseif event and event.area.type == 3 then
                    local entity = NetworkGetEntityFromNetworkId(event.area.target)

                    if DoesEntityExist(entity) then
                        event.area.entity = entity
                    else
                        event.area.entity = nil
                    end
                end
            end
        end

        Citizen.Wait(idle)
    end
end)

Citizen.CreateThread(function()
    while true do
        local idle = 500
        PlayerCoords = GetEntityCoords(PlayerPed)

        if ActiveAreaEvents then
            for _, data in pairs(ActiveAreaEvents) do
                if data then
                    local coords = GetEventCoords(data.area)
                    local isInside = IsInsideEventArea(coords, data.area.radius)

                    if isInside and not data.area.inside then
                        data.area.inside = true
                        TriggerInOutEvent(true, data.event, data.params)
                    elseif not isInside and data.area.inside then
                        data.area.inside = false
                        TriggerInOutEvent(false, data.event, data.params)
                    end
                end
            end
        end

        Citizen.Wait(idle)
    end
end)

RegisterNetEvent('np:sync:active:area:start')
AddEventHandler('np:sync:active:area:start', function (data)
    ActiveAreaEvents[#ActiveAreaEvents + 1] = data
end)

RegisterNetEvent('np:sync:active:area:stop')
AddEventHandler('np:sync:active:area:stop', function (pEventId)
    local data, index = GetEventData(pEventId)
    if data then
        ActiveAreaEvents[index] = nil
        TriggerInOutEvent(false, data.event, data.params)
    end
end)