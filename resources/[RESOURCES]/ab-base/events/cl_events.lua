ABX.Events = ABX.Events or {}
ABX.Events.Total = 0
ABX.Events.Active = {}

function ABX.Events.Trigger(self, event, args, callback)
    local id = ABX.Events.Total + 1
    ABX.Events.Total = id

    id = event .. ":" .. id

    if ABX.Events.Active[id] then return end

    ABX.Events.Active[id] = {cb = callback}
    
    TriggerServerEvent("ab-events:listenEvent", id, event, args)
end

RegisterNetEvent("ab-events:listenEvent")
AddEventHandler("ab-events:listenEvent", function(id, data)
    local ev = ABX.Events.Active[id]
    
    if ev then
        ev.cb(data)
        ABX.Events.Active[id] = nil
    end
end)