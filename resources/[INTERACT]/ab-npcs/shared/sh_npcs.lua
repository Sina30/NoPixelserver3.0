Generic = {}
Generic.NPCS = {}

Generic.SpawnLocations = {
  -- vector4(620.48, 2752.6, 42.09 - 1.0, 359.94)
  vector4(-1605.03,-994.58,7.53 - 1.0,136.79),
}

Generic.ShopKeeperLocations = {
  vector4(-3037.773, 584.8989, 6.97, 30.0),
  vector4(1960.64, 3739.03, 31.50, 321.36),
  vector4(1393.84,3606.8,33.99,172.8),
  vector4(549.01,2672.44,41.16,122.33),
  vector4(2558.39,380.74,107.63,21.54),
  vector4(-1819.57,793.59,137.09,134.3),
  vector4(-1221.26,-907.92,11.3,54.44),
  vector4(-706.12,-914.56,18.22,94.66),
  vector4(24.47,-1348.47,28.5,298.26),
  vector4(-47.36,-1758.68,28.43,50.84),
  vector4(1164.95,-323.7,68.21,101.73),
  vector4(372.19,325.74,102.57,276.17),
  vector4(2678.63,3278.86,54.25,344.4),
  vector4(1727.3,6414.27,34.04,259.1),
  vector4(-160.56,6320.76,30.59,319.99),
  vector4(1165.29,2710.85,37.16,178.47),
  vector4(1697.23,4923.42,41.07,327.94),
  vector4(159.84,6640.89,30.7,242.18),
  vector4(-1486.81,-377.38,39.17,143.01),
  vector4(-3241.1,999.93,11.84,10.23),
  vector4(-2966.38,391.79,14.05,99.55),
  vector4(1134.29,-983.39,45.42,292.7)
}

Generic.SportShopLocations = {
  vector4(-679.46, 5839.32, 16.34, 218.69),
}

Generic.CasinoLocations = {
  {
    coords = vector4(1087.97,221.13,-50.2,184.64), -- coat check
    flags = { "isCasinoMembershipGiver" },
  },
  {
    coords = vector4(1129.99,275.29,-52.04,270.69), -- rest room 1
  },
  {
    coords = vector4(1157.45,247.93,-52.04,2.02), -- rest room 2
  },
  {
    coords = vector4(1100.64,195.64,-50.44,314.95), -- jewel store
  },
  {
    coords = vector4(1117.42,219.91,-50.38,85.22), -- casino chips
    flags = { "isCasinoChipSeller" },
  },
  {
    coords = vector4(1109.61,229.28,-50.63,220.93), -- wheel of fortune
  },
  {
    coords = vector4(1110.2,208.29,-50.44,82.67), -- drinks bar
    flags = { "isCasinoDrinkGiver" },
  },
}

Generic.WeaponShopLocations = {
  vector4(23.36,-1105.82,28.8,156.03),
  vector4(1696.02,3760.72,33.71,193.37),
  vector4(808.26,-2157.71,28.62,276.46),
  vector4(254.32,-49.28,68.95,70.86),
  vector4(840.21,-1032.9,27.2,289.83),
  vector4(-331.75,6084.95,30.46,224.64),
  vector4(-666.13,-938.73,20.83,269.52),
  vector4(-1310.05,-389.17,35.7,144.36),
  vector4(-1116.51,2700.33,17.58,149.9),
  vector4(2571.79,298.1,107.74,84.22),
  vector4(-3169.53,1089.59,19.84,237.35),
}

Generic.ToolShopLocations = {
  vector4(44.838947296143, -1748.5364990234, 28.549386978149, 35.3),
  vector4(2749.2309570313, 3472.3308105469, 54.679393768311, 244.4),
}

Generic.GemShopLocations = {
  vector4(-549.58,-618.83,33.72,178.55),
}

Generic.WeedShopLocations = {
  vector4(1175.49, -437.54, 65.9, 262.06),
}

Generic.JobVehLocations = {
  vector4(-50.2,-1089.03,25.48,154.36),
}

Generic.WineryBuyLocations = {
  vector4(-1928.02,2060.22,139.85,308.35),
}

Generic.LicenseBuyLocations = {
  vector4(-540.57,-191.22,37.23,119.25),
}

Generic.MobilePhoneUsers = {
  vector4(726.82,-1074.63,21.25,283.09),
  vector4(729.65,-1069.9,21.25,176.13),
  -- vector4(480.13,-1312.7,28.25,193.05),
}

Generic.VehicleShopKeepersData = {
  {
    id = "bike_shop",
    model = "a_m_y_beach_02",
    location = vector4(-1109.4,-1694.36,3.5,308.3),
  },
  {
    id = "veh_rental",
    model = "a_m_y_business_02",
    location = vector4(110.59,-1090.72,28.31,17.39),
  },
  {
    id = "boat_shop",
    model = "s_m_y_grip_01",
    location = vector4(-874.3,-1325.08,0.61,87.95),
  },
  {
    id = "air_shop",
    model = "s_m_y_pilot_01",
    location = vector4(-1620.67,-3151.72,13.0,8.23),
  }
}

-- Generic.NPCS[#Generic.NPCS + 1] = {
--   id = "pawnshop",
--   name = "Pawn Shop",
--   pedType = 4,
--   model = "s_m_y_ammucity_01",
--   networked = false,
--   distance = 200.0,
--   position = {
--     coords = vector3(0.0, 0.0, 0.0),
--     heading = 0.0,
--     random = true
--   },
--   appearance = '{"eyebrow":{"params":[2,0,0.0],"mode":"overlay"},"skinproblem":{"params":[6,0,0.0],"mode":"overlay"},"freckles":{"params":[9,0,0.0],"mode":"overlay"},"badges":{"params":[10,0,0,1],"mode":"component"},"arms":{"params":[3,0,0,1],"mode":"component"},"hat":{"params":[0,-1,-1,1],"mode":"prop"},"beard_color":{"params":[2,0,0,0,0],"mode":"overlaycolor"},"kevlar":{"params":[9,0,0,1],"mode":"component"},"bag":{"params":[5,0,0,1],"mode":"component"},"undershirt":{"params":[8,0,0,1],"mode":"component"},"wrinkles":{"params":[3,0,0.0],"mode":"overlay"},"shoes":{"params":[6,0,0,1],"mode":"component"},"legs":{"params":[4,0,0,1],"mode":"component"},"watch":{"params":[6,-1,-1,1],"mode":"prop"},"haircolor":{"params":[-1,-1],"mode":"haircolor"},"bracelet":{"params":[7,-1,-1,1],"mode":"prop"},"torso":{"params":[11,0,0,1],"mode":"component"},"hair":{"params":[2,0,0,1],"mode":"component"},"glasses":{"params":[1,-1,-1,1],"mode":"prop"},"mask":{"params":[1,0,0,1],"mode":"component"},"beard":{"params":[1,0,0.0],"mode":"overlay"},"accesory":{"params":[7,0,0,1],"mode":"component"},"eyecolor":{"params":[-1],"mode":"eyecolor"},"face":{"params":[0,0,0,1],"mode":"component"},"ears":{"params":[2,-1,-1,1],"mode":"prop"}}',
--   settings = {
--       { mode = "invincible", active = true },
--       { mode = "ignore", active = true },
--       { mode = "freeze", active = true }
--   },
--   flags = {
--       ['isNPC'] = true,
--       ['isPawnBuyer'] = true
--   }
-- }

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "recycle_exchange",
  name = "Recycle Exchange",
  pedType = 4,
  model = "s_m_y_garbage",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(-355.76, -1556.04, 24.18),
    heading = 179.96,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isRecycleExchange'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "news_reporter",
  name = "News Reporter",
  pedType = 4,
  model = "a_m_m_paparazzi_01",
  networked = false,
  distance = 75.0,
  position = {
    coords = vector3(-598.85, -929.87, 22.87),
    heading = 83.47,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isCommonJobProvider'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "head_stripper",
  name = "Head Stripper",
  pedType = 4,
  model = "csb_tonya",
  networked = false,
  distance = 25.0,
  position = {
    coords = vector3(110.98, -1297.22, 28.39),
    heading = 204.3,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isCommonJobProvider'] = true
  },
  scenario = "WORLD_HUMAN_SMOKING"
}


Generic.NPCS[#Generic.NPCS + 1] = {
  id = "paycheck_banker",
  name = "Bank Account Manager",
  pedType = 4,
  model = "cs_bankman",
  networked = false,
  distance = 25.0,
  position = {
    coords = vector3(242.020568847656, 227.114593505859, 106.031478881835),
    heading = 160.0,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
      { mode = "collision", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isBankAccountManager'] = true
  },
  scenario = "PROP_HUMAN_SEAT_CHAIR_UPRIGHT"
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "fish_market",
  name = "Fish Market",
  pedType = 4,
  model = "ig_chef",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-1846.64,-1190.94,13.33),
    heading = 135.0,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
      ['isNPC'] = true,
  },
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "fish_shop",
  name = "Fish Shop",
  pedType = 4,
  model = "ig_chef",
  networked = false,
  distance = 35.0,
  position = {
    coords = vector3(-1598.01,5200.89,4.38 - 1),
    heading = 73.401,
    random = true
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
      ['isNPC'] = true,
  },
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "boat_spawner",
  name = "Boat Spawn",
  pedType = 4,
  model = "ig_floyd",
  networked = false,
  distance = 35.0,
  position = {
    coords = vector3(-1607.67,5264.94,3.97 - 1),
    heading = 167.78746032715,
    random = true
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
      ['isNPC'] = true,
  },
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "isGarbageInst",
  name = "GARBAGE INST",
  pedType = 2,
  model = "s_m_y_garbage",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-321.55, -1546.16, 31.01 - 1.0),
    heading = 355.26,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    isNPC = true,
    isGarbageInst = true,
  },
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "chicken_seller",
  name = "Chicken Seller",
  pedType = 2,
  model = "a_m_m_hillbilly_01",
  networked = false,
  distance = 35.0,
  position = {
    coords = vector3(2572.22,480.01,108.67 - 1.0),
    heading = 84.40,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    -- isNPC = true,
    isChickienSeller = true,
  },
  scenario = "WORLD_HUMAN_AA_SMOKE"
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "coke_spawner",
  name = "Coke Spawn",
  pedType = 4,
  model = "s_m_m_pilot_02",
  networked = false,
  distance = 35.0,
  position = {
    coords = vector3(2121.2570800781, 4782.9345703125, 40.970268249512 - 1),
    heading = 322.08538818359,
    random = true
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
      ['isNPC'] = true,
  },
  scenario = "WORLD_HUMAN_AA_SMOKE"
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "chicken_start",
  name = "Chicken Spawn",
  pedType = 5,
  model = "a_m_m_farmer_01",
  networked = false,
  distance = 35.0,
  position = {
    coords = vector3(2387.9135742188, 5046.1362304688, 46.424026489258 - 1),
    heading = 250.26934814453,
    random = true
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    isChickienSeller = true,
  },
  scenario = "WORLD_HUMAN_AA_SMOKE"
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "digital_den_npc",
  name = "Digital Den",
  pedType = 4,
  model = "a_m_y_stwhi_02",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-656.85,-858.78,24.50 - 1),
    heading = 345.48,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
      ['isNPC'] = true,
  },
  scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT"
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "city_hall_npc_m",
  name = "City Hall Male",
  pedType = 4,
  model = "s_m_m_movprem_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-553.38,-192.37,38.21 - 1),
    heading = 209.45,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
      ['isNPC'] = true,
  },
  scenario = "WORLD_HUMAN_CLIPBOARD"
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "city_hall_npc_f",
  name = "City Hall Female",
  pedType = 4,
  model = "ig_molly",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-551.37,-191.23,38.21 - 1),
    heading = 206.38,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
      ['isNPC'] = true,
  },
  scenario = "WORLD_HUMAN_CLIPBOARD"
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "car_rental",
  name = "Car Rental",
  pedType = 4,
  model = "csb_popov",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(110.54,-1091.00,29.30 - 1),
    heading = 6.9090747833252,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
      ['isNPC'] = true,
  },
  scenario = "WORLD_HUMAN_CLIPBOARD"
}
