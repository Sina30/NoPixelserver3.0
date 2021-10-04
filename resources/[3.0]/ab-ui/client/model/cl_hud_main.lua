local gameDirty = false
local gameValues = {}
local hudDirty = false
local hudValues = {}

-- function makeHudDirty()
--     hudDirty = true
-- end
-- function setHudValue(k, v)
--     if hudValues[k] == nil or hudValues[k] ~= v then
--         hudDirty = true
--     end
--     hudValues[k] = v
-- end
function setGameValue(k, v)
    if gameValues[k] == nil or gameValues[k] ~= v then
        gameDirty = true
    end
    gameValues[k] = v
end

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(256)
--         if hudDirty then
--             hudDirty = false
--             sendAppEvent("hud", hudValues)
--         end
--         Citizen.Wait(256)
--         if gameDirty then
--             gameDirty = false
--             sendAppEvent("game", gameValues)
--         end
--     end
-- end)