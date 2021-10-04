Citizen.CreateThread(function()
    exports["ab-polyzone"]:AddBoxZone("bennys", vector3(452.12, -975.34, 25.7), 5.4, 13.2, {
      minZ = 24.7,
      maxZ = 27.7,
    }) -- MRPD
    -- exports["ab-polyzone"]:AddBoxZone("bennys", vector3(-34.12, -1054.31, 28.4), 6.0, 12.4, {
    --   minZ = 27.4,
    --   maxZ = 33.0,
    --   heading = 312,
    -- }) -- Hub
    exports["ab-polyzone"]:AddBoxZone("bennys", vector3(110.8, 6626.46, 31.89), 7.4, 8, {
      minZ = 30.0,
      maxZ = 36.0,
      heading = 44.0,
    }) -- Paleto
    exports["ab-polyzone"]:AddBoxZone("bennys", vector3(-447.99, 5994.51, 31.34), 3.4, 7.4, {
      heading=356,
      minZ=30.19,
      maxZ=34.99
    }) -- Paleto PD
    exports["ab-polyzone"]:AddBoxZone("bennys", vector3(-809.83, -1507.21, 14.4), 14.2, 13.4, {
      minZ = -0.4,
      maxZ = 6.8,
      heading = 291,
      data = { type = "boats" },
    }) -- Boats
    exports["ab-polyzone"]:AddBoxZone("bennys", vector3(-1652.52, -3143.0, 13.99), 10, 10, {
      minZ = 12.99,
      maxZ = 16.99,
      heading = 240,
      data = { type = "planes" },
    }) -- Planes
    exports["ab-polyzone"]:AddBoxZone("bennys", vector3(2522.64, 2621.78, 37.96), 7.4, 5.8, {
      minZ = 36.96,
      maxZ = 39.96,
      heading = 270,
    }) -- Rex
    exports["ab-polyzone"]:AddBoxZone("bennys", vector3(340.39, -570.6, 28.8), 8.4, 4.4, {
      minZ=27.8,
      maxZ=31.8,
      heading = 340,
    }) -- Pillbox
    exports["ab-polyzone"]:AddBoxZone("bennys", vector3(-1818.56, 2966.05, 32.81), 14.6, 15.6, {
      minZ=31.61,
      maxZ=35.61,
      heading = 330,
      data = { type = "planes" },
    }) 
    exports["ab-polyzone"]:AddBoxZone("bennys", vector3(-1117.81, -826.58, 3.75), 6.25, 4.0, {
      minZ=2.75,
      maxZ=5.95,
      heading = 36
    })
    exports["ab-polyzone"]:AddBoxZone("bennys", vector3(1865.55, 3700.5, 33.37), 13.4, 8, {
      heading=30,
      minZ=32.37,
      maxZ=37.57
    })
    -- Flight school
    -- disabled the below in favor of civ hub
    -- exports["ab-polyzone"]:AddBoxZone("bennys", vector3(-211.88, -1323.91, 30.89), 8.4, 6.6, {minZ=29.0, maxZ=35.0}) -- pdm
    -- exports["ab-polyzone"]:AddBoxZone("bennys", vector3(731.57, -1088.78, 22.17), 5.0, 11.2, {minZ=21.0, maxZ=28.0}) -- bridge
    -- exports["ab-polyzone"]:AddBoxZone("bennys", vector3(938.14, -970.93, 39.51), 6, 8, {minZ=37.0, maxZ=43.0}) -- tuner
    -- exports["ab-polyzone"]:AddBoxZone("bennys", vector3(-771.46, -233.66, 37.08), 7.4, 8, {minZ=36.0, maxZ=42.0}) -- import
end)
