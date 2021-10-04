NPCHandler = {}

function NPCHandler:new()
    local this = {}

    this.id = {}
    this.npcs = {}
    this.active = false

    self.__index = self

    return setmetatable(this, self)
end

function NPCHandler:npcExists(id)
    return self.npcs[id] ~= nil
end

function NPCHandler:getNPCByID(id)
    if self:npcExists(id) then
        return self.npcs[id]["npc"]
    end
end

function NPCHandler:getNPCByHash(hash)
    for _, data in pairs(self.npcs) do
        if GetHashKey(data.npc.id) == hash then
            return data
        end
    end
end

function NPCHandler:addNPC(npc, distance)
    if not npc or not npc.id or self:npcExists(npc.id) then return end

    self.npcs[npc.id] = {npc = npc, distance = distance}
end

function NPCHandler:removeNPC(id)
    if not self:npcExists(id) then return end

    self.npcs[id]["npc"]:delete()

    if self.npcs[id]["npc"].blipHandler then
        self.npcs[id]["npc"].blipHandler:delete()
    end

    self.npcs[id] = nil
end

function NPCHandler:disableNPC(id)
    if not self:npcExists(id) then return end

    if self.npcs[id]["npc"].blipHandler then
        self.npcs[id]["npc"].blipHandler:delete()
    end

    self.npcs[id]["npc"]:disable()
end

function NPCHandler:enableNPC(id)
    if not self:npcExists(id) then return end
    self.npcs[id]["npc"]:enable()
    local currentNPC = self.npcs[id]["npc"]

    if currentNPC and currentNPC.blip then
        local blipHandler = Blip:new(currentNPC.position.coords, currentNPC.blip)
        blipHandler:add()
        currentNPC.blipHandler = blipHandler
    end
end

function NPCHandler:startThread(delay)
    Citizen.CreateThread(function()
        local idle = delay or 500

        self.active = true

        while self.active do
            local playerCoords = GetEntityCoords(PlayerPedId())

            for _, entry in pairs(self.npcs) do
                local npc, spawnDistance = entry.npc, entry.distance

                local distance = #(npc.position.coords - playerCoords)

                if distance <= spawnDistance and not npc.spawned and not npc.disabled then
                    npc:spawn()
                elseif distance > spawnDistance and npc.spawned or npc.disabled and npc.spawned then
                    npc:delete()
                end
            end

            Citizen.Wait(idle)
        end
    end)
end

function NPCHandler:stopThread()
    self.active = false

    Citizen.Wait(500)

    for _, entry in pairs(self.npcs) do
        entry.npc:delete()
    end
end