local playerHolding = {}
local isNear = false
Citizen.CreateThread(function()
	exports["ab-polyzone"]:AddBoxZone("spawnZone", vector3(-3962.55, 2014.91, 500.91), 31.2, 20.2,  {
		name="spawn",
        heading=340,
        minZ=498.51,
        maxZ=506.31
    })

end)


local listening = false

function checkPlayers()

    listening = true
    
    Citizen.CreateThread(function()
        while listening do
            local tempTable = {}
            local players = GetActivePlayers()
            local ped = PlayerPedId()
            for index,value in pairs(players) do
                local target = GetPlayerPed(value)
                if(target ~= ped) then
                    local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
                    local distance = #(vector3(-3963.54,2013.95, 499.92) - vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]))
                    if(distance < 10.0) then
                        tempTable[#tempTable+1] = value
                    end
                end
            end

            playerHolding = {}
            playerHolding = Spawn.shallowCopy(tempTable)
            Citizen.Wait(1000)
        end
        playerHolding = {}
    end)


    Citizen.CreateThread(function()
        while listening do
            for index,value in ipairs(playerHolding) do
                if(value ~= nil) then
                    NetworkConcealPlayer(value,true,false)
                end
            end
            DisableAllControlActions(0)
            DisableAllControlActions(1)
            Citizen.Wait(0)
        end
    end)
end

AddEventHandler("ab-polyzone:enter", function(name)
    if name ~= "spawnZone" then return end
    checkPlayers()
end)
AddEventHandler("ab-polyzone:exit", function(name)
    if name ~= "spawnZone" then return end
    listening = false
end)









