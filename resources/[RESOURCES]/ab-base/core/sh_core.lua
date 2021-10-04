ABX.Core = ABX.Core or {}

function ABX.Core.ConsoleLog(self, msg, mod)
    if not tostring(msg) then return end
    if not tostring(mod) then mod = "No Module" end
    
    local pMsg = string.format("[ABX LOG - %s] %s", mod, msg)
    if not pMsg then return end

    print(pMsg)
end

RegisterNetEvent("ab-base:consoleLog")
AddEventHandler("ab-base:consoleLog", function(msg, mod)
    ABX.Core:ConsoleLog(msg, mod)
end)

function getModule(module)
    if not ABX[module] then print("Warning: '" .. tostring(module) .. "' module doesn't exist") return false end
    return ABX[module]
end

function addModule(module, tbl)
    if ABX[module] then print("Warning: '" .. tostring(module) .. "' module is being overridden") end
    ABX[module] = tbl
end

ABX.Core.ExportsReady = false

function ABX.Core.WaitForExports(self)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if exports and exports["ab-base"] then
                TriggerEvent("ab-base:exportsReady")
                ABX.Core.ExportsReady = true
                return
            end
        end
    end)
end

ABX.Core:WaitForExports()