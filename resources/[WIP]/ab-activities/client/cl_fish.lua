local isFishing = false
local inZone = false
local cancel = false
local veh = 0
local canSpawn = true
local zones = {
    'OCEANA',
    'ELYSIAN',
    'CYPRE',
    'DELSOL',
    'LAGO',
    'ZANCUDO',
    'ALAMO',
    'NCHU',
    'CCREAK',
    'PALCOV',
    'PALETO',
    'PROCOB',
    'ELGORL',
    'SANCHIA',
    'PALHIGH',
    'DELBE',
    'PBLUFF',
    'SANDY',
    'GRAPES',
}

RegisterNetEvent('ab-fish:lego')
AddEventHandler('ab-fish:lego', function()
    if isFishing == false then
        if exports["ab-inventory"]:hasEnoughOfItem('fishbait',1,false) then
            local finished = exports["ab-taskbar"]:taskBar(math.random(2500, 6000),"Putting Bait on the Hook",true,false,playerVeh)
            if finished == 100 then
                TriggerEvent("inventory:removeItem", "fishbait", 1)
                StartFish()
            end
        else
            TriggerEvent('DoLongHudText', "how will you catch a fish without a bait ?", 2)
        end
    elseif isFishing == true then
        TriggerEvent('DoLongHudText', 'You are already fishing dingus.', 2)
    end
end)

function checkZone()
    local ply = PlayerPedId()
    local coords = GetEntityCoords(ply)
    local currZone = GetNameOfZone(coords)
    for k,v in pairs(zones) do
        if currZone == v then
            inZone = true
            break
        else
            inZone = false
        end
    end
    
end

function StartFish()
    local ply = PlayerPedId()
    local onBoat = false
    local function GetEntityBelow()
        local Ent = nil
        local CoA = GetEntityCoords(ply, 1)
        local CoB = GetOffsetFromEntityInWorldCoords(ply, 0.0, 0.0, 5.0)
        local RayHandle = CastRayPointToPoint(CoA.x, CoA.y, CoA.z, CoB.x, CoB.y, CoB.z, 10, ply, 0)
        local A,B,C,D,Ent = GetRaycastResult(RayHandle)
        return Ent
    end
    local boat = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.000, 0, 12294)
    checkZone()
    Citizen.Wait(250)
    if IsEntityInWater(boat) and IsPedSwimming(ply) == false and inZone == true then
        if exports["ab-inventory"]:hasEnoughOfItem('fishingrod',1,false) then
            isFishing = true
            cancel = false
            Fish()
        end
    elseif IsEntityInWater(ply) and IsPedSwimming(ply) == false and inZone == true then 
        if exports["ab-inventory"]:hasEnoughOfItem('fishingrod',1,false) then
            isFishing = true
            cancel = false
            Fish()
        end
    else
        TriggerEvent('DoLongHudText', 'You cant fish here.', 2)
    end
end  


function Fish()
    if cancel == false then
        if IsPedSwimming(PlayerPedId()) then 
            TriggerEvent("DoLongHudText","You haven't quite learned how to multitask yet",2)
            return  
        end
        if IsPedInAnyVehicle(PlayerPedId()) then 
            TriggerEvent("DoLongHudText","Exit your vehicle first to start fishing!",2)
            return 
        end

        local ply = PlayerPedId()
       --playerAnim() 
        TaskStartScenarioInPlace(ply, 'WORLD_HUMAN_STAND_FISHING', 0, true)
        timer = math.random(5000,10000)
        Citizen.Wait(timer)
        Catch()
    end
end

function Repeat()
    timer = math.random(5000,10000)
    if cancel == false then
        Citizen.Wait(timer)
        Catch()
    end
end

function Catch()
    if cancel == false then
        local ply = PlayerPedId()
        Citizen.Wait(math.random(10000, 30000))
        TriggerEvent('DoLongHudText', 'I think there is a fish on the line.', 1)
        Citizen.Wait(1000)
        local finished = exports["ab-ui"]:taskBarSkill(math.random(1000,2000),math.random(15,20))
        if finished == 100 then
            local finished2 = exports["ab-ui"]:taskBarSkill(math.random(1000,2000),math.random(1,3))
            if finished2 == 100 then
                isFishing = false
                local rdn = math.random(1,100)
                if rdn <= 10 then
                    Citizen.Wait(2000)
                    SetCurrentPedWeapon(ply, `WEAPON_UNARMED`, true)
                    ClearPedTasksImmediately(ply)
                    Repeat()
                elseif rdn > 11 then
                    TriggerEvent( "player:receiveItem","fishingmackerel",1)
                    TriggerEvent('DoLongHudText', 'You caught a Fish!', 1)
                    TriggerServerEvent('ab-fish:getFish')
                    SetCurrentPedWeapon(ply, `WEAPON_UNARMED`, true)
                    ClearPedTasksImmediately(ply)
                end
            elseif finished ~= 100 then
                TriggerEvent('DoLongHudText', 'The fish got away.', 2)
                Repeat()
            else
                TriggerEvent( "player:receiveItem","fishingmackerel",1)
                SetCurrentPedWeapon(ply, `WEAPON_UNARMED`, true)
                ClearPedTasksImmediately(ply)
                isFishing = false
            end
        else
            SetCurrentPedWeapon(ply, `WEAPON_UNARMED`, true)
            ClearPedTasksImmediately(ply)
            isFishing = false
        end
    end
end


function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

local blips = {
    {title="Fishing Processing", colour=41, id=501, scale=0.5, x = 999.75, y = -2169.96, z = 29.47},
    {title="La Spada", colour=9, id=356, scale=0.5, x = -1846.64, y = -1190.94, z = 13.33}
}

function SellItemsFishes()
    if exports["ab-inventory"]:getQuantity("deskinedfish") >= 1 then
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
            prop = CreateObject(GetHashKey('hei_prop_heist_box'), x, y, z,  true,  true, true)
            SetEntityHeading(prop, GetEntityHeading(GetPlayerPed(-1)))
            FreezeEntityPosition(GetPlayerPed(-1), true)
            LoadDict('amb@medic@standing@tendtodead@idle_a')
            TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
            TriggerEvent('inventory:removeItem', "deskinedfish", 1)
            Wait(50)
            exports['ab-taskbar']:taskBar(5000, 'Giving the box!')
            LoadDict('amb@medic@standing@tendtodead@exit')
            TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
            Wait(2100)
            ClearPedTasks(GetPlayerPed(-1))
            FreezeEntityPosition(GetPlayerPed(-1), false)
            DeleteEntity(prop)
            TriggerServerEvent('getmoney:fish')
            DoingTask2 = false
    else
        TriggerEvent('DoLongHudText', 'You have nothing to sell!', 2)
    end
end
  
Citizen.CreateThread(function()
   for _, info in pairs(blips) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, info.scale)
     SetBlipColour(info.blip, info.colour)
     SetBlipAsShortRange(info.blip, true)
     BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.title)
     EndTextCommandSetBlipName(info.blip)
   end
end)


function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

RegisterNetEvent('ab-fishing:skin')
AddEventHandler('ab-fishing:skin', function()
    if exports["ab-inventory"]:hasEnoughOfItem("fishingmackerel", 1) then 
        if exports["ab-inventory"]:hasEnoughOfItem("2578778090", 1) then
            TriggerEvent("inventory:removeItem", "fishingmackerel", 1)
            local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            LoadDict(dict)
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TaskPlayAnim(GetPlayerPed(-1), dict, "coke_cut_v1_coccutter", 3.0, -8, -1, 63, 0, 0, 0, 0 )
            local PedCoords = GetEntityCoords(GetPlayerPed(-1))
            prop = CreateObject(GetHashKey('prop_knife'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
            AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0xDEAD), 0.13, 0.14, 0.09, 40.0, 0.0, 0.0, false, false, false, false, 2, true)
            SetEntityHeading(GetPlayerPed(-1), 263.72814941406)
            local finished = exports['ab-taskbar']:taskBar(10000, 'Remove The Skin From Fish')
            if (finished == 100) then
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'deskinedfish', 1)
                DeleteEntity(prop)
                ClearPedTasks(GetPlayerPed(-1))
                Citizen.Wait(1000)
                TriggerEvent("animation:PlayAnimation","layspike")
            end
        else
            TriggerEvent('DoLongHudText', 'You forgot to bring your knife ?', 2)
        end
    else
        TriggerEvent('DoLongHudText', "You want to cut fishes whitout having any ?", 2)
    end
end)


RegisterNetEvent('ab-npcs:ped:sellFish')
AddEventHandler('ab-npcs:ped:sellFish', function()
local finished = exports["ab-taskbar"]:taskBar(8000,"Negotiating with the Buyer",true,false,playerVeh)
    if finished == 100 then
        SellItemsFishes()
	end
end)