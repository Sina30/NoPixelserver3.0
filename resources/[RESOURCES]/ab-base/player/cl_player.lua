ABX.Player = ABX.Player or {}
ABX.LocalPlayer = ABX.LocalPlayer or {}

local function GetUser()
    return ABX.LocalPlayer
end

function ABX.LocalPlayer.setVar(self, var, data)
    GetUser()[var] = data
end

function ABX.LocalPlayer.getVar(self, var)
    return GetUser()[var]
end

function ABX.LocalPlayer.setCurrentCharacter(self, data)
    if not data then return end
    GetUser():setVar("character", data)
end

function ABX.LocalPlayer.getCurrentCharacter(self)
    return GetUser():getVar("character")
end

RegisterNetEvent("ab-base:networkVar")
AddEventHandler("ab-base:networkVar", function(var, val)
    ABX.LocalPlayer:setVar(var, val)
end)