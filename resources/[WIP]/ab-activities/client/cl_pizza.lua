local pizzeria = {x = 215.37, y = -17.24, z = 73.99}
local spawnfaggio = { x = 218.28, y = -27.15, z = 68.60 }
local getpaid = { x = 213.1016, y = -25.93915, z = 68.99939 }
local clockRoom = vector3(215.37, -17.24, 73.99)
local cash = 0
local posibilidad = 0

local casas = {
    [1] = {name = "Vinewood Hills",x = -1220.50, y = 666.95 , z = 143.10},
    [2] = {name = "Vinewood Hills",x = -1338.97, y = 606.31 , z = 133.37},
    [3] = {name = "Rockford Hills",x = -1051.85, y = 431.66 , z = 76.06 },
    [4] = {name = "Rockford Hills",x = -904.04 , y = 191.49 , z = 68.44 },
    [5] = {name = "Rockford Hills",x = -21.58  , y = -23.70 , z = 72.24 },
    [6] = {name = "Hawick Ave"        ,x = -904.04 , y = 191.49 , z = 68.44 },
    [7] = {name = "Alta St"          ,x = 225.39  , y = -283.63, z = 28.25 },
    [8] = {name = "Pillbox Hills" ,x = 5.62    , y = -707.72, z = 44.97 },
    [9] = {name = "Mission Row"   ,x = 284.50  , y = -938.50 , z = 28.35},
    [10] ={name = "Rancho Blvd"        ,x = 411.59  , y = -1487.54, z = 29.14},
    [11] ={name = "Davis Ave"         ,x = 85.19   , y = -1958.18, z = 20.12},
    [12] ={name ="Chamberlain Hills",x = -213.00, y =-1617.35 , z =37.35},
    [13] ={name ="La puerta Fwy"      ,x = -1015.65, y =-1515.05 ,z = 5.51}
}

local isInJobPizz = false
local sigcasa = 0
local plateab = "POPJOBS"
local isToHouse = false
local isToPizzaria = false
local multiplicador_De_dinero = 0.05
local paga = 0

local px = 0
local py = 0
local pz = 0

RegisterNetEvent("ab-jobmanager:playerBecameJob")
AddEventHandler("ab-jobmanager:playerBecameJob", function(job, name, notify)
    local LocalPlayer = exports["ab-base"]:getModule("LocalPlayer")
    LocalPlayer:setVar("job", job)
    
    if job == 'pizzeria' then
        havingpizzaJob = true
        if pizzaHQBlip == nil or pizzaHQBlip == 0 then
            pizzaHQBlip = AddBlipForCoord(clockRoom)
            SetBlipSprite(pizzaHQBlip, 267)
            SetBlipDisplay(pizzaHQBlip, 4)
            SetBlipScale(pizzaHQBlip, 0.7)
            SetBlipColour(pizzaHQBlip, 66)
            SetBlipAsShortRange(pizzaHQBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Pizzeria")
            EndTextCommandSetBlipName(pizzaHQBlip)
        end    
    else
        havingpizzaJob = false
        if pizzaHQBlip ~= nil or pizzaHQBlip ~= 0 then
            RemoveBlip(pizzaHQBlip)
            pizzaHQBlip = 0
        end
    end

    TriggerServerEvent("ab-items:updateID",job,exports["isPed"]:retreiveBusinesses())
end)
-- local blips = {
--     {title="Pizzeria", colour=66, id=267, x = 215.37, y = -17.24, z = 73.99},
-- }

-------------------------------------------
--------------------BLIPS------------------
-------------------------------------------

function Iracasa(casas,sigcasa)
    blip_casa = AddBlipForCoord(casas[sigcasa].x,casas[sigcasa].y, casas[sigcasa].z)
    SetBlipSprite(blip_casa, 1)
    SetNewWaypoint(casas[sigcasa].x,casas[sigcasa].y)
end


RegisterNetEvent("ab-pizza:start")
AddEventHandler("ab-pizza:start", function()
    job = exports["isPed"]:isPed("myjob")
    if job == 'pizzeria' then
        isInJobPizz = true
        isToHouse = true
        sigcasa = math.random(1, 13)
        px = casas[sigcasa].x
        py = casas[sigcasa].y
        pz = casas[sigcasa].z
        distancia = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
        paga = math.ceil(distancia * multiplicador_De_dinero)
        spawn_faggio()
        Iracasa(casas,sigcasa)  
        TriggerEvent('DoLongHudText', "Take the car parked below ", 1) 
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- if isInJobPizz == false then
        --     if GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
        --         job = exports["isPed"]:isPed("myjob")
        --         if job == 'pizzeria' then
        --         DrawText3Ds(pizzeria.x,pizzeria.y,pizzeria.z + 1.0, "[E] - Start Delivery")
        --         if IsControlJustPressed(1,38) then
        --             isInJobPizz = true
        --             isToHouse = true
        --             sigcasa = math.random(1, 13)
        --             px = casas[sigcasa].x
        --             py = casas[sigcasa].y
        --             pz = casas[sigcasa].z
        --             distancia = round(GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, px,py,pz))
        --             paga = math.ceil(distancia * multiplicador_De_dinero)
        --             spawn_faggio()
        --             Iracasa(casas,sigcasa)
        --         end 
        --         end
        --     end
        -- end
        if isToHouse == true then
            destinol = casas[sigcasa].name
            -- drawTxt("Delivery available : "..destinol,0,1,0.5,0.8,0.35,255,255,255,255)
            TriggerEvent('DoLongHudText', "Delivery available !!", 1)
            if GetDistanceBetweenCoords(px,py,pz, GetEntityCoords(GetPlayerPed(-1),true)) < 3 then
                DrawText3Ds(casas[sigcasa].x,casas[sigcasa].y,casas[sigcasa].z + 1.0, "[E] - Deliver the Pizza")
                if IsControlJustPressed(1,38) then
                    local ply = GetPlayerPed(-1)
                    if IsPedSittingInAnyVehicle(ply) then
                        TriggerEvent('DoLongHudText', "Get out of the car !", 1)
                    else 
                        posibilidad = math.random(1, 100)
                        if (posibilidad > 70) and (posibilidad < 90) then
                            RPC.execute("server:givepayJob",75)
                        end
                        isToHouse = false
                        isToPizzaria = true
                        RemoveBlip(blip_casa)
                        SetNewWaypoint(pizzeria.x,pizzeria.y) 
                    end
                end
            end
        end
        if isToPizzaria == true then
            TriggerEvent('DoLongHudText', "A payslip is ready for you back at the Pizzeria", 1)
            ---drawTxt("A payslip is ready for you back at the Pizzeria",0,1,0.5,0.8,0.35,255,255,255,255)
            if GetDistanceBetweenCoords(getpaid.x,getpaid.y,getpaid.z, GetEntityCoords(GetPlayerPed(-1),true)) < 3 then
                job = exports["isPed"]:isPed("myjob")
                if job == 'pizzeria' then
                DrawText3Ds(getpaid.x,getpaid.y,getpaid.z + 1.0, "[E] - Collect Payslip")
                if IsControlJustPressed(1,38) then
                    if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("panto"))  then
                        if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("panto")) then
                            TriggerEvent('DoLongHudText', 'You were payed $' .. paga .. ' for this delivery', 1)
                            RPC.execute("server:givepayJob",75)
                            isToHouse = false
                            isToPizzaria = false
                            isInJobPizz = false
                            paga = 0
                            px = 0
                            py = 0
                            pz = 0
                            local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), true)
                            SetEntityAsMissionEntity( vehicleu, true, true )
                            deleteCar( vehicleu )
                        else
                            TriggerEvent('DoLongHudText', 'You were not payed. Please return the Faggio', 2)
                        end
                    else
                        TriggerEvent('DoLongHudText', 'Use the faggio provided', 2)
                     end
                  end 
                end
            end
        end
        if IsEntityDead(GetPlayerPed(-1)) then
            isInJobPizz = false
            sigcasa = 0
            isToHouse = false
            isToPizzaria = false
            paga = 0
            px = 0
            py = 0
            pz = 0
            RemoveBlip(blip_casa)
        end
        if GetDistanceBetweenCoords(spawnfaggio.x,spawnfaggio.y,spawnfaggio.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
            job = exports["isPed"]:isPed("myjob")
            if job == 'pizzeria' then
            DrawText3Ds(spawnfaggio.x,spawnfaggio.y,spawnfaggio.z + 1.0, "[E] - Cancel Delivery")
            if IsControlJustPressed(1,38) then
                isInJobPizz = false
                sigcasa = 0
                isToHouse = false
                isToPizzaria = false
                paga = 0
                px = 0
                py = 0
                pz = 0
                RemoveBlip(blip_casa)
            end 
            end
        end
    end
end)

function spawn_faggio()
    Citizen.Wait(0)

    local myPed = GetPlayerPed(-1)
    local player = PlayerId()
    local vehicle = GetHashKey('panto')

    RequestModel(vehicle)

    while not HasModelLoaded(vehicle) do
        Wait(1)
    end
    local spawned_car = CreateVehicle(vehicle, spawnfaggio.x,spawnfaggio.y,spawnfaggio.z, 431.436, - 996.786, 25.1887, true, false)

    local plate = "CTZN"..math.random(100, 300)
    TriggerEvent('DoLongHudText', 'Keys Received, Vehicle is waiting below', 1)
    SetVehicleNumberPlateText(spawned_car, plate)
    local getPlate = GetVehicleNumberPlateText(spawned_car)
    -- TriggerServerEvent('garage:addKeys', getPlate)
    TriggerEvent("keys:addNew",spawned_car,getPlate)
    SetVehicleOnGroundProperly(spawned_car)
    SetVehicleLivery(spawned_car, 2)
    SetModelAsNoLongerNeeded(vehicle)
    Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
end

function round(num, numDecimalPlaces)
    local mult = 5^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function IsInVehicle()
    local ply = GetPlayerPed(-1)
    if IsPedSittingInAnyVehicle(ply) then
        return true
    else
        return false
    end
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0, 0, 0, 0, 155)
    SetTextEdge(1, 0, 0, 0, 250)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end