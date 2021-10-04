ABX.Events = ABX.Events or {}
ABX.Events.Registered = ABX.Events.Registered or {}

RegisterServerEvent("ab-events:listenEvent")
AddEventHandler("ab-events:listenEvent", function(id, name, args)
    local src = source

    if not ABX.Events.Registered[name] then return end

    ABX.Events.Registered[name].f(ABX.Events.Registered[name].mod, args, src, function(data)
        TriggerClientEvent("ab-events:listenEvent", src, id, data)
    end)
end)

function ABX.Events.AddEvent(self, module, func, name)
    ABX.Events.Registered[name] = {
        mod = module,
        f = func
    }
end