local blips = {
    --{id = "cswitcher1", name = "Character Switcher", color = 19, sprite = 102, x = -193.789, y = -830.927, z = 29.8086 },
    -- {id = "casino1", name = "Casino", color = 5, sprite = 207, x = 925.329, y = 46.152, z = 80.908 },
    {id = "hosp1", name = "Pillbox", scale = 0.5, color = 2, sprite = 61, x = 314.60, y= -590.25, z= 43.28},
    --{id = "hosp1", name = "Hospital", scale = 0.5, color = 2, sprite = 61, x = 1839.6, y= 3672.93, z= 34.28},
   -- {id = "hosp2", name = "Hospital", scale = 0.5, color = 2, sprite = 61, x = -247.76, y= 6331.23, z=32.43},
    --{id = "hosp3", name = "Hospital", scale = 0.5, color = 2, sprite = 61, x = -449.67, y= -340.83, z= 34.50},
    --{id = "hosp4", name = "Hospital", scale = 0.5, color = 2, sprite = 61, x = 357.43, y= -593.36, z= 28.79},
    --{id = "hosp5", name = "Hospital", scale = 0.5, color = 2, sprite = 61, x = 295.83, y= -1446.94, z= 29.97},
    --{id = "hosp6", name = "Hospital", scale = 0.5, color = 2, sprite = 61, x = -676.98, y= 310.68, z= 83.08},
    --{id = "hosp7", name = "Hospital", scale = 0.5, color = 2, sprite = 61, x = 1151.21, y= -1529.62, z= 35.37},
    --{id = "hosp8", name = "Hospital", scale = 0.5, color = 2, sprite = 61, x = -874.64, y= -307.71, z= 39.58},
    {id = "cloth1", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = 425.23, y=-806.00, z=29.49},
    {id = "cloth2", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = -162.65, y=-303.39, z=39.73},
    {id = "cloth3", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = 75.95, y=-1392.89, z=29.37},
    {id = "cloth4", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = -822.19, y=-1074.13, z=11.32},
    {id = "cloth5", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = -1450.71, y=-236.8, z=49.80},
    {id = "cloth6", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = 4.25, y=6512.81, z=31.87},
    {id = "cloth7", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = 615.18, y=2762.93, z=44.08},
    {id = "cloth8", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = 1196.78, y=2709.55, z=38.22},
    {id = "cloth9", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = -3171.45, y=1043.85, z=20.86},
    {id = "cloth10", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = -1100.95, y=2710.21, z=19.10},
    {id = "cloth11", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = -1192.94, y=-772.62, z=17.32},
    {id = "cloth12", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = -707.33, y=-155.07, z=37.41},
    {id = "cloth13", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = 1683.45, y=4823.17, z=42.16},
    {id = "cloth14", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x =121.76, y=-224.6, z=54.56},
    {id = "cloth15", name = "Clothing", scale = 0.5, color = 3, sprite = 73, x = -1207.52, y=-1456.95, z=4.37},

   -- {id = "recycling", name = "Recycling plant", color = 17, sprite = 304, x = 746.75518798828, y=-1400.094482421, z=26.570837020874},
--    {id = "Smelting", name = "Smelting", color = 17, sprite = 52, x = 1098.10168457031, y=-1999.86364746094, z=30.3807010650635},

    --{id = "truckjob1", name = "Delivery Garage", color = 17, sprite = 67, x =165.22, y=-28.38, z=67.94},
    --{id = "truckjob2", name = "Delivery Garage", color = 17, sprite = 67, x = -627.99, y= -1649.99, z= 25.83},
    --{id = "bar1", name = "Bahama Mamas", sprite = 93, x = -1388.53430175781, y=-586.615295410156, z=29.2186660766602},

    {id = "pcenter", name = "Job Payments", scale = 0.5, sprite = 351, color = 17, x=-1081.8293457031, y=-248.12872314453, z=37.763294219971},
    {id = "jcenter", name = "Job Center", scale = 0.5, sprite = 351, color = 17, x=-234.64, y=-920.81, z=32.31},
    {id = "apartment1", name = "Alta St. Apartments", scale = 0.5, sprite = 475, color = 0, x=-262.86, y=-968.53, z=31.22},
    {id = "apartment2", name = "S.A Ave. Apartments", scale = 0.5, sprite = 475, color = 3, x=-1236.66, y=-860.35, z=12.87},
    {id = "apartment3", name = "Elgin Ave. Apartments", scale = 0.5, sprite = 475, color = 10, x=265.77, y=-640.59, z=42.02},
    {id = "carrental", name = "Car Rental", scale = 0.5, sprite = 524, color = 3, x=110.19, y=-1089.55, z=29.30},
    {id = "digitalden", name = "Digital Den", scale = 0.5, sprite = 521, color = 7, x=-657.01, y=-857.35, z=24.50},
    {id = "bennys1", name = "Bennys", scale = 0.5, sprite = 72, color = 7, x=-36.69, y=-1047.11, z=28.37},
    {id = "bennys2", name = "Bennys", scale = 0.5, sprite = 72, color = 7, x=110.68, y=6626.92, z=31.78},
    {id = "bennys3", name = "Bennys", scale = 0.5, sprite = 72, color = 7, x=731.40, y=-1088.79, z=22.169},
    -- {id = "ttruckjob", name = "Impound Lot", scale = 0.7, color = 17, sprite = 68, x = 549.47796630859, y = -55.197559356689, z = 71.069190979004},
    -- {id = "ttruckjob2", name = "Impound Lot", scale = 0.7, color = 17, sprite = 68, x = 1732.1655273438, y = 3307.6025390625, z = 41.22350692749},
    {id = "ttruckjob3", name = "Impound Lot", scale = 0.5, color = 17, sprite = 68, x = -191.92416381836, y = -1162.2023925781, z = 23.671375274658},

    {id = "cityhall", name = "City Hall", scale = 0.5, color = 27, sprite = 419, x = -545.30, y = -203.69, z = 38.21},
   -- {id = "ttruckgarage", name = "Stroke Masters", color = 27, sprite = 147, x = 531.81506347656, y = -176.94529724121, z = 54.750310516357},

   -- {id = "fire1", name = "Fire Station",scale = 0.9, color = 1, sprite = 153, x = 205.30201721191, y = -1651.4327392578, z = 29.803213119507},
    --{id = "fire2", name = "Fire Tower",scale = 0.9, color = 1, sprite = 153, x =  -1195.5244140625, y = -1788.2210693359, z = 19.490871429443},

    --{id = "fire3", name = "Fire Main",scale = 0.9, color = 1, sprite = 153, x =  1206.3913574219, y = -1473.1184082031, z = 34.859497070313},

    --{id = "gopostal", name = "Go Postal", scale = 0.7, color = 17, sprite = 411, x = 63.463, y = 126.000, z = 79.1902},
    --{id = "fishingsales", name = "Fish Sales", scale = 0.7, color = 7, sprite = 304, x=-1038.4649658203, y=-1396.7390136719, z=5.5531921386719},
    --{id = "cc", name = "Comedy Club", scale = 0.7, color = 7, sprite = 102, x=-431.235299, y=259.939819, z=82.9778519},

    --{id = "Imports", name = "Fast Lane Imports & Towing", scale = 0.7, color = 7, sprite = 326, x=-804.48, y=-224.54, z= 37.23},

    --{id = "courthouse", name = "Los Santos Courthouse", scale = 0.7, color = 5, sprite = 58, x=244.5550079345, y=-386.0076904298, z=45.402359008789315},
    --{id = "lawyersoffice", name = "Lawyers Offices", scale = 0.7, color = 5, sprite = 58, x=245.91703796387, y=-347.61932373047, z=44.451446533203},

    --{id = 'TaxiRank', name = 'Taxi Rank', scale = 0.7, color = 5, sprite = 56, x = -12.72, y = -143.3, z = 56.26},
    
    --{id = 'TowTruckParking', name = 'Choppers Jobs', scale = 0.7, color = 5, sprite = 68, x = 536.48, y = -239.46, z = 49.16},

    --{id = 'winery', name = 'The Winery', scale = 0.7, color = 6, sprite = 478, x = -1889.86, y = 2036.54, z = 140.83},

    --{id = 'cc', name = 'Carpet Company', scale = 0.7, color = 7, sprite = 478, x = 718.1,y = -976.41,z = 24.91},

    --{id = 'qf', name = 'The Quick Fix', scale = 0.7, color = 8, sprite = 478, x = 968.03, y = -126.64, z = 74.37},

    --{id = 'HarmonyRepairs', name = 'Harmony Repairs', scale = 0.7, color = 12, sprite = 478, x = 1183.18, y = 2651.66, z = 37.81},

    --{id = "repo", name = "Govt Vehicle Repo", scale = 0.7, color = 8, sprite = 147, x = 400.85, y = -1632.37, z = 29.3},

    -- {id = "burgies", name = "Burger Shot", scale = 0.7, color = 8, sprite = 106, x = -1199.61, y = -899.79, z = 14.0},

    -- {id = "burgies2", name = "Burger Bar", scale = 0.7, color = 8, sprite = 106, x = 282.58, y = -214.76, z = 54.0},
   -- {id = "drift_school", name = "Overboost DriftSchool", scale = 0.5, color = 4, sprite = 52, x = -52.61, y= -2524.91, z= 7.41},

    --{id = "di", name = "Driving Instructor", scale = 0.5, color = 44, sprite = 380, x = 983.83, y= -206.17, z= 71.07},
}


AddEventHandler("ab-base:playerSessionStarted", function()
    Citizen.CreateThread(function()
        for k,v in ipairs(blips) do
            ABX.BlipManager:CreateBlip(v.id, v)
        end
    end)
end)


