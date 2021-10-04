local Resources = {}

Handler = NPCHandler:new()

Citizen.CreateThread(function()
    Handler:startThread(500)
end)

-- TODO: Better integration with external scripts and animation handler

function GetNPC(id)
    if not Handler:npcExists(id) then return end
    return Handler.npcs[id]["npc"]
end

exports("GetNPC", GetNPC)

function RegisterNPC(data, resource)
    if not Resources[resource] then Resources[resource] = {} end

    Resources[resource][data.id] = true

    if type(data.position.coords) ~= 'vector3' then
        data.position.coords = vector3(position.coords.x, position.coords.y, position.coords.z)
    end

    if not Handler:npcExists(data.id) then
        local npc = NPC:new(data.id, data.pedType, data.model, data.position, (type(data.appearance) == "string" and json.decode(data.appearance) or data.appearance), data.animation, data.networked, data.settings, data.flags, data.scenario, data.blip)

        Handler:addNPC(npc, data.distance)

        return npc
    else
        Handler.npcs[data.id]["npc"]["position"] = data.position

        return Handler.npcs[data.id]["npc"]
    end
end

exports("RegisterNPC", RegisterNPC)

function RemoveNPC(id)
    if not Handler:npcExists(id) then return end
    Handler:removeNPC(id)
end

exports("RemoveNPC", RemoveNPC)

function DisableNPC(id)
    if not Handler:npcExists(id) then return end
    Handler:disableNPC(id)
end

exports("DisableNPC", DisableNPC)

function EnableNPC(id)
    if not Handler:npcExists(id) then return end
    Handler:enableNPC(id)
end

exports("EnableNPC", EnableNPC)

function UpdateNPCData(id, key, value)
    if not Handler:npcExists(id) then return end
    Handler.npcs[id]["npc"][key] = value
end

exports("UpdateNPCData", UpdateNPCData)

function FindNPCByHash(hash)
    local found, npc = false

    for _, data in pairs(Handler.npcs) do
        if GetHashKey(data.npc.id) == hash then
            found, npc = true, data.npc
            break
        end
    end

    return found, npc
end

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, data in pairs(Handler.npcs) do
            data["npc"]:delete()
        end
    elseif Resources[resourceName] then
        for id, active in pairs(Resources[resourceName]) do
            if active then
                RemoveNPC(id)
            end
        end
    end
end)