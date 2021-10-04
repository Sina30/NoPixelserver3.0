local rentalVehicle = 0
Citizen.CreateThread(function()
    exports["ab-polyzone"]:AddBoxZone("unity_rentmenu", vector3(110.23654174805, -1089.92578125, 29.30246925354 - 1), 1.2, 3, {
		name="unity_rentmenu",
		heading=189.33126831055,
		debugPoly=false,
		minZ=28.74,
		maxZ=30.34
    })
    exports["ab-polyzone"]:AddBoxZone("rent_deleteveh", vector3(135.54307556152, -1050.4224853516, 29.151811599731 - 1), 5.0, 3, {
		name="rent_deleteveh",
		heading=337.49584960938,
		debugPoly=false,
		minZ=28.1,
		maxZ=30.34
    })
    exports["ab-polyzone"]:AddBoxZone("boat_rentmenu", vector3(-1607.6759033203, 5264.9448242188, 3.9741055965424 - 1), 1.8, 3, {
		name="boat_rentmenu",
		heading=154.99496459961,
		debugPoly=false,
		minZ=0.0,
		maxZ=2.34
    })
    exports["ab-polyzone"]:AddPolyZone("rent_deleteboat",{
        vector2(-1607.6551513672, 5264.8623046875),
		vector2(-1603.3706054688, 5255.9633789062),
		vector2(-1598.2325439453, 5259.30859375),
		vector2(-1597.6220703125, 5269.572265625),
    },{
        debugPoly=false
    })
end)
local NearRentalMenu = false
RegisterNetEvent('ab-polyzone:enter')
AddEventHandler('ab-polyzone:enter', function(name)
    if name == "unity_rentmenu" then
		if not IsPedInAnyVehicle(PlayerPedId(), false) then
			NearRentalMenu = true
            exports["ab-ui"]:showInteraction("[E] Rent Vehicle", "classic") 
			NearRentMenu()
		end
    elseif name == "rent_deleteveh" then
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            NearDeleteRentVeh = true
            exports["ab-ui"]:showInteraction("[E] Return Vehicle", "classic") 
			NearDeleteRentCunt()
        end
    elseif name == "rent_deleteboat" then
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            NearDeleteRentVeh = true
            exports["ab-ui"]:showInteraction("[E] Return Boat", "classic") 
			NearDeleteRentCunt()
        end
    -- elseif name == "boat_rentmenu" then
    --     if not IsPedInAnyVehicle(PlayerPedId(), false) then
	-- 		NearBoatRentalMenu = true
    --         exports["ab-ui"]:showInteraction("[E] Rent Boat", "classic") 
	-- 		NearBoatRentMenu()
    --     end
    end
end) 

RegisterNetEvent('ab-polyzone:exit')
AddEventHandler('ab-polyzone:exit', function(name)
    if name == "unity_rentmenu" then
		NearRentalMenu = false
    elseif name == "rent_deleteveh" then
        NearDeleteRentVeh = false
    elseif name == "rent_deleteboat" then
        NearDeleteRentVeh = false
    -- elseif name == "boat_rentmenu" then
    --     NearBoatRentalMenu = false
    end
    exports["ab-ui"]:hideInteraction("classic")
end)

function NearDeleteRentCunt()
    Citizen.CreateThread(function()
        while NearDeleteRentVeh do
            Citizen.Wait(5)
            if IsControlJustPressed(0, 38) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                if vehicle == rentalVehicle then
                    if exports['ab-inventory']:hasEnoughOfItem('rentalpapers', 1, false) then
                        Citizen.Wait(100)
                        FreezeEntityPosition(vehicle, true)
                        local finished = exports['ab-taskbar']:taskBar(5000, 'Returning Vehicle', false, false)
                        if (finished) == 100 then
                            FreezeEntityPosition(vehicle, false)
                            TriggerEvent('inventory:removeItem', 'rentalpapers', 1)
                            TriggerServerEvent('mission:finished', 50, math.random(1, 1000))
                            DeleteEntity(vehicle)
                        else
                            FreezeEntityPosition(vehicle, false)
                        end
                    else
                        TriggerEvent('DoLongHudText', 'You forgot your rental papers!')
                        return
                    end
                else
                    TriggerEvent('DoLongHudText', 'Not Rental Vehicle, Idiot')
                end
            end
        end
    end)
end

function NearRentMenu()
    Citizen.CreateThread(function()
        while NearRentalMenu do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                Citizen.Wait(200)
                TriggerEvent('ab-context:sendMenu', {
                    {
                        id = 1,
                        header = "Rent a Vehicle!",
                        txt = ""
                    },
                    {
                        id = 2,
                        header = "Rent Bison",
                        txt = "$100.00",
                        params = {
                            event = "ab-rental:spawnveh",
                            args = '1'
                        }
                    },
                    {
                        id = 3,
                        header = "Rent Futo",
                        txt = "$150.00",
                        params = {
                            event = "ab-rental:spawnveh",
                            args = '2'
                        }
                    },
                    {
                        id = 4,
                        header = "Rent Buffalo",
                        txt = "$300.00",
                        params = {
                            event = "ab-rental:spawnveh",
                            args = '3'
                        }
                    },
                    {
                        id = 5,
                        header = "Rent Coach",
                        txt = "$800.00",
                        params = {
                            event = "ab-rental:spawnveh",
                            args = '4'
                        }
                    },
                    {
                        id = 6,
                        header = "Rent Shuttle Bus",
                        txt = "$800.00",
                        params = {
                            event = "ab-rental:spawnveh",
                            args = '5'
                        }
                    },
                    {
                        id = 7,
                        header = "Rent Tour Bus",
                        txt = "$800.00",
                        params = {
                            event = "ab-rental:spawnveh",
                            args = '6'
                        }
                    },
                    {
                        id = 8,
                        header = "Rent Taco Truck",
                        txt = "$800.00",
                        params = {
                            event = "ab-rental:spawnveh",
                            args = '7'
                        }
                    },
                    {
                        id = 9,
                        header = "Rent Limosine",
                        txt = "$1500.00",
                        params = {
                            event = "ab-rental:spawnveh",
                            args = '8'
                        }
                    },
                    -- {
                    --     id = 10,
                    --     header = "Rent Festival Bus",
                    --     txt = "$10000.00",
                    --     params = {
                    --         event = "ab-rental:spawnveh",
                    --         args = '9'
                    --     }
                    -- },
                })
                Citizen.Wait(10000)
            end
        end
    end)
end

RegisterNetEvent('ab-rental:spawnveh')
AddEventHandler('ab-rental:spawnveh', function(argument)
    local args = tonumber(argument)
    local getVehicleInArea = GetClosestVehicle(117.74141693115, -1082.6478271484, 29.192531585693, 3.000, 0, 70)
    if DoesEntityExist(getVehicleInArea) then
      TriggerEvent("DoLongHudText", "The area is crowded", 2)
      return
    end
    if args == 1 then
        RPC.execute('ab-rental:checkcash', 100, args) -- Bison 
    elseif args == 2 then
        RPC.execute('ab-rental:checkcash', 150, args) -- Futo
    elseif args == 3 then
        RPC.execute('ab-rental:checkcash', 300, args) -- Buffalo
    elseif args == 4 then
        RPC.execute('ab-rental:checkcash', 800, args) -- Coach
    elseif args == 5 then
        RPC.execute('ab-rental:checkcash', 800, args) -- Shuttle Bus
    elseif args == 6 then
        RPC.execute('ab-rental:checkcash', 800, args) -- Tour Bus
    elseif args == 7 then
        RPC.execute('ab-rental:checkcash', 800, args) -- Taco Truck
    elseif args == 8 then
        RPC.execute('ab-rental:checkcash', 1500, args) -- Limosine
    elseif args == 9 then
        RPC.execute('ab-rental:checkcash', 10000, args) -- Party Bus
    end
end)

RegisterNetEvent('ab-rental:spawnboat')
AddEventHandler('ab-rental:spawnboat', function(argument)
    ClearAreaOfVehicles(-808.16668701172, -1506.5003662109, -0.47462284564972, 3.0)
    if DoesEntityExist(rentalVehicle) then
      TriggerEvent("DoLongHudText", "The area is crowded", 2)
      DeleteEntity(rentalVehicle)
      return
    end
    local args = tonumber(argument)
    if args == 1 then
        RPC.execute('ab-rental:checkcashboat', 500, args) -- Sea shark 
    elseif args == 2 then
        RPC.execute('ab-rental:checkcashboat', 800, args) -- suntrap
    elseif args == 3 then
        RPC.execute('ab-rental:checkcashboat', 1000, args) -- tropic2
    elseif args == 4 then
        RPC.execute('ab-rental:checkcashboat', 5000, args) -- Coach
    end
end)

RegisterNetEvent('ab-rental:nearboatrentmenu')
AddEventHandler('ab-rental:nearboatrentmenu', function(argument)
    TriggerEvent('ab-context:sendMenu', {
        {
            id = 1,
            header = "Rent a Boat!",
            txt = ""
        },
        {
            id = 2,
            header = "Rent Sea Shark",
            txt = "$500.00",
            params = {
                event = "ab-rental:spawnboat",
                args = '1'
            }
        },
        {
            id = 3,
            header = "Rent Suntrap",
            txt = "$800.00",
            params = {
                event = "ab-rental:spawnboat",
                args = '2'
            }
        },
        {
            id = 4,
            header = "Rent Tropic",
            txt = "$1000.00",
            params = {
                event = "ab-rental:spawnboat",
                args = '3'
            }
        },
    })
    Citizen.Wait(100)
end)

-- function NearBoatRentMenu()
--     Citizen.CreateThread(function()
--         while NearBoatRentalMenu do
--             Citizen.Wait(5)
--             if IsControlJustReleased(0, 38) then
--                 Citizen.Wait(200)
--                 TriggerEvent('ab-context:sendMenu', {
--                     {
--                         id = 1,
--                         header = "Rent a Boat!",
--                         txt = ""
--                     },
--                     {
--                         id = 2,
--                         header = "Rent Sea Shark",
--                         txt = "$500.00",
--                         params = {
--                             event = "ab-rental:spawnboat",
--                             args = '1'
--                         }
--                     },
--                     {
--                         id = 3,
--                         header = "Rent Suntrap",
--                         txt = "$800.00",
--                         params = {
--                             event = "ab-rental:spawnboat",
--                             args = '2'
--                         }
--                     },
--                     {
--                         id = 4,
--                         header = "Rent Tropic",
--                         txt = "$1000.00",
--                         params = {
--                             event = "ab-rental:spawnboat",
--                             args = '3'
--                         }
--                     },
--                 })
--                 Citizen.Wait(10000)
--             end
--         end
--     end)
-- end

RegisterNetEvent('ab-rental:createvehicleboat')
AddEventHandler('ab-rental:createvehicleboat', function(args)
    local LocalPlayer = exports["ab-base"]:getModule("LocalPlayer")
    local Player = LocalPlayer:getCurrentCharacter()
    if args == 1 then
        local hash = GetHashKey('seashark')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

        local vehicle = CreateVehicle(hash, -1600.2835693359, 5261.6376953125, 0.30042254924774, 293.57977294922, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Seashark",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    elseif args == 2 then
        local hash = GetHashKey('suntrap')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

        local vehicle = CreateVehicle(hash, -1600.2835693359, 5261.6376953125, 0.30042254924774, 293.57977294922, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Suntrap",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    elseif args == 3 then
        local hash = GetHashKey('tropic2')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

        local vehicle = CreateVehicle(hash, -1600.2835693359, 5261.6376953125, 0.30042254924774, 293.57977294922, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Tropic",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    end
    
end)

RegisterNetEvent('ab-rental:createvehicle')
AddEventHandler('ab-rental:createvehicle', function(args)
    local LocalPlayer = exports["ab-base"]:getModule("LocalPlayer")
    local Player = LocalPlayer:getCurrentCharacter()
    if args == 1 then
        local hash = GetHashKey('bison')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

        local vehicle = CreateVehicle(hash, 117.74141693115, -1082.6478271484, 29.192531585693, 358.94802856445, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Bison",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    elseif args == 2 then
        local hash = GetHashKey('futo')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

        local vehicle = CreateVehicle(hash, 117.74141693115, -1082.6478271484, 29.192531585693, 358.94802856445, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Futo",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    elseif args == 3 then
        local hash = GetHashKey('buffalo')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end

        local vehicle = CreateVehicle(hash, 117.74141693115, -1082.6478271484, 29.192531585693, 358.94802856445, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Buffalo",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    elseif args == 4 then
        local hash = GetHashKey('coach')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end
        local vehicle = CreateVehicle(hash, 127.41889190674, -1081.1850585938, 29.19348526001, 87.086418151855, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Coach",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    elseif args == 5 then
        local hash = GetHashKey('rentalbus')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end
        local vehicle = CreateVehicle(hash, 127.41889190674, -1081.1850585938, 29.19348526001, 87.086418151855, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Rentalbus",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    elseif args == 6 then
        local hash = GetHashKey('airbus')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end
        local vehicle = CreateVehicle(hash, 127.41889190674, -1081.1850585938, 29.19348526001, 87.086418151855, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Airbus",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    elseif args == 7 then
        local hash = GetHashKey('taco')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end
        local vehicle = CreateVehicle(hash, 127.41889190674, -1081.1850585938, 29.19348526001, 87.086418151855, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Taco Truck",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(vehicle)
        SetVehicleHasBeenOwnedByPlayer(veh, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    elseif args == 8 then
        local hash = GetHashKey('patriot2')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end
        local vehicle = CreateVehicle(hash, 127.41889190674, -1081.1850585938, 29.19348526001, 87.086418151855, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Patriot Limo",plate)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    elseif args == 9 then
        local hash = GetHashKey('pbus2')

        if not IsModelAVehicle(hash) then return end
        if not IsModelInCdimage(hash) or not IsModelValid(hash) then return end
                
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(0)
        end
        local vehicle = CreateVehicle(hash, 127.41889190674, -1081.1850585938, 29.19348526001, 87.086418151855, true, false)
        rentalVehicle = vehicle
        local plate = "RENTAL"..math.random(0,99) 
        SetVehicleNumberPlateText(vehicle, plate)
        RPC.execute("ab-rental:genreceipt","Bus",plate)
        StartAudioScene("DLC_BTL_PBUS2_Music_Boost_Scene")
        local position = GetEntityCoords(vehicle)
        local obj = CreateObject(GetHashKey("ba_prop_battle_pbus_screen"), position.x + -50.0, position.y, position.z, true, false, false)
        AttachEntityToEntity(obj, vehicle, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
        AddEntityToAudioMixGroup(vehicle, "DLC_BTL_PBUS2_Music_Boost_Mixgroup", 0)
        TriggerEvent("keys:addNew",vehicle,plate)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleDirtLevel(vehicle, 0)
        SetVehicleWindowTint(vehicle, 0)
        LastVehicle = vehicle
        SetModelAsNoLongerNeeded(hash)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
    end
    
end)

local drawable_names = {"face", "masks", "hair", "torsos", "legs", "bags", "shoes", "neck", "undershirts", "vest", "decals", "jackets"}
local prop_names = {"hats", "glasses", "earrings", "mouth", "lhand", "rhand", "watches", "braclets"}
local head_overlays = {"Blemishes","FacialHair","Eyebrows","Ageing","Makeup","Blush","Complexion","SunDamage","Lipstick","MolesFreckles","ChestHair","BodyBlemishes","AddBodyBlemishes"}
local face_features = {"Nose_Width","Nose_Peak_Hight","Nose_Peak_Lenght","Nose_Bone_High","Nose_Peak_Lowering","Nose_Bone_Twist","EyeBrown_High","EyeBrown_Forward","Cheeks_Bone_High","Cheeks_Bone_Width","Cheeks_Width","Eyes_Openning","Lips_Thickness","Jaw_Bone_Width","Jaw_Bone_Back_Lenght","Chimp_Bone_Lowering","Chimp_Bone_Lenght","Chimp_Bone_Width","Chimp_Hole","Neck_Thikness"}

function SetClothing(ped,drawables, props, drawTextures, propTextures)
    for i = 1, #drawable_names do
        if drawables[0] == nil then
            if drawable_names[i] == "undershirts" and drawables[tostring(i-1)][2] == -1 then
                SetPedComponentVariation(ped, i-1, 15, 0, 2)
            else
                SetPedComponentVariation(ped, i-1, drawables[tostring(i-1)][2], drawTextures[i][2], 2)
            end
        else
            if drawable_names[i] == "undershirts" and drawables[i-1][2] == -1 then
                SetPedComponentVariation(ped, i-1, 15, 0, 2)
            else
                SetPedComponentVariation(ped, i-1, drawables[i-1][2], drawTextures[i][2], 2)
            end
        end
    end

    for i = 1, #prop_names do
        local propZ = (drawables[0] == nil and props[tostring(i-1)][2] or props[i-1][2])
        ClearPedProp(ped, i-1)
        SetPedPropIndex(
            ped,
            i-1,
            propZ,
            propTextures[i][2], true)
    end
end

function SetPedHeadBlend(ped,data)
    SetPedHeadBlendData(ped,
        tonumber(data['shapeFirst']),
        tonumber(data['shapeSecond']),
        tonumber(data['shapeThird']),
        tonumber(data['skinFirst']),
        tonumber(data['skinSecond']),
        tonumber(data['skinThird']),
        tonumber(data['shapeMix']),
        tonumber(data['skinMix']),
        tonumber(data['thirdMix']),
        false)
end

function SetHeadStructure(ped,data)
    for i = 1, #face_features do
        SetPedFaceFeature(ped, i-1, data[i])
    end
end

function SetHeadOverlayData(ped,data)
    if json.encode(data) ~= "[]" then
        for i = 1, #head_overlays do
            SetPedHeadOverlay(ped,  i-1, tonumber(data[i].overlayValue),  tonumber(data[i].overlayOpacity))
            -- SetPedHeadOverlayColor(ped, i-1, data[i].colourType, data[i].firstColour, data[i].secondColour)
        end

        SetPedHeadOverlayColor(ped, 0, 0, tonumber(data[1].firstColour), tonumber(data[1].secondColour))
        SetPedHeadOverlayColor(ped, 1, 1, tonumber(data[2].firstColour), tonumber(data[2].secondColour))
        SetPedHeadOverlayColor(ped, 2, 1, tonumber(data[3].firstColour), tonumber(data[3].secondColour))
        SetPedHeadOverlayColor(ped, 3, 0, tonumber(data[4].firstColour), tonumber(data[4].secondColour))
        SetPedHeadOverlayColor(ped, 4, 2, tonumber(data[5].firstColour), tonumber(data[5].secondColour))
        SetPedHeadOverlayColor(ped, 5, 2, tonumber(data[6].firstColour), tonumber(data[6].secondColour))
        SetPedHeadOverlayColor(ped, 6, 0, tonumber(data[7].firstColour), tonumber(data[7].secondColour))
        SetPedHeadOverlayColor(ped, 7, 0, tonumber(data[8].firstColour), tonumber(data[8].secondColour))
        SetPedHeadOverlayColor(ped, 8, 2, tonumber(data[9].firstColour), tonumber(data[9].secondColour))
        SetPedHeadOverlayColor(ped, 9, 0, tonumber(data[10].firstColour), tonumber(data[10].secondColour))
        SetPedHeadOverlayColor(ped, 10, 1, tonumber(data[11].firstColour), tonumber(data[11].secondColour))
        SetPedHeadOverlayColor(ped, 11, 0, tonumber(data[12].firstColour), tonumber(data[12].secondColour))
    end
end