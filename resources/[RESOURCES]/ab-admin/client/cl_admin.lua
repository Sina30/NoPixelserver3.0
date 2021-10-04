function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function ABX.Admin.Init(self)
    self.Menu:Init()
    self:CheckForSessions()
    self:AFKCheck()
    SetRichPresence("Eating Chicken")
end

local checkingForSessions
local exludedZones = {
    [1] = {['x'] = 238.41,['y'] = -404.68,['z'] = 47.93,["r"] = 20},
    [2] = {['x'] = 234.16,['y'] = -418.85,['z'] = -118.19,["r"] = 60},
    [3] = {['x'] = 257.02,['y'] = -368.93,['z'] = -44.13,["r"] = 40},
    [4] = {['x'] = 323.47,['y'] = -1619.64,['z'] = -66.78,["r"] = 100},
}

local isInNoclip = false
local devmodeToggle = false

function ABX.Admin.CheckForSessions(self)
    if checkingForSessions then return else checkingForSessions = true end

    -- Citizen.CreateThread(function()
    --     while true do
    --         Citizen.Wait(2000)

    --         local players = ABX._Admin.Players

    --         for k,v in pairs(players) do
    --             local src = v.source
    --             local playerId = GetPlayerFromServerId(src)
    --             if not src then
    --                 ABX._Admin.Players[src].sessioned = true
    --             else
    --                 if not NetworkIsPlayerActive(playerId) or not NetworkIsPlayerConnected(playerId) then ABX._Admin.Players[src].sessioned = true end
    --             end
    --         end
    --     end
    -- end)
end

local afk = {
    checkingAFK = nil,
    isAfk = false,
    msgAFK = false,
    stringToType = "",
    event = nil,
    posStart = nil,
    afkStart = nil
}
stop = true
function ABX.Admin.BeginAFK(self, stop)
    if stop then
        afk.isAfk = false
        afk.msgAFK = false
        afk.stringToType = ""
        afk.afkStart = nil
        afk.posStart = nil
        ABX.Admin:SetStatus("Playing")
        if afk.event then
            RemoveEventHandler(afk.event)
        end
        return
    end

    if afk.msgAFK then return end

    self:SetStatus("AFK")
    afk.stringToType = ""

    for i = 1, 5 do
        local c = string.char(GetRandomIntInRange(97, 122))
        afk.stringToType = afk.stringToType .. string.lower(c)
    end

    afk.event = AddEventHandler("ab-admin:afkStringCheck", function(text)
        if string.lower(text) == afk.stringToType then ABX.Admin:BeginAFK(true) return end
    end)

    afk.msgAFK = true
    local beginTime = GetGameTimer()

    Citizen.CreateThread(function()
        local lastNotify = 0

        while true do
            Citizen.Wait(1000)

            if not afk.msgAFK then return end
            
            local curTime = GetGameTimer()

            if curTime - lastNotify >= 6500 then
                lastNotify = GetGameTimer()

                local string = [[<center><span style="font-size:28px;color:red;">You have been detected as AFK. Please type the message below within 5 minutes!<br /><hr style="border-color: rgba(255, 0, 0, 0.5);">%s</span></center>]]
                TriggerEvent("pNotify:SendNotification", {text = string.format(string, afk.stringToType), layout = "top", timeout = 5000, type = "error", animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}, queue = "afk", progressBar = false})
            end

            if curTime - beginTime >= 300000 then TriggerServerEvent("ab-admin:Disconnect", "AFK Kick") return end
        end
    end)
end

function ABX.Admin.AFKCheck(self)
    if afk.checkingAFK then return else afk.checkingAFK = true end

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)

            local ped = PlayerPedId()
            
            local curPos = GetEntityCoords(ped, false)
            local curTime = GetGameTimer()

            local rank = ABX.Admin:GetPlayerRank()
            local rankData = ABX.Admin:GetRankData(rank)
            local inExluded = false

            for i,v in ipairs(exludedZones) do
                if #(vector3(v.x,v.y,v.z) - GetEntityCoords(PlayerPedId())) < v.r then
                    inExluded = true
                end
            end

            if rankData and not rankData.allowafk and not inExluded then
                afk.posStart = afk.posStart and afk.posStart or curPos

                if Vdist2(afk.posStart, curPos) <= 20.0 then afk.afkStart = afk.afkStart and afk.afkStart or GetGameTimer() else afk.afkStart = nil afk.posStart = nil end
                if IsPedRagdoll(ped) then afk.afkStart = nil afk.posStart = nil end

                if afk.afkStart and curTime - afk.afkStart >= 1200000 and not afk.isAfk then
                    ABX.Admin:BeginAFK()
                else
                    if afk.isAfk == true then
                        ABX.Admin:BeginAFK(true)
                    end
                end
            end
        end
    end)
end

RegisterNetEvent("ab-admin:afkStringCheck")

RegisterNetEvent("ab-admin:setStatus")
AddEventHandler("ab-admin:setStatus", function(src, status)
    local player = ABX._Admin.Players[src]
    if not player then return else ABX._Admin.Players[src].status = status end
end)

RegisterNetEvent("ab-admin:sendPlayerInfo")
AddEventHandler("ab-admin:sendPlayerInfo", function(data, discData)
    ABX._Admin.Players = data
    ABX._Admin.DiscPlayers = discData
end)

RegisterNetEvent("ab-admin:RemovePlayer")
AddEventHandler("ab-admin:RemovePlayer", function(src)
    local data = ABX._Admin.Players[src]
    ABX._Admin.DiscPlayers[src] = data
    ABX._Admin.Players[src] = nil
end)

RegisterNetEvent("ab-admin:AddPlayer")
AddEventHandler("ab-admin:AddPlayer", function(player)
    ABX._Admin.Players[player.source] = player
end)


RegisterNetEvent('event:control:adminDev')
AddEventHandler('event:control:adminDev', function(useID)
    if not devmodeToggle then return end
    if ABX.Admin:GetPlayerRank() == "dev" then
        if useID == 1 then
            TriggerEvent("ab-admin:openMenu")
        elseif useID == 2 then
            local bool = not isInNoclip
            ABX.Admin.RunNclp(nil,bool)
            TriggerEvent("ab-admin:noClipToggle",bool)
            TriggerServerEvent("admin:noclipFromClient",bool)
        elseif useID == 3 then
            TriggerEvent("ab-admin:CloakRemote")
        elseif useID == 4 then
            ABX.Admin.teleportMarker(nil)
        end
    end
end)

RegisterNetEvent("ab-admin:currentDevmode")
AddEventHandler("ab-admin:currentDevmode", function(devmode)
    devmodeToggle = devmode
end)

RegisterNetEvent("ab-admin:AddPlayer")
AddEventHandler("ab-admin:AddPlayer", function(player)
    ABX._Admin.Players[player.source] = player
end)

function ABX.Admin.RunCommand(self, args)
    if not args or not args.command then return end
    TriggerServerEvent("ab-admin:runCommand", args)
end

function ABX.Admin.RunClCommand(self, cmd, args)
    if not cmd or not self:CommandExists(cmd) then return end
    self:GetCommandData(cmd).runclcommand(args)
end


function ABX.Admin.teleportMarker(self)
    local rank = ABX.Admin:GetPlayerRank()
    local rankData = ABX.Admin:GetRankData(rank)

    if rankData and rankData.grant < 90 then return end

    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                break
            end

            Citizen.Wait(5)
        end

    else
        TriggerEvent("DoLongHudText", 'Failed to find marker.',2)
    end

end

function ABX.Admin.split(source, sep)
    local result, i = {}, 1
    while true do
        local a, b = source:find(sep)
        if not a then break end
        local candidat = source:sub(1, a - 1)
        if candidat ~= "" then 
            result[i] = candidat
        end i=i+1
        source = source:sub(b + 1)
    end
    if source ~= "" then 
        result[i] = source
    end
    return result
end

function ABX.Admin.RunNclp(self,bool)
    local cmd = {}
    cmd = {
        vars = {}
    }


    local rank = ABX.Admin:GetPlayerRank()
    local rankData = ABX.Admin:GetRankData(rank)

    if rankData and rankData.grant < 90 then return end
    
    if bool and isInNoclip then return end
    isInNoclip = bool
    
    TriggerEvent("ab-admin:noClipToggle", isInNoclip)
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

RegisterNetEvent("ab-admin:RunClCommand")
AddEventHandler("ab-admin:RunClCommand", function(cmd, args)
    ABX.Admin:RunClCommand(cmd, args)
end)

RegisterNetEvent("ab-admin:updateData")
AddEventHandler("ab-admin:updateData", function(src, type, data)
    if not src or not type or not data then return end
    if not ABX._Admin.Players[src] then return end
    
    ABX._Admin.Players[src][type] = data
end)

RegisterNetEvent("ab-admin:noLongerAdmin")
AddEventHandler("ab-admin:noLongerAdmin", function()
    ABX._Admin.Players = {}
    
    for k,v in pairs(ABX._Admin.Menu.Menus) do
        if WarMenu.IsMenuOpened(k) then WarMenu.CloseMenu() end
    end
end)

RegisterNetEvent("ab-admin:bringPlayer")
AddEventHandler("ab-admin:bringPlayer", function(targPos)
    local ped = PlayerPedId()


    Citizen.CreateThread(function()
        RequestCollisionAtCoord(targPos[1],targPos[2],targPos[3])
        SetEntityCoordsNoOffset(PlayerPedId(), targPos[1],targPos[2],targPos[3], 0, 0, 2.0)
        FreezeEntityPosition(PlayerPedId(), true)
        SetPlayerInvincible(PlayerId(), true)

        local startedCollision = GetGameTimer()

        while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
            if GetGameTimer() - startedCollision > 5000 then break end
            Citizen.Wait(0)
        end

        FreezeEntityPosition(PlayerPedId(), false)
        SetPlayerInvincible(PlayerId(), false)
    end)    
end)

RegisterNetEvent("ab-admin:bring")
AddEventHandler("ab-admin:bring", function(target)
    local posR = GetEntityCoords(PlayerPedId(), false)

    local pos = {}
    pos[1] = posR.x
    pos[2] = posR.y
    pos[3] = posR.z

    TriggerServerEvent("ab-admin:bringPlayerServer",pos,target)   
end)



local LastVehicle = nil
RegisterNetEvent("ab-admin:runSpawnCommand")
AddEventHandler("ab-admin:runSpawnCommand", function(model, livery)
    Citizen.CreateThread(function()

        local hash = GetHashKey(model)

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
        
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

        local localped = PlayerPedId()
        local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 1.5, 5.0, 0.0)

        local heading = GetEntityHeading(localped)
        local vehicle = CreateVehicle(hash, coords, heading, true, false)

        SetVehicleModKit(vehicle, 0)
        SetVehicleMod(vehicle, 11, 3, false)
        SetVehicleMod(vehicle, 12, 2, false)
        SetVehicleMod(vehicle, 13, 2, false)
        SetVehicleMod(vehicle, 15, 3, false)
        SetVehicleMod(vehicle, 16, 4, false)


        if model == "pol1" then
            SetVehicleExtra(vehicle, 5, 0)
        end

        if model == "police" then
            SetVehicleWheelType(vehicle, 2)
            SetVehicleMod(vehicle, 23, 10, false)
            SetVehicleColours(vehicle, 0, false)
            SetVehicleExtraColours(vehicle, 0, false)
        end

        if model == "pol7" then
            SetVehicleColours(vehicle,0)
            SetVehicleExtraColours(vehicle,0)
        end

        if model == "pol5" or model == "pol6" then
            SetVehicleExtra(vehicle, 1, -1)
        end


        local plate = GetVehicleNumberPlateText(vehicle)
        TriggerEvent("keys:addNew",vehicle,plate)
        TriggerServerEvent('garages:addJobPlate', plate)
        SetModelAsNoLongerNeeded(hash)
        
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)

        if livery ~= nil then
            SetVehicleLivery(vehicle, tonumber(livery))
        end
        LastVehicle = vehicle
    end)
end)


RegisterNetEvent("ab-admin:SeatIntoLast")
AddEventHandler("ab-admin:SeatIntoLast", function()
    local rank = ABX.Admin:GetPlayerRank()
    local rankData = ABX.Admin:GetRankData(rank)

    if rankData and rankData.grant < 90 then return end
    if LastVehicle ~= nil then
        TaskWarpPedIntoVehicle(PlayerPedId(),LastVehicle,-1)
    else
         TriggerEvent("DoLongHudText", 'Failed to find Vehicle.',2)
    end
end)

RegisterNetEvent("ab-admin:ReviveInDistance")
AddEventHandler("ab-admin:ReviveInDistance", function()
    local rank = ABX.Admin:GetPlayerRank()
    local rankData = ABX.Admin:GetRankData(rank)

    if rankData and rankData.grant < 90 then return end
    local playerList = {}

    local players = GetPlayers()
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)


    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
        local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
        if(distance < 50) then
            playerList[index] = GetPlayerServerId(value)
        end
    end

    if playerList ~= {} and playerList ~= nil then
        TriggerServerEvent("admin:reviveAreaFromClient",playerList)

        for k,v in pairs(playerList) do
             TriggerServerEvent("reviveGranted", v)
             TriggerEvent("Hospital:HealInjuries",true) 
             TriggerServerEvent("ems:healplayer", v)
             TriggerEvent("heal")
        end
    end
    
end)


ABX.Admin:Init()