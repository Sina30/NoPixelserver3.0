local thecount = 0
local isCop = false
local isEMS = false  
local imDead = 0
local inwater = false
local EHeld = 500


-- Anims for normal death and vehicular death.
local defaultAnimTree = "dead"
local defaultAnim = "dead_d"
local carAnimTree = "random@crash_rescue@car_death@std_car"
local carAnim = "loop"

-- Prevents players from swapping seats.


-- unsure if there is a event triggered on change of ped or not.
Citizen.CreateThread(function()
    local ped = PlayerPedId()
    SetPedConfigFlag(ped,184,true)
    while true do
        Wait(5000)
        if PlayerPedId() ~= ped then
            ped = PlayerPedId()
            SetPedConfigFlag(ped,184,true)
        end
    end
end)




RegisterNetEvent('nowCopDeathOff')
AddEventHandler('nowCopDeathOff', function()
    isCop = false
end)

RegisterNetEvent('nowCopDeath')
AddEventHandler('nowCopDeath', function()
    isCop = true
    mymodel = GetEntityModel(PlayerPedId())
end)

RegisterNetEvent('nowEMSDeathOff')
AddEventHandler('nowEMSDeathOff', function()
    isEMS = false
end)

RegisterNetEvent('hasSignedOnEms')
AddEventHandler('hasSignedOnEms', function()
    TriggerServerEvent("TokoVoip:addPlayerToRadio", 2, GetPlayerServerId(PlayerId()))
    TriggerEvent("ChannelSet",2)
    isEMS = true
end)

RegisterNetEvent("isDoctor")
AddEventHandler("isDoctor", function()
    isEMS = true
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

-- INFO: Death Check Thread
Citizen.CreateThread(function()
    SetEntityInvincible(PlayerPedId(), false)
    imDead = 0

    while true do
        Wait(100)
        if IsEntityDead(PlayerPedId()) then
            TriggerEvent("actionbar:setEmptyHanded") 
            SetEntityInvincible(PlayerPedId(), true)
            SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
            TriggerServerEvent('police:isDead', GetPedCauseOfDeath(PlayerPedId()))
            TriggerEvent("Evidence:isDead")

            -- local isFromBeatdown = exports["police"]:getIsInBeatmode()

            -- if isFromBeatdown then
            --     exports["police"]:setIsInBeatmode(false)
            --     exports["police"]:setBeatmodeDebuff(true)
            -- end

            if imDead == 0 then
                imDead = 1
                deathTimer()
            end
        end
    end
end)

RegisterNetEvent('doTimer')
AddEventHandler('doTimer', function()
    TriggerEvent('pd:deathcheck')
    while imDead == 1 do
        Citizen.Wait(0)
        if thecount > 0 then
            drawTxt(0.89, 1.42, 1.0,1.0,0.6, "Respawn: ~r~" .. math.ceil(thecount) .. "~w~ seconds remaining", 255, 255, 255, 255)
        else
            drawTxt(0.89, 1.42, 1.0,1.0,0.6, "~w~HOLD ~r~E ~w~(" .. math.ceil(EHeld/100) .. ") ~w~TO ~r~RESPAWN ~w~OR WAIT FOR ~r~EMS", 255, 255, 255, 255)
        end
    end
    TriggerEvent('pd:deathcheck')
end)



dragged = false
RegisterNetEvent('deathdrop')
AddEventHandler('deathdrop', function(beingDragged)
    dragged = beingDragged
    if not beingDragged and imDead == 1 then
        print("new char bug tell this to uc ")
        SetEntityHealth(PlayerPedId(), 200.0)
        SetEntityCoords( PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 1.0) )
    end 
end)

RegisterNetEvent('resurrect:relationships')
AddEventHandler('resurrect:relationships', function()
    NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId(),  true), true, true, false)
    ResetRelationShipGroups()
end)

RegisterNetEvent('ressurection:relationships:norevive')
AddEventHandler('ressurection:relationships:norevive', function()
    ResetRelationShipGroups()
end)

function InVeh()
  local ply = PlayerPedId()
  local intrunk = exports["isPed"]:isPed("intrunk")
  if IsPedSittingInAnyVehicle(ply) or intrunk then
    return true
  else
    return false
  end
end

function ResetRelationShipGroups()
    Citizen.Wait(1000)
    if isCop or isEMS then
        SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
        SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
    else
        SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
        SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
    end
    TriggerEvent("gangs:setDefaultRelations")
end

local disablingloop = false

RegisterNetEvent('disableAllActions')
AddEventHandler('disableAllActions', function()
    if not disablingloop then
        local ped = PlayerPedId()

        disablingloop = true

        -- wait for any ragdoll / falling to finish
        while GetEntitySpeed(ped) > 0.5 do
            Citizen.Wait(1)
        end 

        -- wait for any fire effects on player to finish
        local fireLength = 60
        while FireCheck(ped) and fireLength > 1 do
            Wait(1000)
            fireLength = fireLength - 1
        end

        -- get vehicle seat
        local seat = 0
        local veh = GetVehiclePedIsUsing(ped)
        if veh then
            local vehmodel = GetEntityModel(veh)
            for i = -1, GetVehicleModelNumberOfSeats(vehmodel) do
                if GetPedInVehicleSeat(veh,i) == ped then
                    seat = i
                end
            end
        end

        -- resurrect player
        TriggerEvent("resurrect:relationships")

        -- new ped after resurrect & reseat
        ped = PlayerPedId()
        if veh then
            TaskWarpPedIntoVehicle(ped,veh,seat)
        end

        TriggerEvent("disableAllActions2")
        SetEntityInvincible(ped, true)
        
        while imDead == 1 do
            Citizen.Wait(200)
            if InVeh() and (not IsDeadVehAnimPlaying() or IsPedRagdoll(ped)) and not FireCheck(ped) then
                DoVehDeathAnim(ped)
            elseif not InVeh() and (not IsDeadAnimPlaying() or IsPedRagdoll(ped)) and not FireCheck(ped) and not IsPedFalling(ped) then
                DoDeathAnim(ped)
            end
            Citizen.Wait(800)
        end
        SetEntityInvincible(ped, false)
        ClearPedTasksImmediately(ped)
        disablingloop = false
    end
end)

function FireCheck()
    local Coords = GetEntityCoords(PlayerPedId())
    local retval --[[ boolean ]], outPosition --[[ vector3 ]] =
	GetClosestFirePos(
		Coords.x --[[ number ]], 
		Coords.y --[[ number ]], 
		Coords.z --[[ number ]]
    )
    return retval
end

function IsDeadVehAnimPlaying()
    if IsEntityPlayingAnim(PlayerPedId(), carAnimTree, carAnim, 1) then
        return true
    else
        return false
    end
end

function IsDeadAnimPlaying()
    if IsEntityPlayingAnim(PlayerPedId(), defaultAnimTree, defaultAnim, 1) then
        return true
    else
        return false
    end
end

function DoVehDeathAnim(ped)
    --print("car anim")
    loadAnimDict( carAnimTree ) 
    TaskPlayAnim(ped, carAnimTree, carAnim, 8.0, -8, -1, 1, 0, 0, 0, 0)
end

function DoDeathAnim(ped)
    --print("death anim")
    ClearPedTasksImmediately(ped)
    loadAnimDict( defaultAnimTree ) 
    TaskPlayAnim(ped, defaultAnimTree, defaultAnim, 8.0, -8, -1, 1, 0, 0, 0, 0)
end



RegisterNetEvent('disableAllActions2')
AddEventHandler('disableAllActions2', function()
        TriggerEvent("disableVehicleActions")
        local playerPed = PlayerPedId()
        while imDead == 1 do
            Citizen.Wait(0) 
            DisableInputGroup(0)
            DisableInputGroup(1)
            DisableInputGroup(2)
            DisableControlAction(1, 19, true)
            DisableControlAction(0, 34, true)
            DisableControlAction(0, 9, true)
            DisableControlAction(0, 32, true)
            DisableControlAction(0, 8, true)
            DisableControlAction(2, 31, true)
            DisableControlAction(2, 32, true)
            DisableControlAction(1, 33, true)
            DisableControlAction(1, 34, true)
            DisableControlAction(1, 35, true)
            DisableControlAction(1, 21, true)  -- space
            DisableControlAction(1, 22, true)  -- space
            DisableControlAction(1, 23, true)  -- F
            DisableControlAction(1, 24, true)  -- F
            DisableControlAction(1, 25, true)  -- F
            if IsControlJustPressed(1,29) then
                SetPedToRagdoll(playerPed, 26000, 26000, 3, 0, 0, 0) 
                 Citizen.Wait(22000)
                 TriggerEvent("deathAnim")
            end
            DisableControlAction(1, 106, true) -- VehicleMouseControlOverride
            DisableControlAction(1, 140, true) --Disables Melee Actions
            DisableControlAction(1, 141, true) --Disables Melee Actions
            DisableControlAction(1, 142, true) --Disables Melee Actions 
            DisableControlAction(1, 37, true) --Disables INPUT_SELECT_WEAPON (tab) Actions
            DisablePlayerFiring(playerPed, true) -- Disable weapon firing
        end
        SetPedCanRagdoll(PlayerPedId(), false)
end)

RegisterNetEvent('disableVehicleActions')
AddEventHandler('disableVehicleActions', function()
    local playerPed = PlayerPedId()
    while imDead == 1 do
        local currentVehicle = GetVehiclePedIsIn(playerPed, false)
        Wait(300)
        if playerPed ==  GetPedInVehicleSeat(currentVehicle, -1) then
            SetVehicleUndriveable(currentVehicle,true)
        end
    end
end)

local bleedtime = 0
local gamerTimer = 0
function deathTimer()
    EHeld = 500
    TriggerEvent("civilian:alertPolice",100.0,"death",0)
    thecount = 300
    TriggerEvent("doTimer")
    gamerTimer = GetGameTimer()
    TriggerEvent("disableAllActions")
    bleedtime = 0
    while imDead == 1 do
        
        Citizen.Wait(5)
        
        if GetGameTimer() - gamerTimer > 1000 then

            gamerTimer = GetGameTimer()
            thecount = thecount - 1

            bleedtime = bleedtime + 1
            if bleedtime == 30 then
                TriggerEvent("evidence:bleeding",false)
                bleedtime = 0
            end

            if thecount == 60 or thecount == 120 or thecount == 180 or thecount == 240 then
                TriggerEvent("civilian:alertPolice",100.0,"death",0)
            end
            --SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))

            while thecount < 0 do
                Citizen.Wait(1)
                
                if IsControlPressed(1,38) then
                    local hspDist = #(vector3(307.93017578125,-594.99530029297,43.291835784912) - GetEntityCoords(PlayerPedId()))
                    EHeld = EHeld - 1
                    if hspDist > 5 and EHeld < 1 then
                        thecount = 99999999
                        releaseBody()
                        TriggerEvent("evidence:bleeding",true)
                    end
                else
                    EHeld = 500
                end
            end
        end      
    end
end

RegisterNetEvent('trycpr')
AddEventHandler('trycpr', function()
    curDist = #(GetEntityCoords(PlayerPedId(), 0) - vector3(2438.3266601563,4960.3046875,47.27229309082))
    curDist2 = #(GetEntityCoords(PlayerPedId(), 0) - vector3(-1001.18, 4850.52, 274.61))
    if curDist < 5 or curDist2 < 5 then
        local penis = 0
        while penis < 10 do
            penis = penis + 1
            local finished = exports["ab-ui"]:taskBarSkill(math.random(2000, 6000), math.random(5, 10))
            if finished ~= 100 then
                return
            end
            Wait(100)
        end
        TriggerServerEvent("serverCPR")
    else
        TriggerEvent("DoLongHudText","You are not near the rest house",2)
    end
end)

RegisterNetEvent('reviveFunction')
AddEventHandler('reviveFunction', function()
    attemptRevive()
end)

-- INFO: Respawn Function
function releaseBody()
    local ply = PlayerPedId()
    thecount = 240
    imDead = 0   
    ClearPedTasksImmediately(ply)
    TriggerEvent("DoLongHudText", "You have been revived by medical staff.",1)
    TriggerServerEvent('Evidence:ClearDamageStates')   
    TriggerServerEvent("ragdoll:emptyInventory")  
    TriggerServerEvent("police:SeizeCash", GetPlayerServerId(PlayerId()))
    FreezeEntityPosition(ply, false)
    -- the tp is hashed out to prevent crashing? maybe
    if isCop then
        SetEntityCoords(ply, 441.60, -982.37, 30.67)
    else
        RemoveAllPedWeapons(ply)
        SetEntityCoords(ply, 357.43, -593.36, 28.79)
    end
    SetEntityInvincible(ply, false)
    ClearPedBloodDamage(ply)

    local wasBeatdown = exports["police"]:getBeatmodeDebuff()

    if wasBeatdown then
        TriggerEvent("police:startBeatdownDebuff")
    end

    local plyPos = GetEntityCoords(ply,true)
    TriggerEvent("resurrect:relationships")
    TriggerEvent("Evidence:isAlive")
    TriggerEvent("attachWeapons")
    SetCurrentPedWeapon(ply,2725352035,true)
    TriggerEvent('ai:resetKOS')
    Citizen.CreateThread(function()
        Citizen.Wait(4000)
        TriggerEvent("unEscortPlayer")
        TriggerEvent("resetCuffs")
    end)
end

local devmode = false
RegisterNetEvent("ab-admin:currentDevmode")
AddEventHandler("ab-admin:currentDevmode", function(pDevmode)
    devmode = pDevmode
end)

-- INFO: Revive Function
function attemptRevive()
    if not devmode and InVeh() then
        print("In vehicle - can not be revived!")
        return
    end
    if imDead == 1 or IsDeadAnimPlaying() or IsDeadVehAnimPlaying() then
        imDead = 0
        thecount = 240
        local ped = PlayerPedId()
        TriggerEvent("Heal")
        SetEntityInvincible(ped, false)
        SetPedMaxHealth(ped, 200)
        SetPlayerMaxArmour(PlayerId(), 60)
        ClearPedBloodDamage(ped)
        local plyPos = GetEntityCoords(ped,  true)
        local heading = GetEntityHeading(ped)
        TriggerEvent("resurrect:relationships")
        TriggerEvent("Evidence:isAlive")
        TriggerEvent('ai:resetKOS')
        ClearPedTasksImmediately(ped)

        local wasBeatdown = exports["police"]:getBeatmodeDebuff()

        if wasBeatdown then
            TriggerEvent("police:startBeatdownDebuff")
        end
        NetworkResurrectLocalPlayer(plyPos, heading, false, false, false)
        Citizen.Wait(500)
        RemoveAllPedWeapons(ped,true)
        getup()
    end
end

function getup()
    ClearPedSecondaryTask(PlayerPedId())
    loadAnimDict( "random@crash_rescue@help_victim_up" ) 
    TaskPlayAnim( PlayerPedId(), "random@crash_rescue@help_victim_up", "helping_victim_to_feet_victim", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
    SetCurrentPedWeapon(PlayerPedId(),2725352035,true)
    Citizen.Wait(3000)
    endanimation()
end

function endanimation()
    ClearPedSecondaryTask(PlayerPedId())
end

function loadAnimDict( dict )
    RequestAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        
        Citizen.Wait( 1 )
    end
end


RegisterNetEvent("heal")
AddEventHandler('heal', function()
	local ped = PlayerPedId()
	if DoesEntityExist(ped) and not IsEntityDead(ped) then
		SetEntityHealth(ped, GetEntityMaxHealth(ped))
	end
end)

RegisterNetEvent('phoneGui')
AddEventHandler('phoneGui', function()
  if imDead == 1 then
    TriggerEvent("DoLongHudText","You are unconcious. You can not communicate.",2)
  else
    TriggerEvent("phoneGui2")
  end
end)
