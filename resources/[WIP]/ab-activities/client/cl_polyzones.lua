NearGarbage,NearClothing,NearImpound,Nearjobcenter,Nearcustcloth,Nearcustomclothadder,Nearaparts1, Nearaparts2, Nearaparts3,NearFishCutting,NearCocaineent,NearCocaineext,NearCocaineprocess,Nearpaycheck = false, false, false, false, false, false, false, false, false, false, false, false, false, false
CutFish,SellSpotF = false, false
Citizen.CreateThread(function()
    exports["ab-polyzone"]:AddBoxZone("aparts1", vector3(-270.96, -957.79, 31.22), 2.9, 5, {
        name="aparts1",
        heading=110,
        --debugPoly=true,
        minZ=29.14,
        maxZ=31.74
    })
    
    exports["ab-polyzone"]:AddBoxZone("aparts2", vector3(-1236.50, -860.47, 12.88), 2.9, 5, {
        name="aparts2",
        heading=30,
        --debugPoly=true,
        minZ=10.14,
        maxZ=13.74
    })

    exports["ab-polyzone"]:AddBoxZone("aparts3", vector3(277.87, -640.46, 42.01), 2.9, 5, {
        name="aparts3",
        heading=298,
        --debugPoly=true,
        minZ=41.95,
        maxZ=42.40
    })
    
    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(428.64, -803.35, 29.49), 2.9, 5, {
        name="cloth1",
        heading=172,
        --debugPoly=true,
        minZ=29.35,
        maxZ=29.55
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(-167.76, -299.90, 39.73), 2.9, 5, {
        name="cloth1",
        heading=246,
        --debugPoly=true,
        minZ=39.55,
        maxZ=39.85
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3( 72.23, -1395.88, 29.37), 2.9, 5, {
        name="cloth1",
        heading=346,
        --debugPoly=true,
        minZ=29.35,
        maxZ=29.40
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3( -826.43, -1072.27, 11.32), 2.9, 5, {
        name="cloth1",
        heading=296,
        --debugPoly=true,
        minZ=11.30,
        maxZ=11.35
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(-1447.39, -242.09,  49.82), 2.9, 5, {
        name="cloth1",
        heading=43.85,
        --debugPoly=true,
        minZ=49.80,
        maxZ=49.85
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(9.01, 6512.118,  31.877), 2.9, 5, {
        name="cloth1",
        heading=128,
        --debugPoly=true,
        minZ=31.85,
        maxZ=31.90
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(617.50, 2773.28,  42.08), 2.9, 5, {
        name="cloth1",
        heading=176,
        --debugPoly=true,
        minZ=42.08,
        maxZ=42.11
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(1193.37, 2713.51,  38.22), 2.9, 5, {
        name="cloth1",
        heading=262,
        --debugPoly=true,
        minZ=38.20,
        maxZ=38.25
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(-3178.34, 1036.08,  20.86), 2.9, 5, {
        name="cloth1",
        heading=153,
        --debugPoly=true,
        minZ=20.85,
        maxZ=20.90
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(-1105.81, 2710.78,  19.107), 2.9, 5, {
        name="cloth1",
        heading=310,
        --debugPoly=true,
        minZ=19.105,
        maxZ=19.110
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(-704.37, -151.69,  37.41), 2.9, 5, {
        name="cloth1",
        heading=116,
        --debugPoly=true,
        minZ=37.40,
        maxZ=37.45
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(-1182.13, -765.06,  17.32), 2.9, 5, {
        name="cloth1",
        heading=305,
        --debugPoly=true,
        minZ=17.30,
        maxZ=17.35
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(1696.58, 4826.05,  42.06), 2.9, 5, {
        name="cloth1",
        heading=188,
        --debugPoly=true,
        minZ=42.00,
        maxZ=42.1
    })

    exports["ab-polyzone"]:AddBoxZone("cloth1", vector3(118.57, -231.29,  54.55), 2.9, 5, {
        name="cloth1",
        heading=146,
        --debugPoly=true,
        minZ=54.54,
        maxZ=54.59
    })

    exports["ab-polyzone"]:AddBoxZone("customclothes1", vector3(-707.541, -161.49,  37.41), 2.9, 5, {
        name="customclothes1",
        heading=356,
        --debugPoly=true,
        minZ=37.40,
        maxZ=37.45
    })

    exports["ab-polyzone"]:AddBoxZone("customclothesadder", vector3(-708.83, -151.16,  37.41), 2.9, 5, {
        name="customclothesadder",
        heading=117,
        --debugPoly=true,
        minZ=37.41,
        maxZ=37.42
    })

    exports["ab-polyzone"]:AddBoxZone("impoundlot", vector3(-191.89, -1162.24, 23.67), 2.9, 5, {
        name="impoundlot",
        heading=89,
        --debugPoly=true,
        minZ=23.67,
        maxZ=23.74
    })

    exports["ab-polyzone"]:AddBoxZone("jobcenter", vector3(-234.62, -920.90, 32.31), 2.9, 5, {
        name="jobcenter",
        heading=152,
        --debugPoly=true,
        minZ=32.30,
        maxZ=32.36
    })
    ---GARAGE START
    -- garage A --
    exports["ab-polyzone"]:AddBoxZone("A", vector3(466.49, -71.76, 77.49), 8.4, 13.8, {
        name="A",
        heading=152,
    })
    exports["ab-polyzone"]:AddBoxZone("A", vector3(472.67, -61.76, 77.46), 8.4, 13.8, {
        name="A",
        heading=330,
    })
    exports["ab-polyzone"]:AddBoxZone("A", vector3(487.94, -32.5, 77.72), 10.0, 24.4, {
        name="A",
        heading=60,
    })

    -- Garage B --
    exports["ab-polyzone"]:AddBoxZone("B", vector3(-356.31, -753.56, 33.97), 53.25, 10.4, {
        name="B",
        heading=1,
    })
    exports["ab-polyzone"]:AddBoxZone("B", vector3(-341.99, -758.46, 33.97), 23.35, 8.6, {
        name="B",
        heading=0,
    })
    exports["ab-polyzone"]:AddBoxZone("B", vector3(-326.87, -751.89, 33.97), 31.2, 11.6, {
        name="B",
        heading=262,
    })

    -- Garage C --
    exports["ab-polyzone"]:AddBoxZone("C", vector3(-321.95, -980.58, 31.08), 59.0, 9.0, {
        name="C",
        heading=70,
    })
    exports["ab-polyzone"]:AddBoxZone("C", vector3(-321.51, -941.79, 31.08), 37.6, 7.6, {
        name="C",
        heading=340,
    })
    exports["ab-polyzone"]:AddBoxZone("C", vector3(-307.8, -949.2, 31.08), 40.8, 7.8, {
        name="C",
        heading=340,
    })

    -- Garage D --
    exports["ab-polyzone"]:AddBoxZone("D", vector3(385.34, -1331.04, 33.22), 44.0, 7.6, {
        name="D",
        heading=50,
    })
    exports["ab-polyzone"]:AddBoxZone("D", vector3(427.39, -1366.02, 33.17), 44.0, 7.6, {
        name="D",
        heading=49,
    })

    -- Garage E --
    exports["ab-polyzone"]:AddBoxZone("E", vector3(614.2, 112.74, 92.2), 46.85, 34.6, {
        name="E",
        heading=339,
    })

    -- Garage F --
    exports["ab-polyzone"]:AddBoxZone("F", vector3(636.49, 176.47, 96.6), 60.2, 36.2, {
        name="F",
        heading=340,
    })

	-- Garage G --
    exports["ab-polyzone"]:AddBoxZone("G", vector3(67.26, 6376.98, 31.24), 60.0, 64.8, {
        name="G",
        heading=41,
    })

	-- Garage H --
    exports["ab-polyzone"]:AddBoxZone("H", vector3(-759.44, -2026.07, 8.93), 72.6, 50, {
        name="H",
        heading=335,
    })
    
    -- Garage I --
    exports["ab-polyzone"]:AddBoxZone("I", vector3(-675.98, -2056.88, 8.87), 70.4, 33.8, {
        name="I",
        heading=85,
    })

	-- Garage J --
    exports["ab-polyzone"]:AddBoxZone("J", vector3(-629.4, -2196.03, 5.99), 82.400000000001, 23.0, {
        name="J",
        heading=50,
    })

	-- Garage K --
    exports["ab-polyzone"]:AddBoxZone("K", vector3(-125.32, -2133.55, 16.7), 61.2, 32.0, {
        name="K",
        heading=290,
    })

	-- Garage L --
    exports["ab-polyzone"]:AddBoxZone("L", vector3(-51.6, -2101.08, 16.7), 27.8, 16.6, {
        name="L",
        heading=290,
    })

	-- Garage M --
    exports["ab-polyzone"]:AddBoxZone("M", vector3(-83.62, -2006.09, 18.02), 51.0, 19.8, {
        name="M",
        heading=260,
    })

	-- Garage O --

    exports["ab-polyzone"]:AddBoxZone("O", vector3(375.1, 281.46, 103.43), 41.0, 35.0, {
        name="O",
        heading=253,
    })

    -- Garage P --
    exports["ab-polyzone"]:AddBoxZone("P", vector3(-339.36, 288.01, 85.83), 35.6, 30.2, {
        name="P",
        heading=0,
    })

	-- Garage Q --

    exports["ab-polyzone"]:AddPolyZone("Q",{
        vector2(295.66567993164, -356.21514892578),
		vector2(305.9580078125, -327.55197143555),
		vector2(266.70874023438, -314.34658813477),
		vector2(258.60485839844, -339.76541137695)
    },{
        debugPoly=false
    })

    -- Garage R --
    exports["ab-polyzone"]:AddBoxZone("R", vector3(59.43, 17.81, 69.78), 14.8, 7.0, {
        name="R",
        heading=70,
    })

	-- Garage S --
    exports["ab-polyzone"]:AddBoxZone("S", vector3(305.14, 71.33, 94.37), 30.4, 6.0, {
        name="S",
        heading=70,
    })

	-- Garage T --
    exports["ab-polyzone"]:AddPolyZone("T",{
        vector2(239.68876647949, -820.34033203125),
        vector2(258.72216796875, -768.09613037109),
        vector2(218.64688110352, -754.83935546875),
        vector2(200.06071472168, -805.73034667969)
    },{
        debugPoly=false
    })

	-- Garage Richman --
    exports["ab-polyzone"]:AddBoxZone("Richman", vector3(-1308.41, 254.07, 64.49), 73.2, 62.8, {
        name="Richman",
        heading=254,
    })
  
	-- Garage Casino --
    exports["ab-polyzone"]:AddPolyZone("casino",{
        vector2(870.51776123047, 20.484987258911),
		vector2(876.04241943359, 17.465185165405),
		vector2(956.79577636719, -30.344190597534),
		vector2(947.38110351562, -63.22282409668),
		vector2(954.59088134766, -88.86612701416),
		vector2(926.10278320312, -116.17047119141),
		vector2(884.08178710938, -92.043014526367),
		vector2(827.90643310547, -56.764553070068),
		vector2(816.08416748047, -46.162780761719)
    },{
        debugPoly=false
    })	
	-- Garage Impound --
    exports["ab-polyzone"]:AddBoxZone("Impound Lot", vector3(-143.32, -1171.19, 23.77), 24.0, 30, {
        name="Impound Lot",
        heading=0,
        --debugPoly=true,
        minZ=22.77,
        maxZ=25.37
    })
    exports["ab-polyzone"]:AddBoxZone("Repo", vector3(-192.83, -1173.6, 23.04), 26.0, 20, {
        name="Repo",
        heading=0,
        minZ=21.84,
        maxZ=25.24
    })
    exports["ab-polyzone"]:AddBoxZone("Perro", vector3(-1479.69, -504.41, 32.83), 22.0, 30, {
        name="Perro",
        heading=35,
        --debugPoly=true,
        minZ=31.63,
        maxZ=33.83
    })
    exports["ab-polyzone"]:AddBoxZone("Police Department", vector3(445.87, -993.32, 25.7), 9.6, 10, {
        name="Police Department",
        heading=270,
        --debugPoly=true,
        minZ=24.7,
        maxZ=28.7
    })
    exports["ab-polyzone"]:AddBoxZone("Pillbox", vector3(326.29, -588.71, 28.8), 14.6, 5, {
        name="Pillbox",
        heading=250,
        --debugPoly=true,
        minZ=27.8,
        maxZ=31.8
    })
    exports["ab-polyzone"]:AddBoxZone("Harmony", vector3(571.98, 2729.23, 42.06), 25, 25, {
        name="Harmony",
        heading=185,
        --debugPoly=true,
        minZ=41.06,
        maxZ=45.06
    })
    exports["ab-polyzone"]:AddBoxZone("garbage", vector3(-321.28, -1545.73,   31.01), 2.9, 5, {
        name="garbage",
        heading=174,
        --debugPoly=true,
        minZ=31.01,
        maxZ=33.01
    })
    ---GARAGE END---
    --FISHING--
    exports["ab-polyzone"]:AddBoxZone("fish_cutting", vector3(999.75, -2169.96, 29.47), 9.4, 4, {
        name="fish_cutting",
        heading=0,
        debugPoly=false,
        minZ=25.47,
        maxZ=35.47
    })
    --FISHING END---
    ---COCAINE---
    exports["ab-polyzone"]:AddCircleZone("cocaineent", vector3(-1928.3021240234, 1779.4945068359, 173.09538269043), 0.6,{
        name="cocaineent",
        heading=0,
        debugPoly=false
    })
    exports["ab-polyzone"]:AddCircleZone("cocaineext", vector3(1088.6500244141, -3187.5532226562, -38.993480682373), 0.6,{
        name="cocaineext",
        heading=0,
        debugPoly=false
    })
    exports["ab-polyzone"]:AddCircleZone("cocaineprocess", vector3(1090.4111328125, -3195.9982910156, -38.19718170166), 1.4,{
        name="cocaineprocess",
        heading=0,
        debugPoly=false
    })
    exports["ab-polyzone"]:AddCircleZone("paycheck", vector3(-1082.8215332031, -248.06062316895, 37.763305664062), 1.5,{
        name="paycheck",
        heading=0,
        debugPoly=false
    })
    --COCAINE END--
end)

RegisterNetEvent('ab-polyzone:enter')
AddEventHandler('ab-polyzone:enter', function(name)
    if name == "aparts1" then
        Nearaparts1 = true
        Apart1()
        exports["ab-ui"]:showInteraction("[E] To Enter | [H] For More", "classic")
    elseif name == "aparts2" then
        Nearaparts2 = true
        Apart2()
        exports["ab-ui"]:showInteraction("[E] To Enter | [H] For More", "classic")
    elseif name == "aparts3" then
        Nearaparts3 = true
        Apart3()
        exports["ab-ui"]:showInteraction("[E] To Enter | [H] For More", "classic") 
    elseif name == "cloth1" then
        NearClothing = true
        Cloth1()
        exports["ab-ui"]:showInteraction("[E] For Outfits", "classic") 
    elseif name == "customclothes1" then
        Nearcustcloth = true
        CustomCloth1()
        exports["ab-ui"]:showInteraction("[E] For Outfits By Pons", "classic") 
    elseif name == "customclothesadder" then
        local currentJob = exports["isPed"]:isPed("myjob")
        if currentJob == "ponsonbys" then
            Nearcustomclothadder = true
            CustomClothAdder()
            exports["ab-ui"]:showInteraction("[E] To Add Outfits To Shop", "classic")
        end 
    elseif name == "impoundlot" then
        NearImpound = true
        Impound()
        exports["ab-ui"]:showInteraction("[E] Impound Records", "classic") 
    elseif name == "jobcenter" then
        Nearjobcenter = true
        JobCenter()
        exports["ab-ui"]:showInteraction("[E] Job Center", "classic") 
    elseif name == "garbage" then
        NearGarbage = true
    elseif name == "fish_cutting" then
        SkinFish()
        NearFishCutting = true
        exports["ab-ui"]:showInteraction("[E] Skin Fish", "classic") 
    elseif name == "cocaineent" then
        EnterCoc()
        NearCocaineent = true
        exports["ab-ui"]:showInteraction("[E] Enter Unlocked Door", "classic") 
    elseif name == "cocaineext" then
        ExitCoc()
        NearCocaineext = true
        exports["ab-ui"]:showInteraction("[E] Exit Unlocked Door", "classic") 
    elseif name == "cocaineprocess" then
        StartProcessCocke()
        NearCocaineprocess = true
        exports["ab-ui"]:showInteraction("[E] Do Some Stuff", "classic") 
    elseif name == "paycheck" then
        Nearpaycheck = true
        exports["ab-ui"]:showInteraction("[E] Collect Paycheck", "classic") 
    end
end)

RegisterNetEvent('ab-polyzone:exit')
AddEventHandler('ab-polyzone:exit', function(name)
    if name == "aparts1" then
        Nearaparts1 = false
    elseif name == "aparts2" then
        Nearaparts2 = false
    elseif name == "aparts3" then
        Nearaparts3 = false
    elseif name == "cloth1" then
        NearClothing = false
    elseif name == "impoundlot" then
        NearImpound = false
    elseif name == "jobcenter" then
        Nearjobcenter = false
    elseif name == "customclothes1" then
        Nearcustcloth = false
    elseif name == "customclothesadder" then
        Nearcustomclothadder = false
    elseif name == "garbage" then
        NearGarbage = false
    elseif name == "fish_cutting" then
        NearFishCutting = false
    elseif name == "cocaineent" then
        NearCocaineent = false
    elseif name == "cocaineext" then
        NearCocaineext = false
    elseif name == "cocaineprocess" then
        NearCocaineprocess = false
    elseif name == "paycheck" then
        Nearpaycheck = false
    end
    exports["ab-ui"]:hideInteraction("classic")
end)

function SkinFish()
    Citizen.CreateThread(function()
        while NearFishCutting do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then  
                TriggerEvent("ab-fishing:skin")
            end
        end
    end)
end


function StartProcessCocke()
    Citizen.CreateThread(function()
        while NearCocaineprocess do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then  
                TriggerEvent("coke:sync:ban")
            end
        end
    end)
end

function EnterCoc()
    Citizen.CreateThread(function()
        while NearCocaineent do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then  
                SetEntityCoords(PlayerPedId(),1088.5635986328, -3187.7124023438, -38.993480682373)
                SetEntityHeading(PlayerPedId(),185.47445678711)
            end
        end
    end)
end
function ExitCoc()
    Citizen.CreateThread(function()
        while NearCocaineext do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then  
                SetEntityCoords(PlayerPedId(),-1928.5614013672, 1779.3823242188, 173.0124206543)
                SetEntityHeading(PlayerPedId(),111.15605926514)
            end
        end
    end)
end

function Apart1()
    Citizen.CreateThread(function()
        while Nearaparts1 do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                Nearaparts1 = false
                TriggerServerEvent("apartment:serverEnterAprts", 1)
                
            end
            if IsControlJustReleased(0, 74) then
                TriggerServerEvent("apartment:serverUnlockAprts", 1)
            end
        end
    end)
end

function Apart2()
    Citizen.CreateThread(function()
        while Nearaparts2 do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                Nearaparts2 = false
                TriggerServerEvent("apartment:serverEnterAprts", 2)
            end
            if IsControlJustReleased(0, 74) then
                TriggerServerEvent("apartment:serverUnlockAprts", 2)
            end
        end
    end)
end

function Apart3()
    Citizen.CreateThread(function()
        while Nearaparts3 do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                Nearaparts3 = false
                TriggerServerEvent("apartment:serverEnterAprts", 3)  
            end
            if IsControlJustReleased(0, 74) then
                TriggerServerEvent("apartment:serverUnlockAprts", 3)
            end
        end
    end)
end

function Cloth1()
    Citizen.CreateThread(function()
        while NearClothing do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerServerEvent("raid_clothes:list_outfits")  
            end
        end
    end)
end

function CustomCloth1()
    Citizen.CreateThread(function()
        while Nearcustcloth do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerEvent("raid_clothes:open_customs")  
            end
        end
    end)
end

function CustomClothAdder()
    Citizen.CreateThread(function()
        while Nearcustomclothadder do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                TriggerEvent("raid_clothes:save_customs")  
            end
        end
    end)
end

function Impound()
    Citizen.CreateThread(function()
        while NearImpound do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                RPC.execute("ab-garages:getonlyimpound")
            end
        end
    end)
end

function JobCenter()
    Citizen.CreateThread(function()
        while Nearjobcenter do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                local data = {
                    {
                        title = "Available Jobs",
                        description = "Jobs Provided by the LS Public Dep.",
                        key = true,
                        children = {
                            { title = "Unemployed", action = "ab-ui:JobCenterChanger",description = "Going against the odds?", key = {"unemployed"} },
                            { title = "Pizza Delivery", action = "ab-ui:JobCenterChanger",description = "Deliver pizza and have a easy life", key = {"pizzeria"} },
                            { title = "Garbage", action = "ab-ui:JobCenterChanger",description = "Make the streets clean !", key = {"garbage"} },
                            { title = "Delivery Job", action = "ab-ui:JobCenterChanger",description = "Deliver some packages !", key = {"trucker"} }
                            
                        },
                    },
                  }
                exports["ab-ui"]:showContextMenu(data)
                RegisterUICallback("ab-ui:JobCenterChanger", function(data, cb)
                    local keyData = data.key
                    local action = keyData[1]
                    local version = keyData[2]
                    exports["ab-ui"]:hideContextMenu()
                    TriggerServerEvent("jobssystem:jobs", action)        
                    cb({ data = {}, meta = { ok = true, message = "done" } })
                end)
            end
        end
    end)
end

function isNearClothing()
    return NearClothing
end
function isNearImpound()
    return NearImpound
end