--[[

DOOR CONFIG SETUP AND INSTRUCTIONS

id = same key as table index
active = register door with system (do not delete doors, only set active to false)

EXAMPLE:
    {
      info = "",
      id = 173,
      coords = vector3(-770.62261962891, -240.0270690918, 37.545078277588),
      model = 1501451068,
      lock = true,
      desc = "fastlane",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {
          ["dojo"] = true,
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },

access = job -> PD = Police, DOC, Judge, DA
access = job -> DR = Medic, Doctor, Therapist
access = business -> "fastlane" = business.code in the database, with employee property_keys access permission
access = business -> "dojo" = business.code in the database, with employee property_keys access permission

]]--

DOOR_CONFIG = {
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison main gate",
      model = 741314661,
      lock = true,
      active = true,
      keyFob = true,
      id = 1,
      coords = vector3(1844.998046875, 2604.8029785156, 44.637271881104),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison main gate inner",
      model = 741314661,
      lock = true,
      active = true,
      keyFob = true,
      id = 2,
      coords = vector3(1818.54296875, 2604.8129882812, 44.610000610352),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison main gate inner",
      model = 741314661,
      lock = true,
      active = true,
      keyFob = true,
      id = 3,
      coords = vector3(1801.1259765625, 2616.9753417969, 44.601043701172),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "paleto pd",
      model = -1765048490,
      lock = false,
      active = true,
      id = 4,
      coords = vector3(1855.6899414062, 3683.919921875, 34.592720031738),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "paleto pd",
      model = -1501157055,
      lock = false,
      active = true,
      id = 5,
      coords = vector3(-442.66003417969, 6015.2216796875, 31.866329193115),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "paleto pd",
      model = -1501157055,
      lock = false,
      active = true,
      id = 6,
      coords = vector3(-444.49847412109, 6017.0600585938, 31.866329193115),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "paleto pd",
      model = 741314661,
      lock = true,
      active = true,
      id = 7,
      coords = vector3(1827.7265625, 2710.4248046875, 44.446701049805),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 8,
      coords = vector3(1814.1224365234, 2490.0524902344, 44.46155166626),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 9,
      coords = vector3(1808.4652099609, 2473.0249023438, 44.479473114014),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 10,
      coords = vector3(1763.935546875, 2427.1879882812, 44.43985748291),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 11,
      coords = vector3(1744.947265625, 2417.6950683594, 44.42716217041),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 12,
      coords = vector3(1674.9473876953, 2406.7541503906, 44.42879486084),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 13,
      coords = vector3(1648.7509765625, 2410.0895996094, 44.445068359375),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 14,
      coords = vector3(1561.6689453125, 2462.8774414062, 44.395286560059),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 15,
      coords = vector3(1550.2398681641, 2484.0383300781, 44.394580841064),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 16,
      coords = vector3(1546.6015625, 2568.8068847656, 44.390327453613),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 17,
      coords = vector3(1547.7791748047, 2592.6884765625, 44.5071144104),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 18,
      coords = vector3(1571.4664306641, 2661.1784667969, 44.509468078613),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 19,
      coords = vector3(1585.5863037109, 2681.021484375, 44.5071144104),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 20,
      coords = vector3(1647.0657958984, 2740.9768066406, 44.445941925049),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 21,
      coords = vector3(1666.2685546875, 2750.8894042969, 44.445941925049),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 22,
      coords = vector3(1755.3217773438, 2755.0422363281, 44.446689605713),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 23,
      coords = vector3(1778.1319580078, 2746.6267089844, 44.445278167725),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison",
      model = 741314661,
      lock = true,
      active = true,
      id = 24,
      coords = vector3(1837.7927246094, 2682.2133789062, 44.446701049805),
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 25,
      coords = vector3(1764.4519042969, 2497.4738769531, 49.431346893311),
      model = -1167410167,
      lock = false,
      desc = "prison cell door",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 26,
      coords = vector3(1761.2351074219, 2495.6188964844, 49.430904388428),
      model = -1167410167,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 27,
      coords = vector3(1758.2139892578, 2493.8989257812, 49.428310394287),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 28,
      coords = vector3(1755.2066650391, 2492.1467285156, 49.43045425415),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 29,
      coords = vector3(1752.1845703125, 2490.4045410156, 49.427753448486),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 30,
      coords = vector3(1749.2471923828, 2488.7119140625, 49.425899505615),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 31,
      coords = vector3(1746.0877685547, 2486.896484375, 49.427043914795),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 32,
      coords = vector3(1743.1550292969, 2485.2099609375, 49.423957824707),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 33,
      coords = vector3(1764.1823730469, 2497.3188476562, 44.82377243042),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 34,
      coords = vector3(1761.1732177734, 2495.5869140625, 44.822597503662),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 35,
      coords = vector3(1755.0570068359, 2492.0642089844, 44.822154998779),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 36,
      coords = vector3(1752.2060546875, 2490.4174804688, 44.821727752686),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 37,
      coords = vector3(1749.125, 2488.6474609375, 44.821376800537),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 38,
      coords = vector3(1746.1831054688, 2486.9523925781, 44.822734832764),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 39,
      coords = vector3(1743.2032470703, 2485.2370605469, 44.82209777832),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 40,
      coords = vector3(1772.6505126953, 2484.748046875, 49.425800323486),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 41,
      coords = vector3(1769.5023193359, 2482.9338378906, 49.426296234131),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 42,
      coords = vector3(1766.5654296875, 2481.2424316406, 49.427722930908),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prison small gate",
      model = -1156020871,
      lock = true,
      active = true,
      keyFob = true,
      id = 43,
      coords = vector3(1797.7608642578, 2596.5649414062, 46.387306213379),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "paleto bank",
      model = 1309269072,
      lock = false,
      active = false,
      id = 44,
      coords = vector3(-104.81363677979, 6473.646484375, 31.9547996521),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "paleto bank inner",
      model = 1309269072,
      lock = false,
      active = false,
      id = 45,
      coords = vector3(-106.47130584717, 6476.1577148438, 31.9547996521),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "vault door first",
      model = -222270721,
      lock = true,
      active = true,
      id = 46,
      coords = vector3(256.31155395508, 220.65788269043, 106.4295425415),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          -- ["PD"] = true,
        },
        business = {},
      },
      desc = "vault office door upper",
      model = 1956494919,
      lock = true,
      active = true,
      id = 47,
      coords = vector3(266.36236572266, 217.56977844238, 110.43280792236),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "vault door second",
      model = 746855201,
      lock = true,
      active = true,
      id = 48,
      coords = vector3(262.19808959961, 222.51884460449, 106.4295425415),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "vault door inner bar door 1",
      model = -1508355822,
      lock = true,
      active = true,
      id = 49,
      coords = vector3(251.85757446289, 221.06552124023, 101.83238983154),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "vault door inner bar door 2",
      model = -1508355822,
      lock = true,
      active = true,
      id = 50,
      coords = vector3(261.30041503906, 214.50517272949, 101.83238983154),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          -- ["PD"] = true,
        },
        business = {},
      },
      desc = "vault door",
      model = -1023447729,
      lock = true,
      active = true,
      id = 51,
      coords = vector3(735.1982421875, 132.41223144531, 80.906539916992),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "",
      model = -1011692606,
      lock = true,
      active = true,
      id = 52,
      coords = vector3(-7.404239654541, -678.65899658203, 16.358612060547),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -1011692606,
      lock = true,
      active = true,
      id = 53,
      coords = vector3(-2.9891395568848, -676.64025878906, 16.358600616455),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -1011692606,
      lock = true,
      active = true,
      id = 54,
      coords = vector3(2.2664804458618, -678.55090332031, 16.358600616455),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -1011692606,
      lock = true,
      active = true,
      id = 55,
      coords = vector3(4.3517303466797, -682.93389892578, 16.358612060547),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -1011692606,
      lock = true,
      active = true,
      id = 56,
      coords = vector3(-0.97740936279297, -671.11315917969, 16.358600616455),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -1011692606,
      lock = true,
      active = true,
      id = 57,
      coords = vector3(-3.5844497680664, -668.16436767578, 16.358612060547),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -1011692606,
      lock = true,
      active = true,
      id = 58,
      coords = vector3(-1.6562404632568, -662.13287353516, 16.358600616455),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -1011692606,
      lock = true,
      active = true,
      id = 59,
      coords = vector3(10.572834014893, -666.58392333984, 16.358600616455),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -1011692606,
      lock = true,
      active = true,
      id = 60,
      coords = vector3(8.1715278625488, -672.43927001953, 16.358612060547),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -1011692606,
      lock = true,
      active = true,
      id = 61,
      coords = vector3(4.2780303955078, -673.02374267578, 16.358600616455),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -1932297301,
      lock = false,
      active = true,
      id = 62,
      coords = vector3(-1.7279491424561, -686.54174804688, 16.689130783081),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "union",
      model = -341973294,
      lock = true,
      active = true,
      id = 63,
      coords = vector3(2046.6971435547, 2969.0944824219, -67.152450561523),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -341973294,
      lock = true,
      active = true,
      id = 64,
      coords = vector3(2048.1884765625, 2971.2243652344, -67.152450561523),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -341973294,
      lock = true,
      active = true,
      id = 65,
      coords = vector3(2060.0520019531, 2976.9985351562, -67.152450561523),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -341973294,
      lock = true,
      active = true,
      id = 66,
      coords = vector3(2061.5432128906, 2979.1281738281, -67.152450561523),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -341973294,
      lock = true,
      active = true,
      id = 67,
      coords = vector3(2049.2504882812, 2972.7419433594, -61.752464294434),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -341973294,
      lock = true,
      active = true,
      id = 68,
      coords = vector3(2047.7592773438, 2970.6123046875, -61.752464294434),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 69,
      coords = vector3(2060.4587402344, 2985.0070800781, -67.151954650879),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 70,
      coords = vector3(2062.5893554688, 2983.5153808594, -67.151954650879),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 71,
      coords = vector3(2054.6967773438, 2980.51953125, -67.152450561523),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 72,
      coords = vector3(2050.6818847656, 2974.7854003906, -67.152450561523),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 73,
      coords = vector3(2054.6921386719, 2969.34375, -67.152450561523),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 74,
      coords = vector3(2050.6770019531, 2963.6096191406, -67.152450561523),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 75,
      coords = vector3(2050.6789550781, 2974.78125, -61.752468109131),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 76,
      coords = vector3(2057.0795898438, 2983.9228515625, -61.752468109131),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 77,
      coords = vector3(2060.458984375, 2985.0068359375, -61.751953125),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 78,
      coords = vector3(2062.5886230469, 2983.515625, -61.751953125),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 79,
      coords = vector3(2128.1083984375, 2924.849609375, -61.752445220947),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "fib",
      model = -147325430,
      lock = true,
      active = true,
      id = 80,
      coords = vector3(2122.7348632812, 2928.193359375, -61.752445220947),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["vanilla_unicorn"] = true,
        },
      },
      desc = "vufront",
      model = -1116041313,
      lock = false,
      active = true,
      id = 81,
      coords = vector3(127.95523834229, -1298.5034179688, 29.419622421265),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["vanilla_unicorn"] = true,
        },
      },
      desc = "vuback",
      model = 668467214,
      lock = true,
      active = true,
      id = 82,
      coords = vector3(96.091972351074, -1284.8537597656, 29.43878364563),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["vanilla_unicorn"] = true,
        },
      },
      desc = "vuback",
      model = -495720969,
      lock = true,
      active = true,
      id = 83,
      coords = vector3(113.98224639893, -1297.4304199219, 29.418678283691),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "paperfactoryfrontright", 
      model = -681066206,
      lock = true,
      active = true,
      id = 84,
      coords = vector3(719.3818359375, -975.41851806641, 25.005716323853),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "paperfactoryfrontleft",
      model = 245182344,
      lock = true,
      active = true,
      id = 85,
      coords = vector3(716.78082275391, -975.42065429688, 25.005716323853),
      forceUnlocked = false,
    },
    {
      info = "",
      active = false,
      id = 86,
      coords = vector3(981.15057373047, -103.25524902344, 74.993576049805),
      model = 2271212864,
      lock = true,
      desc = "quickfixfrontdoor",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 87,
      coords = vector3(709.98126220703, -963.53106689453, 30.545291900635),
      model = 551491569,
      lock = true,
      desc = "paperfactoryoffice",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 88,
      coords = vector3(709.98944091797, -960.66754150391, 30.545291900635),
      model = 933053701,
      lock = true,
      desc = "paperfactorystorage",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = false,
      id = 89,
      coords = vector3(150.29132080078, -1047.6290283203, 29.666297912598),
      model = -1591004109,
      lock = true,
      desc = "fleeca",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 90,
      coords = vector3(482.41107177734, -3115.9248046875, 5.1623539924622),
      model = 1286392437,
      lock = true,
      keyFob = true,
      desc = "merryweathersecurityfrontgateright",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 91,
      coords = vector3(493.71960449219, -3115.93359375, 5.1601490974426),
      model = 1286392437,
      lock = true,
      keyFob = true,
      desc = "merryweathersecurityfrontgateleft",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 92,
      coords = vector3(-801.09887695312, -218.48577880859, 37.240409851074),
      model = -1821777087,
      lock = true,
      desc = "fastlane",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 93,
      coords = vector3(-798.83862304688, -217.19999694824, 37.240409851074),
      model = -1821777087,
      lock = true,
      desc = "fastlane",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "prisongatetothetopofvisitation",
      model = 91564889,
      lock = true,
      active = true,
      keyFob = true,
      id = 94,
      coords = vector3(1838.4018554688, 2559.8381347656, 46.098838806152),
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 95,
      coords = vector3(1846.3365478516, 3682.8596191406, 34.416320800781),
      model = 631614199,
      lock = true,
      desc = "sandyshorespdcell1",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 96,
      coords = vector3(1841.8596191406, 3683.2365722656, 34.416320800781),
      model = 631614199,
      lock = true,
      desc = "sandyshorespdcell2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 97,
      coords = vector3(1840.3712158203, 3685.8415527344, 34.416320800781),
      model = 631614199,
      lock = true,
      desc = "sandyshorespdcell3",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "sandyshorespdcell4",
      active = true,
      id = 98,
      coords = vector3(1844.8323974609, 3685.4611816406, 34.416320800781),
      model = 631614199,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 99,
      coords = vector3(-433.91046142578, 6004.7915039062, 31.866170883179),
      model = 631614199,
      lock = true,
      desc = "paletopdcell1",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 100,
      coords = vector3(103.36805725098, 3609.7470703125, 40.872360229492),
      model = -543490328,
      lock = true,
      desc = "lostmccompoundgaragedoorleft",
      access = {
        job = {},
        business = {
          ["lostmc"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 101,
      coords = vector3(103.40389251709, 3612.3474121094, 40.872360229492),
      model = -543490328,
      lock = true,
      desc = "lostmccompoundgaragedoorright",
      access = {
        job = {},
        business = {
          ["lostmc"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 102,
      coords = vector3(90.942749023438, 3608.9328613281, 40.875526428223),
      model = 190770132,
      lock = true,
      desc = "lostmccompoundfrontdoor",
      access = {
        job = {},
        business = {
          ["lostmc"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 103,
      coords = vector3(300.69100952148, 203.64735412598, 104.64311981201),
      model = 1888438146,
      lock = true,
      main = true,
      desc = "dojo",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["ddojo"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 104,
      coords = vector3(302.52127075195, 202.98120117188, 104.64311981201),
      model = 272205552,
      lock = true,
      desc = "dojo",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["ddojo"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 105,
      coords = vector3(948.57757568359, -965.35668945312, 39.651340484619),
      model = 1289778077,
      lock = true,
      main = true,
      desc = "tuner",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["tuner"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 106,
      coords = vector3(955.39764404297, -972.458984375, 39.655712127686),
      model = -626684119,
      lock = true,
      desc = "tuner",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["tuner"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 107,
      coords = vector3(1844.3527832031, 2579.5871582031, 46.160011291504),
      model = -1320876379,
      lock = true,
      desc = "prisonvisitationofficedoor",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 108,
      coords = vector3(1841.0472412109, 2595.0183105469, 46.164154052734),
      model = -1437850419,
      lock = true,
      desc = "prisonvisitationfirstgate",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 109,
      coords = vector3(1833.6701660156, 2595.0202636719, 46.164154052734),
      model = -1437850419,
      lock = true,
      desc = "prisonvisitationsecondgate",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 110,
      coords = vector3(1827.2995605469, 2592.8630371094, 46.160942077637),
      model = -1033001619,
      lock = true,
      desc = "prison",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 111,
      coords = vector3(-631.95538330078, -236.33326721191, 38.206531524658),
      model = 1425919976,
      lock = true,
      desc = "jewel",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 112,
      coords = vector3(-630.42651367188, -238.43754577637, 38.206531524658),
      model = 9467943,
      lock = true,
      desc = "jewel",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 113,
      coords = vector3(1763.3104248047, 2479.3625488281, 49.428890228271),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 114,
      coords = vector3(1760.5416259766, 2477.7692871094, 49.427257537842),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 115,
      coords = vector3(1757.5354003906, 2476.0400390625, 49.429347991943),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 116,
      coords = vector3(1754.5555419922, 2474.3220214844, 49.429214477539),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          "",
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 117,
      coords = vector3(1751.5261230469, 2472.5764160156, 49.430191040039),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 118,
      coords = vector3(1772.5831298828, 2484.70703125, 44.818382263184),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 119,
      coords = vector3(1769.4412841797, 2482.8974609375, 44.817367553711),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 120,
      coords = vector3(1766.5521240234, 2481.2338867188, 44.816417694092),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 121,
      coords = vector3(1763.5983886719, 2479.537109375, 44.815486907959),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 122,
      coords = vector3(1760.5462646484, 2477.7744140625, 44.816192626953),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 123,
      coords = vector3(1757.5634765625, 2476.056640625, 44.813514709473),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 124,
      coords = vector3(1754.5463867188, 2474.318359375, 44.812152862549),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 125,
      coords = vector3(1751.5368652344, 2472.5903320312, 44.82933807373),
      model = -1167410167,
      lock = false,
      desc = "pcd",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 126,
      coords = vector3(1758.064453125, 2493.7941894531, 45.96915435791),
      model = -1033001619,
      lock = false,
      desc = "prisoncellblockdoortooutside1",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 127,
      coords = vector3(1754.8530273438, 2501.7468261719, 46.027267456055),
      model = 1373390714,
      lock = false,
      desc = "prisoncellblockdoortooutside2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 128,
      coords = vector3(1771.6512451172, 2494.3786621094, 50.583248138428),
      model = -2109504629,
      lock = true,
      desc = "prison",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 129,
      coords = vector3(1772.94921875, 2492.125, 50.582962036133),
      model = -2109504629,
      lock = true,
      desc = "prison",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 130,
      coords = vector3(1781.0659179688, 2510.1574707031, 45.973655700684),
      model = 1373390714,
      lock = true,
      desc = "prison",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 131,
      coords = vector3(1779.7202148438, 2507.5935058594, 45.976219177246),
      model = -1033001619,
      lock = true,
      desc = "prison",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 132,
      coords = vector3(-152.83229064941, 295.14059448242, 98.989059448242),
      model = -574290911,
      lock = true,
      desc = "roostercabfrontdoor1",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 133,
      coords = vector3(-150.44529724121, 295.14059448242, 98.989059448242),
      model = 1773345779,
      lock = true,
      desc = "roostercabfrontdoor2",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 134,
      coords = vector3(-160.27130126953, 316.37158203125, 99.096061706543),
      model = 1971752884,
      lock = true,
      desc = "roostercabofficedoor",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 135,
      coords = vector3(-178.37829589844, 306.79058837891, 101.28005981445),
      model = 1971752884,
      lock = true,
      desc = "roostercabcellardoor",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 136,
      coords = vector3(-1879.1531982422, 2056.4060058594, 141.13409423828),
      model = 534758478,
      lock = true,
      desc = "winerybasementdoor",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 137,
      coords = vector3(-1883.2299804688, 2059.8811035156, 145.73190307617),
      model = 534758478,
      lock = true,
      desc = "wineryupstairsdoor1",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 138,
      coords = vector3(-1885.6789550781, 2060.7749023438, 145.73190307617),
      model = 534758478,
      lock = true,
      desc = "wineryupstairsdoor2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 139,
      coords = vector3(1775.7957763672, 2512.6845703125, 45.978141784668),
      model = -1033001619,
      lock = true,
      desc = "prisonarmorydoor",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 140,
      coords = vector3(1770.7302246094, 2506.4345703125, 45.973712921143),
      model = -1033001619,
      lock = true,
      desc = "prisoninfermery",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 141,
      coords = vector3(-1864.2130126953, 2061.2651367188, 141.14559936523),
      model = 988364535,
      lock = true,
      desc = "winerysecretbasementdoor1",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 142,
      coords = vector3(-1864.1999511719, 2059.8989257812, 141.14520263672),
      model = -1141522158,
      lock = true,
      desc = "winerysecretbasementdoor2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 143,
      coords = vector3(-178.32029724121, 315.56558227539, 98.211059570312),
      model = 1641293839,
      lock = true,
      desc = "roostercabbackdoor1",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 144,
      coords = vector3(-178.32029724121, 313.12759399414, 98.211059570312),
      model = 1507503102,
      lock = true,
      desc = "roostercabbackdoor2",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 145,
      coords = vector3(-171.9162902832, 319.88858032227, 93.952056884766),
      model = 1971752884,
      lock = true,
      desc = "roostercabbasementdoor",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 146,
      coords = vector3(-178.37829589844, 306.79058837891, 97.627059936523),
      model = 1971752884,
      lock = true,
      desc = "roostercabtopofficedoor",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 147,
      coords = vector3(-161.63330078125, 328.12557983398, 93.954055786133),
      model = 1971752884,
      lock = true,
      desc = "roostercabsideofficedoor1",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 148,
      coords = vector3(-161.63330078125, 334.00259399414, 93.954055786133),
      model = 1971752884,
      lock = true,
      desc = "roostercabsideofficedoor2",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 149,
      coords = vector3(-167.21929931641, 328.12557983398, 93.954055786133),
      model = 1971752884,
      lock = true,
      desc = "roostercabsideofficedoor3",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 150,
      coords = vector3(-167.21929931641, 334.00259399414, 93.954055786133),
      model = 1971752884,
      lock = true,
      desc = "roostercabsideofficedoor4",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 151,
      coords = vector3(-172.7912902832, 334.00259399414, 93.954055786133),
      model = 1971752884,
      lock = true,
      desc = "roostercabsideofficedoor5",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 152,
      coords = vector3(-172.7912902832, 328.12557983398, 93.954055786133),
      model = 1971752884,
      lock = true,
      desc = "roostercabsideofficedoor6",
      access = {
        job = {},
        business = {
          ["rooster"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 153,
      coords = vector3(15.915170669556, -2534.6853027344, 5.0471730232239),
      model = 1286392437,
      lock = true,
      desc = "driftschoolentrancegate1",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 154,
      coords = vector3(9.81858253479, -2543.3957519531, 5.0435070991516),
      model = 1286392437,
      lock = true,
      desc = "driftschoolentrancegate2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 155,
      coords = vector3(-193.42407226562, -2515.3093261719, 5.0471730232239),
      model = 1286392437,
      lock = true,
      desc = "driftschoolentrancegate3",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 156,
      coords = vector3(-203.94105529785, -2515.3083496094, 5.0454182624817),
      model = 1286392437,
      lock = true,
      desc = "driftschoolentrancegate4",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 157,
      coords = vector3(-63.310394287109, -2519.1291503906, 7.5452351570129),
      model = 3610585061,
      lock = true,
      desc = "driftsachoolofficedoor",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 158,
      coords = vector3(324.23602294922, -589.22619628906, 43.433910369873),
      model = -434783486,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 159,
      coords = vector3(326.6549987793, -590.10662841797, 43.433910369873),
      model = -1700911976,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 160,
      coords = vector3(325.66946411133, -580.45959472656, 43.433910369873),
      model = -1700911976,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 161,
      coords = vector3(326.54989624023, -578.04064941406, 43.433910369873),
      model = -434783486,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 162,
      coords = vector3(325.6565246582, -576.30993652344, 43.433910369873),
      model = -1700911976,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 163,
      coords = vector3(323.23754882812, -575.42944335938, 43.433910369873),
      model = -434783486,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 164,
      coords = vector3(320.26153564453, -574.34631347656, 43.433910369873),
      model = -1700911976,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 165,
      coords = vector3(317.84255981445, -573.46588134766, 43.433910369873),
      model = -434783486,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 166,
      coords = vector3(314.4241027832, -572.22155761719, 43.433910369873),
      model = -1700911976,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 167,
      coords = vector3(312.00512695312, -571.34118652344, 43.433910369873),
      model = -434783486,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 168,
      coords = vector3(348.4333190918, -588.74499511719, 43.433910369873),
      model = -1700911976,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          --["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 169,
      coords = vector3(349.3137512207, -586.32598876953, 43.433910369873),
      model = -434783486,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          --["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 170,
      coords = vector3(303.95962524414, -572.55792236328, 43.433910369873),
      model = 854291622,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 171,
      coords = vector3(307.11819458008, -569.56896972656, 43.433910369873),
      model = 854291622,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 172,
      coords = vector3(-793.77630615234, -217.07330322266, 37.247722625732),
      model = -1687047623,
      lock = true,
      desc = "fastlane",
      main = true,
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 173,
      coords = vector3(-770.62261962891, -240.0270690918, 37.545078277588),
      model = 1501451068,
      lock = true,
      desc = "fastlane",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 174,
      coords = vector3(-765.61291503906, -237.96246337891, 37.55924987793),
      model = 1501451068,
      lock = true,
      desc = "fastlane",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 175,
      coords = vector3(-803.02227783203, -222.58409118652, 37.879753112793),
      model = 1015445881,
      lock = false,
      desc = "fastlane",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 176,
      coords = vector3(-801.96221923828, -224.52029418945, 37.879753112793),
      model = 1015445881,
      lock = false,
      desc = "fastlane",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 177,
      coords = vector3(-31.723524093628, -1101.8465576172, 26.572254180908),
      model = -2051651622,
      lock = true,
      desc = "pdm",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["pdm"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 178,
      coords = vector3(-33.80989074707, -1107.5787353516, 26.572254180908),
      model = -2051651622,
      lock = true,
      desc = "pdm",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["pdm"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 179,
      coords = vector3(-354.98828125, -135.17259216309, 42.00309753418),
      model = -550347177,
      lock = true,
      desc = "lscustomseastborneway",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 180,
      coords = vector3(-776.15911865234, -243.50129699707, 37.333881378174),
      model = 447044832,
      lock = false,
      desc = "fastlane",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 181,
      coords = vector3(-778.18548583984, -244.30130004883, 37.333881378174),
      model = 447044832,
      lock = false,
      desc = "fastlane",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 182,
      coords = vector3(303.90869140625, -596.57800292969, 43.433910369873),
      model = 854291622,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 183,
      coords = vector3(309.13372802734, -597.75146484375, 43.433910369873),
      model = 854291622,
      lock = true,
      desc = "hosp",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 184,
      coords = vector3(-1479.7586669922, 880.49291992188, 181.88272094727),
      model = 741314661,
      lock = true,
      keyFob = true,
      desc = "ParsonsGate",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = false,
      id = 185,
      coords = vector3(1004.7983398438, -115.02404022217, 74.136001586914),
      model = 1335311341,
      lock = true,
      desc = "quickfixbackgaragedoor",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = false,
      id = 186,
      coords = vector3(985.6103515625, -95.162536621094, 74.997932434082),
      model = 2271212864,
      lock = true,
      desc = "quickfixofficedoor",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 187,
      coords = vector3(1856.1257324219, 3689.6560058594, 34.41915512085),
      model = -1033001619,
      lock = true,
      desc = "sandyshorespdbreefingroomdoor",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 188,
      coords = vector3(-440.67562866211, 6008.0234375, 32.052379608154),
      model = -1765048490,
      lock = true,
      desc = "paletopdofficedoor",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 189,
      coords = vector3(1218.8403320312, -416.1416015625, 67.916000366211),
      model = 4007304890,
      lock = true,
      desc = "hoatavernfrontdoor",
      access = {
        job = {},
        business = {
          ["tavern"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 190,
      coords = vector3(1227.5942382812, -422.72311401367, 67.915786743164),
      model = 1335311341,
      lock = true,
      desc = "hoatavernbackdoor",
      access = {
        job = {},
        business = {
          ["tavern"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 191,
      coords = vector3(-1083.5445556641, -818.47357177734, 19.449235916138),
      model = -1320876379,
      lock = true,
      desc = "VpdCaptainsOffice",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 192,
      coords = vector3(-1085.8247070312, -824.80438232422, 19.449235916138),
      model = -129553421,
      lock = true,
      desc = "VpdLockerRooms",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 193,
      coords = vector3(-1091.2763671875, -823.90997314453, 19.449235916138),
      model = -129553421,
      lock = true,
      desc = "VpdDoorToCellsLeft",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 194,
      coords = vector3(-1092.8963623047, -821.87615966797, 19.449235916138),
      model = -129553421,
      lock = true,
      desc = "VpdDoorToCellsRight",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 195,
      coords = vector3(-1082.2290039062, -840.43450927734, 13.674360275269),
      model = 631614199,
      lock = true,
      desc = "VpdMainDoorToCells",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 196,
      coords = vector3(-1085.3153076172, -839.35974121094, 13.674360275269),
      model = 631614199,
      lock = true,
      desc = "VpdCell1",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 197,
      coords = vector3(-1087.857421875, -841.38446044922, 13.674360275269),
      model = 631614199,
      lock = true,
      desc = "VpdCell2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 198,
      coords = vector3(-1090.7069091797, -843.654296875, 13.674360275269),
      model = 631614199,
      lock = true,
      desc = "VpdCell3",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 199,
      coords = vector3(-1081.9772949219, -825.54351806641, 19.449197769165),
      model = 749848321,
      lock = true,
      desc = "VpdArmory",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 200,
      coords = vector3(-1072.9871826172, -850.93347167969, 5.9836754798889),
      model = -1573772550,
      lock = true,
      desc = "VpdInnerGate",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 201,
      coords = vector3(-1138.6423339844, -840.14184570312, 13.515572547913),
      model = 1286535678,
      lock = true,
      desc = "VpdOuterGarageGate",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 202,
      coords = vector3(-1063.6356201172, -880.70892333984, 6.2145581245422),
      model = -1368913668,
      lock = true,
      desc = "VpdOuterGarageGateLowerLeft",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 203,
      coords = vector3(-1053.2840576172, -874.33184814453, 6.2055821418762),
      model = -1657444801,
      lock = true,
      desc = "VpdOuterGarageGateLowerRight",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 204,
      coords = vector3(-808.64410400391, -1212.8168945312, 7.4871892929077),
      model = 854291622,
      lock = true,
      desc = "VespHospitalLaboratory",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 205,
      coords = vector3(-804.65802001953, -1216.1535644531, 7.4871892929077),
      model = -434783486,
      lock = true,
      desc = "VespHospitalSurgeryLeft",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 206,
      coords = vector3(-802.68603515625, -1217.8083496094, 7.4871892929077),
      model = -1700911976,
      lock = true,
      desc = "VespHospitalSurgeryRight",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 207,
      coords = vector3(-799.89935302734, -1220.1468505859, 7.4871892929077),
      model = -434783486,
      lock = true,
      desc = "VespHospitalSurgeryLeft2",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 208,
      coords = vector3(-797.92736816406, -1221.8015136719, 7.4871892929077),
      model = -1700911976,
      lock = true,
      desc = "VespHospitalSurgeryRight2",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 209,
      coords = vector3(-795.50128173828, -1223.8370361328, 7.4871892929077),
      model = -434783486,
      lock = true,
      desc = "VespHospitalSurgeryLeft3",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 210,
      coords = vector3(-793.529296875, -1225.4916992188, 7.4871892929077),
      model = -1700911976,
      lock = true,
      desc = "VespHospitalSurgeryRight3",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 211,
      coords = vector3(-793.28173828125, -1227.4237060547, 7.4871892929077),
      model = -434783486,
      lock = true,
      desc = "VespHospitalWardBLeft",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 212,
      coords = vector3(-794.93640136719, -1229.3956298828, 7.4871892929077),
      model = -1700911976,
      lock = true,
      desc = "VespHospitalWardBRight",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 213,
      coords = vector3(-799.28179931641, -1237.1431884766, 7.4871892929077),
      model = -434783486,
      lock = true,
      desc = "VespHospitalWardBLeft2",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 214,
      coords = vector3(-797.30987548828, -1238.7978515625, 7.4871892929077),
      model = -1700911976,
      lock = true,
      desc = "VespHospitalWardBRight2",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 215,
      coords = vector3(-784.96667480469, -1232.6845703125, 7.4871892929077),
      model = 854291622,
      lock = true,
      desc = "VespHospitalMri",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 216,
      coords = vector3(-784.54064941406, -1239.8239746094, 7.4871892929077),
      model = 854291622,
      lock = true,
      desc = "VespHospitalAdmin",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 217,
      coords = vector3(-776.31646728516, -1239.9429931641, 7.4871892929077),
      model = 854291622,
      lock = true,
      desc = "VespHospitalX-Ray",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 218,
      coords = vector3(-816.38909912109, -1239.9891357422, 7.4871892929077),
      model = 854291622,
      lock = true,
      desc = "VespHospitalStaff",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 219,
      coords = vector3(-781.20129394531, -1235.8441162109, 7.4871892929077),
      model = 854291622,
      lock = true,
      desc = "VespHospitalDiagnostics",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 220,
      coords = vector3(469.77426147461, -1014.4060058594, 26.483816146851),
      model = -692649124,
      lock = true,
      desc = "MRPDBack_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 221,
      coords = vector3(467.36862182617, -1014.4060058594, 26.483816146851),
      model = -692649124,
      lock = true,
      desc = "MRPDBack_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 222,
      coords = vector3(471.36785888672, -1007.7933959961, 26.40548324585),
      model = 149284793,
      lock = true,
      desc = "MRPDProc_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 223,
      coords = vector3(471.37582397461, -1010.1978759766, 26.40548324585),
      model = 149284793,
      lock = true,
      desc = "MRPDProc_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 224,
      coords = vector3(475.95385742188, -1006.9378051758, 26.406385421753),
      model = -288803980,
      lock = true,
      desc = "MRPDProcessing",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 225,
      coords = vector3(476.61569213867, -1008.8754272461, 26.480054855347),
      model = -53345114,
      lock = true,
      desc = "MRPDCellEnt01",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 226,
      coords = vector3(477.91259765625, -1012.188659668, 26.480054855347),
      model = -53345114,
      lock = true,
      desc = "MRPDCell01",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 227,
      coords = vector3(480.9128112793, -1012.188659668, 26.480054855347),
      model = -53345114,
      lock = true,
      desc = "MRPDCell02",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 228,
      coords = vector3(483.91271972656, -1012.188659668, 26.480054855347),
      model = -53345114,
      lock = true,
      desc = "MRPDCell03",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 229,
      coords = vector3(486.91311645508, -1012.188659668, 26.480054855347),
      model = -53345114,
      lock = true,
      desc = "MRPDCell04",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 230,
      coords = vector3(484.17642211914, -1007.734375, 26.480054855347),
      model = -53345114,
      lock = true,
      desc = "MRPDCell05",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 231,
      coords = vector3(481.00836181641, -1004.117980957, 26.480054855347),
      model = -53345114,
      lock = true,
      desc = "MRPDCellEnt02",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 232,
      coords = vector3(479.05996704102, -1003.1729736328, 26.406503677368),
      model = -288803980,
      lock = true,
      desc = "MRPDLineup",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 233,
      coords = vector3(479.66375732422, -997.90997314453, 26.406503677368),
      model = 149284793,
      lock = true,
      desc = "MRPDCellR",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 234,
      coords = vector3(482.06857299805, -997.90997314453, 26.406503677368),
      model = 149284793,
      lock = true,
      desc = "MRPDCellL",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 235,
      coords = vector3(482.67013549805, -987.57916259766, 26.40548324585),
      model = -1406685646,
      lock = true,
      desc = "MRPDInt01",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 236,
      coords = vector3(482.66943359375, -983.98681640625, 26.40548324585),
      model = -1406685646,
      lock = true,
      desc = "MRPDObs01",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 237,
      coords = vector3(482.67025756836, -995.728515625, 26.40548324585),
      model = -1406685646,
      lock = true,
      desc = "MRPDInt02",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 238,
      coords = vector3(482.669921875, -992.29913330078, 26.40548324585),
      model = -1406685646,
      lock = true,
      desc = "MRPDObs02",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 239,
      coords = vector3(478.28915405273, -997.91009521484, 26.40548324585),
      model = 149284793,
      lock = true,
      desc = "MRPDIdentify",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 240,
      coords = vector3(475.83233642578, -990.48394775391, 26.40548324585),
      model = -692649124,
      lock = true,
      desc = "MRPDEvidence",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 241,
      coords = vector3(471.37530517578, -987.43737792969, 26.40548324585),
      model = -96679321,
      lock = true,
      desc = "MRPDEIIOL_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 242,
      coords = vector3(471.37530517578, -985.03192138672, 26.40548324585),
      model = -1406685646,
      lock = true,
      desc = "MRPDEIIOL_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 243,
      coords = vector3(479.06240844727, -985.03234863281, 26.40548324585),
      model = 149284793,
      lock = true,
      desc = "MRPDIOLC_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 244,
      coords = vector3(479.06240844727, -987.43756103516, 26.40548324585),
      model = 149284793,
      lock = true,
      desc = "MRPDIOLC_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 245,
      coords = vector3(464.15905761719, -974.66558837891, 26.370704650879),
      model = 1830360419,
      lock = true,
      desc = "MRPDGarage01",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 246,
      coords = vector3(464.15655517578, -997.50927734375, 26.370704650879),
      model = 1830360419,
      lock = true,
      desc = "MRPDGarage02",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 247,
      coords = vector3(467.52221679688, -1000.5437011719, 26.40548324585),
      model = -288803980,
      lock = true,
      desc = "MRPDBackInt_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 248,
      coords = vector3(469.92736816406, -1000.5437011719, 26.40548324585),
      model = -288803980,
      lock = true,
      desc = "MRPDBackInt_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 249,
      keyFob = true,
      coords = vector3(452.3005065918, -1000.7794189453, 26.72912979126),
      model = 2130672747,
      lock = true,
      desc = "MRPDGarageExit01",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 250,
      coords = vector3(431.41192626953, -1000.7789306641, 26.726903915405),
      model = 2130672747,
      keyFob = true,
      lock = true,
      desc = "MRPDGarageExit02",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 251,
      coords = vector3(469.44061279297, -987.43768310547, 30.823192596436),
      model = -288803980,
      lock = true,
      desc = "MRPDMCD_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 252,
      coords = vector3(469.44061279297, -985.03131103516, 30.823192596436),
      model = -288803980,
      lock = true,
      desc = "MRPDMCD_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 253,
      coords = vector3(475.38369750977, -989.82470703125, 30.823192596436),
      model = -1406685646,
      lock = true,
      desc = "MRPDBriefing_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 254,
      coords = vector3(472.97769165039, -989.82470703125, 30.823192596436),
      model = -96679321,
      lock = true,
      desc = "MRPDBriefing_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 255,
      coords = vector3(476.75115966797, -999.63067626953, 30.823192596436),
      model = -1406685646,
      lock = true,
      desc = "MRPDBriefingBack",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 256,
      coords = vector3(479.75073242188, -999.62902832031, 30.789167404175),
      model = -692649124,
      lock = true,
      desc = "MRPDArmory01",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 257,
      coords = vector3(487.43783569336, -1000.1892700195, 30.786972045898),
      model = -692649124,
      lock = true,
      desc = "MRPDArmory02",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 258,
      coords = vector3(485.61334228516, -1002.9019775391, 30.786972045898),
      model = -692649124,
      lock = true,
      desc = "MRPDShootRange_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 259,
      coords = vector3(488.01843261719, -1002.9019775391, 30.786972045898),
      model = -692649124,
      lock = true,
      desc = "MRPDShootRange_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 260,
      coords = vector3(452.26626586914, -995.525390625, 30.823192596436),
      model = -96679321,
      lock = true,
      desc = "MRPDArchives",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 261,
      coords = vector3(458.08941650391, -995.52465820312, 30.823192596436),
      model = 149284793,
      lock = true,
      desc = "MRPDLockers",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 262,
      coords = vector3(443.06176757812, -998.74621582031, 30.81530380249),
      model = -1547307588,
      lock = true,
      desc = "MRPDSideDoor_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 263,
      coords = vector3(440.73919677734, -998.74621582031, 30.81530380249),
      model = -1547307588,
      lock = true,
      desc = "MRPDSideDoor_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 264,
      coords = vector3(440.52008056641, -977.60107421875, 30.823192596436),
      model = -1406685646,
      lock = true,
      desc = "MRPDLobby_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 265,
      coords = vector3(440.52008056641, -986.23345947266, 30.823192596436),
      model = -96679321,
      lock = true,
      desc = "MRPDLobby_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 266,
      coords = vector3(455.88616943359, -972.25427246094, 30.815307617188),
      model = -1547307588,
      lock = true,
      desc = "MRPDStreetSideDoor_R",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 267,
      coords = vector3(458.20874023438, -972.25427246094, 30.815307617188),
      model = -1547307588,
      lock = true,
      desc = "MRPDStreetSideDoor_L",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 268,
      coords = vector3(458.65432739258, -990.64978027344, 30.823192596436),
      model = -96679321,
      lock = true,
      desc = "MRPDCaptain",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 269,
      coords = vector3(448.98455810547, -995.5263671875, 35.103763580322),
      model = -96679321,
      lock = true,
      desc = "MRPDDispatch",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 270,
      coords = vector3(448.98681640625, -990.20074462891, 35.103763580322),
      model = -1406685646,
      lock = true,
      desc = "MRPDTraining",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 271,
      coords = vector3(464.30856323242, -984.52844238281, 43.771240234375),
      model = -692649124,
      lock = true,
      desc = "MRPDRoof",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      keyFob = true,
      id = 272,
      coords = vector3(488.89410400391, -1017.1262817383, 27.148464202881),
      model = -1603817716,
      lock = true,
      desc = "MRPDBackGate",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    -- bobcat
    {
      info = "bobcat front door 1",
      active = true,
      id = 273,
      coords = vector3(880.8951, -2258.308, 30.45758),
      model = -1563799200,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "bobcat front door 2",
      active = true,
      id = 274,
      coords = vector3(883.4803, -2258.53, 30.45758),
      model = -1259801187,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "bobcat first inner door",
      active = true,
      id = 275,
      coords = vector3(881.6171, -2264.669, 30.5143),
      model = -551608542,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "bobcat armed inner door 1",
      active = true,
      id = 276,
      coords = vector3(880.0298, -2268.182, 30.5143),
      model = 933053701,
      lock = true,
      desc = "",
      access = {
        job = {
          -- ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "bobcat armed inner door 2",
      active = true,
      id = 277,
      coords = vector3(882.6199, -2268.408, 30.5143),
      model = 933053701,
      lock = true,
      desc = "",
      access = {
        job = {
          -- ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    -- vault
    {
      info = "lower vault main door 1",
      active = true,
      id = 278,
      coords = vector3(273.1413, 230.5395, 96.68304),
      model = -1887114592,
      lock = true,
      desc = "",
      access = {
        job = {
          -- ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "lower vault main door 2",
      active = true,
      id = 279,
      coords = vector3(272.255, 228.0946, 96.68304),
      model = -1887114592,
      lock = true,
      desc = "",
      access = {
        job = {
          -- ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "lower vault inside slide door 1",
      active = true,
      id = 280,
      coords = vector3(294.5411, 208.0697, 96.68283),
      model = -219532439,
      lock = true,
      desc = "",
      access = {
        job = {
          --["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "lower vault inside slide door 2",
      active = true,
      id = 281,
      coords = vector3(311.2454, 214.1708, 96.68283),
      model = -219532439,
      lock = true,
      desc = "",
      access = {
        job = {
          --["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "lower vault inside slide door 3",
      active = true,
      id = 282,
      coords = vector3(303.1045, 231.6025, 96.68283),
      model = -219532439,
      lock = true,
      desc = "",
      access = {
        job = {
          --["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "sandy pd, meeting room",
      active = true,
      id = 283,
      coords = vector3(1856.1257324219, 3689.6560058594, 34.41915512085),
      model = -1033001619,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "sandy pd, to cells",
      active = true,
      id = 284,
      coords = vector3(1849.9676513672, 3684.1044921875, 34.421806335449),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "sandy pd, to cells",
      active = true,
      id = 285,
      coords = vector3(1851.2883300781, 3681.8684082031, 34.420181274414),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "sandy pd, to office",
      active = true,
      id = 286,
      coords = vector3(1847.1575927734, 3689.8916015625, 34.41915512085),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "sandy pd, to office",
      active = true,
      id = 287,
      coords = vector3(1849.4094238281, 3691.1882324219, 34.41915512085),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "paleto pd, to office",
      active = true,
      id = 288,
      coords = vector3(-440.98745727539, 6012.7646484375, 31.866329193115),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "paleto pd, to office",
      active = true,
      id = 289,
      coords = vector3(-442.82684326172, 6010.9252929688, 31.866329193115),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "paleto pd, to locker",
      active = true,
      id = 290,
      coords = vector3(-450.71597290039, 6016.3696289062, 31.866329193115),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "bean machine",
      active = false,
      id = 291,
      coords = vector3(-629.7998, 228.9898, 82.0489),
      model = 736699661,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "court house holding entry",
      active = true,
      id = 292,
      coords = vector3(-510.8223, -203.0728, 34.4023),
      model = -519068795,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "court house holding cell 1",
      active = true,
      id = 293,
      coords = vector3(-516.2435, -201.4633, 34.40555),
      model = 631614199,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "court house holding cell 2",
      active = true,
      id = 294,
      coords = vector3(-514.1594, -205.0734, 34.40555),
      model = 631614199,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "court house outside door 1",
      active = true,
      id = 295,
      coords = vector3(-506.0826, -200.8349, 34.40414),
      model = 605731446,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "court house outside door 2",
      active = true,
      id = 296,
      coords = vector3(-507.1621, -198.9598, 34.40414),
      model = 605731446,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "court house outside ladder",
      active = true,
      id = 297,
      coords = vector3(-527.4601, -166.2868, 46.459111),
      model = 693714950,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "court house outside ladder",
      active = true,
      id = 298,
      coords = vector3(-538.4393, -171.6742, 46.459111),
      model = 693714950,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "secrex big",
      active = true,
      id = 299,
      coords = vector3(2527.992, 2622.527, 39.33549),
      model = -190780785,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        cid = {
          [1007] = true,
        },
        job = {},
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "secrex small",
      active = true,
      id = 300,
      coords = vector3(2527.981, 2626.549, 38.10261),
      model = -664582244,
      lock = true,
      desc = "",
      access = {
        cid = {
          [1007] = true,
        },
        job = {},
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "pr",
      active = true,
      id = 301,
      coords = vector3(387.7515, 792.8711, 187.8491),
      model = -117185009,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "pr",
      active = true,
      id = 302,
      coords = vector3(388.6313, 799.6823, 187.8263),
      model = -117185009,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "prc",
      active = true,
      id = 303,
      coords = vector3(378.1726, 796.8284, 187.6123),
      model = 517369125,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "prc",
      active = true,
      id = 304,
      coords = vector3(381.6628, 796.8287, 187.6117),
      model = 517369125,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "pr",
      active = true,
      id = 305,
      coords = vector3(380.2174, 792.7883, 190.6414),
      model = -117185009,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "mineshaft",
      active = true,
      id = 306,
      coords = vector3(972.4699, 2733.931, 30.2),
      model = 237621997,
      lock = true,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "mineshaft",
      active = true,
      id = 307,
      coords = vector3(974.8727, 2734.315, 30.2143),
      model = 237621997,
      lock = true,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "methlab",
      active = true,
      id = 308,
      coords = vector3(228.8063, -790.5078, 21.32163),
      model = 362975687,
      lock = true,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
    },
    {
      info = "jewelry store inner",
      active = true,
      id = 309,
      coords = vector3(-629.13385009766, -230.15170288086, 38.20658493042),
      model = 1335309163,
      lock = true,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
    },
    {
      info = "vault outer backdoor 1",
      active = true,
      id = 310,
      coords = vector3(258.20220947266, 204.10057067871, 106.4048538208),
      model = 110411286,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = true,
    },
    {
      info = "vault outer backdoor 2",
      active = true,
      id = 311,
      coords = vector3(260.64321899414, 203.20527648926, 106.4048538208),
      model = 110411286,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = true,
    },
    {
      info = "vault outer front door 1",
      active = true,
      id = 312,
      coords = vector3(231.51234436035, 216.51770019531, 106.40486907959),
      model = 110411286,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = true,
    },
    {
      info = "vault outer front door 2",
      active = true,
      id = 313,
      coords = vector3(232.60537719727, 214.1584777832, 106.40487670898),
      model = 110411286,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = true,
    },
    {
      info = "",
      active = true,
      id = 314,
      keyFob = true,
      coords = vector3(410.02578735352, -1024.2199707031, 29.220199584961),
      model = -1635161509,
      lock = true,
      automatic = {
        distance = 10.0,
        rate = 1.0
      },
      desc = "MRPDBollard01",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 315,
      keyFob = true,
      coords = vector3(410.02578735352, -1024.2259521484, 29.220220565796),
      model = -1868050792,
      lock = true,
      automatic = {
        distance = 10.0,
        rate = 1.0
      },
      desc = "MRPDBollard02",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "gov building east of highway",
      active = true,
      id = 316,
      keyFob = true,
      coords = vector3(2569.2211914062, -325.56640625, 94.123634338379),
      model = -43433986,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "gov building east of highway",
      active = true,
      id = 317,
      keyFob = true,
      coords = vector3(2559.6140136719, -325.55575561523, 94.123634338379),
      model = -43433986,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "gov building east of highway",
      active = true,
      id = 318,
      keyFob = true,
      coords = vector3(2491.8854980469, -303.48767089844, 91.990074157715),
      model = 569833973,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "impound east street gate",
      active = true,
      id = 319,
      keyFob = true,
      coords = vector3(-171.6424407959, -1160.6770019531, 22.635126113892),
      model = 1286535678,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
          ["impound"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "impound west street gate",
      active = true,
      id = 320,
      keyFob = true,
      coords = vector3(-232.58993530273, -1158.8249511719, 22.091827392578),
      model = 1286535678,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
          ["impound"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "impound west inner gate",
      active = true,
      id = 321,
      keyFob = true,
      coords = vector3(-226.14630126953, -1168.8063964844, 22.080400466919),
      model = 1286535678,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
          ["impound"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "impound east inner gate",
      active = true,
      id = 322,
      keyFob = true,
      coords = vector3(-156.90669250488, -1169.6063232422, 22.086107254028),
      model = 1286535678,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
          ["impound"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "impound office",
      active = true,
      id = 323,
      keyFob = false,
      coords = vector3(-187.06140136719, -1162.3486328125, 23.821239471436),
      model = -952356348,
      lock = true,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
          ["impound"] = true
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "impound backdoor",
      active = true,
      id = 324,
      keyFob = false,
      coords = vector3(-189.63600158691, -1167.8836669922, 23.821239471436),
      model = 97297972,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
          ["impound"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "lower vault inside slide door entry",
      active = true,
      id = 325,
      coords = vector3(288.209, 222.5047, 96.68108),
      model = -219532439,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "pillbox lower entry reception door",
      active = true,
      id = 326,
      coords = vector3(348.54669189453, -585.15844726562, 28.947092056274),
      model = 854291622,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "pillbox lower entry garage door left",
      active = true,
      id = 327,
      coords = vector3(338.44665527344, -590.05297851562, 28.947092056274),
      model = -434783486,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "pillbox lower entry garage door right",
      active = true,
      id = 328,
      coords = vector3(339.32659912109, -587.63452148438, 28.947092056274),
      model = -1700911976,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "pillbox garage gate left",
      active = true,
      keyFob = true,
      id = 329,
      coords = vector3(337.27212524414, -564.44732666016, 30.634208679199),
      model = -820650556,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "pillbox garage gate right",
      active = true,
      keyFob = true,
      id = 330,
      coords = vector3(330.04742431641, -562.07354736328, 31.129365921021),
      model = -820650556,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "pillbox garage backdoor right",
      active = true,
      id = 331,
      coords = vector3(321.01483154297, -559.91271972656, 28.947238922119),
      model = -1421582160,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "pillbox garage backdoor right",
      active = true,
      id = 332,
      coords = vector3(318.66561889648, -561.00860595703, 28.947238922119),
      model = 1248599813,
      lock = true,
      desc = "hospital",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "methlab_op",
      active = true,
      id = 333,
      coords = vector3(1071.311, -2316.445, 22.54868),
      model = 362975687,
      lock = true,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "methlab_ss",
      active = true,
      id = 334,
      coords = vector3(371.3661, 3564.562, 25.6122),
      model = 362975687,
      lock = true,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "methlab_bb",
      active = true,
      id = 335,
      coords = vector3(2298.077, 4851.159, 34.13586),
      model = 362975687,
      lock = true,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "tunershop",
      active = true,
      id = 336,
      coords = vector3(945.9179, -985.0026, 43.34682),
      model = -823173123,
      lock = true,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
    },
    {
      info = "gallery showroom 1",
      active = true,
      id = 337,
      coords = vector3(-491.35897827148, 28.952125549316, 46.5758934021),
      model = 1709680887,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery showroom 2",
      active = true,
      id = 338,
      coords = vector3(-488.96105957031, 28.74153137207, 46.5758934021),
      model = -752680088,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery main 1",
      active = true,
      id = 339,
      coords = vector3(-426.07656860352, 23.748023986816, 46.523895263672),
      model = -1663450520,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery main 1",
      active = true,
      id = 340,
      coords = vector3(-423.59674072266, 23.533863067627, 46.523220062256),
      model = -1854854241,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery main 1",
      active = true,
      id = 341,
      coords = vector3(-438.99099731445, 40.008834838867, 53.064792633057),
      model = -1663450520,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery main 1",
      active = true,
      id = 342,
      coords = vector3(-441.46917724609, 40.223148345947, 53.064792633057),
      model = -1854854241,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery showroom garage door",
      active = true,
      id = 343,
      coords = vector3(-491.20520019531, 51.213733673096, 53.231643676758),
      model = -429115342,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery main 1",
      active = true,
      id = 344,
      coords = vector3(-478.33380126953, 54.553005218506, 52.554546356201),
      model = -1204133321,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery main 1",
      active = true,
      id = 345,
      coords = vector3(-470.62832641602, 51.051769256592, 52.555488586426),
      model = -1193319547,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery main 1",
      active = true,
      id = 346,
      coords = vector3(-440.6862487793, 50.442222595215, 53.065963745117),
      model = 1967988229,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery main 1",
      active = true,
      id = 347,
      coords = vector3(-440.47055053711, 52.913578033447, 53.065402984619),
      model = 1566764593,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery main 1",
      active = true,
      id = 348,
      coords = vector3(-456.15530395508, 43.424518585205, 46.393482208252),
      model = -2066395222,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery main 1",
      active = true,
      id = 349,
      coords = vector3(-465.36431884766, 29.296127319336, 46.833976745605),
      model = -2066395222,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery warehouse 1",
      active = true,
      id = 350,
      coords = vector3(-460.75750732422, -47.077758789062, 46.886547088623),
      model = -901044889,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery warehouse 2",
      active = true,
      id = 351,
      coords = vector3(-449.26681518555, -48.022987365723, 44.663257598877),
      model = -1795835524,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "gallery warehouse 3",
      active = true,
      id = 352,
      coords = vector3(-454.50430297852, -47.630306243896, 46.384452819824),
      model = -901044889,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["gallery"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino entrance left 1",
      active = true,
      id = 353,
      coords = vector3(927.7387, 49.60353, 81.54192),
      model = 21324050,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
          ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino entrance left 2",
      active = true,
      id = 354,
      coords = vector3(926.4083, 47.47442, 81.54192),
      model = 558771340,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
          ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino middle  1",
      active = true,
      id = 355,
      coords = vector3(926.2393, 47.21412, 81.54192),
      model = 21324050,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
          ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino middle  2",
      active = true,
      id = 356,
      coords = vector3(924.9089, 45.085, 81.54192),
      model = 558771340,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
          ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino right  1",
      active = true,
      id = 357,
      coords = vector3(924.75, 44.83086, 81.54192),
      model = 21324050,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
          ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino right  2",
      active = true,
      id = 358,
      coords = vector3(923.4196, 42.70175, 81.54192),
      model = 558771340,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
          ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino MANAGE DOOR LEFT",
      active = true,
      id = 359,
      coords = vector3(1122.351, 265.5158, -50.89093),
      model = 680601509,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino MANAGE DOOR RIGHT",
      active = true,
      id = 360,
      coords = vector3(1122.351, 263.5161, -50.89093),
      model = 680601509,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot kitchen door",
      active = true,
      id = 361,
      coords = vector3(-1201.11, -892.96, 14.24),
      model = -1448591934,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
            ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot back door",
      active = true,
      id = 362,
      coords = vector3(-1199.35, -903.87, 14.0),
      model = -1300743830,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
            ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lostmc door",
      active = true,
      keyFob = true,
      id = 363,
      coords = vector3(107.3448, 3620.268, 41.25948),
      model = -822900180,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["lostmc"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot front right",
      active = true,
      id = 364,
      coords = vector3(-1184.902, -883.29, 14.24),
      model = -186646702,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
            ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot front left",
      active = true,
      id = 365,
      coords = vector3(-1183.22, -885.78, 14.24),
      model = 1934064671,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
            ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot side left",
      active = true,
      id = 366,
      coords = vector3(-1196.54, -883.48, 14.24),
      model = 1934064671,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
            ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot side right",
      active = true,
      id = 367,
      coords = vector3(-1199.0, -885.17, 14.24),
      model = -186646702,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
            ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot drive thru window",
      active = true,
      id = 368,
      coords = vector3(-1193.2, -906.83, 13.0),
      model = -1518705307,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
            ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "hayes door 1",
      active = true,
      id = 369,
      coords = vector3(-1414.869, -436.3675, 34.90352),
      model = `denis3d_hayes_auto_shuttergate`,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
            ["hayes_autos"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "hayes door 2",
      active = true,
      id = 370,
      coords = vector3(-1421.118, -440.2721, 34.90352),
      model = `denis3d_hayes_auto_shuttergate`,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
            ["hayes_autos"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "hayes door 3",
      active = true,
      id = 371,
      coords = vector3(-1427.326, -444.1516, 34.90352),
      model = `denis3d_hayes_auto_shuttergate`,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
            ["hayes_autos"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "digital den front door",
      active = true,
      id = 372,
      coords = vector3(1136.8, -470.7, 66.48),
      model = 1181020301,
      lock = false, --locked while shop is "closed"
      desc = "",
      access = {
        job = {},
        business = {
            ["digital_den"] = true,
        },
      },
      forceUnlocked = true,
    },
    {
      info = "digital den secret door 1",
      active = true,
      id = 373,
      coords = vector3(1136.5, -467.64, 66.48),
      model = 547719377,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
            ["digital_den"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "digital den secret door 2",
      active = true,
      id = 374,
      coords = vector3(1135, -463.85, 66.48),
      model = -1577379202,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
            ["digital_den"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "digital den secret door 3",
      active = true,
      id = 375,
      coords = vector3(1136, -464.25, 66.48),
      model = -1577379202,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
            ["digital_den"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "digital den back door",
      active = true,
      id = 376,
      coords = vector3(1129.3, -463.9, 66.48),
      model = -1565285813,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
            ["digital_den"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino gate door 1",
      active = true,
      id = 377,
      coords = vector3(1119.551, 236.208, -50.23451),
      model = -389557955,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
            ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino gate door 2",
      active = true,
      id = 378,
      coords = vector3(1118.235, 237.52, -50.23451),
      model = -389557955,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
            ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "VU front door",
      active = true,
      id = 379,
      coords = vector3(127.9501, -1298.507, 29.41962),
      model = -1116041313,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["vanilla_unicorn"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "VU bac door",
      active = true,
      id = 380,
      coords = vector3(96.09197, -1284.854, 29.43878),
      model = 1695461688,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["vanilla_unicorn"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "Rooster Hidden Door",
      active = true,
      id = 381,
      coords = vector3(-173.6,313.78,93.76),
      model = 1944861230,
      lock = true,
      desc = "roostercabbasementhidden",
      access = {
        cid = {
          [1391] = true, -- lang buddha
        },
        job = {},
        business = {},
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "wuchang front door",
      active = true,
      id = 382,
      coords = vector3(-826.4025, -695.8148, 28.49083),
      model = 2001816392,
      lock = true,
      desc = "wuchang front door",
      access = {
        job = {},
        business = {
          ["wuchang"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "wuchang front door",
      active = true,
      id = 383,
      coords = vector3(-826.4025, -697.9944, 28.49083),
      model = 2001816392,
      lock = true,
      desc = "wuchang front door",
      access = {
        job = {},
        business = {
          ["wuchang"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "wuchang front door",
      active = true,
      id = 384,
      coords = vector3(-826.4025, -698.7478, 28.49083),
      model = 2001816392,
      lock = true,
      desc = "wuchang front door",
      access = {
        job = {},
        business = {
          ["wuchang"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "wuchang front door",
      active = true,
      id = 385,
      coords = vector3(-826.4025, -700.9301, 28.49083),
      model = 2001816392,
      lock = true,
      desc = "wuchang front door",
      access = {
        job = {},
        business = {
          ["wuchang"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "wuchang garage door",
      active = true,
      id = 386,
      coords = vector3(-816.2236, -740.1801, 24.24792),
      model = -700626879,
      lock = true,
      keyFob = true,
      desc = "wuchang garage door",
      access = {
        job = {},
        business = {
          ["wuchang"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "wuchang ceo",
      active = true,
      id = 387,
      coords = vector3(-822.0345, -703.1276, 32.48665),
      model = 693644064,
      lock = true,
      desc = "wuchang ceo door",
      access = {
        job = {},
        business = {
          ["wuchang"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino inside track left",
      active = true,
      id = 388,
      coords = vector3(1117.051, 258.411, -50.29099),
      model = 680601509,
      lock = false,
      desc = "casino inside track left",
      access = {
        job = {},
        business = {
          ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casino inside track right",
      active = true,
      id = 389,
      coords = vector3(1115.637, 256.997, -50.29099),
      model = 680601509,
      lock = false,
      desc = "casino inside track right",
      access = {
        job = {},
        business = {
          ["casino"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "wuchangstoreroom",
      active = true,
      id = 390,
      coords = vector3(-823.1431, -711.9124, 23.92465),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["wuchang"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "wuchangstoreroom",
      active = true,
      id = 391,
      coords = vector3(-820.6585, -715.6949, 23.93994),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["wuchang"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "yogadoor1",
      active = true,
      id = 392,
      coords = vector3(1157.34, -452.78, 67.05),
      model = -1666470363,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["happy_yoga"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "yogadoor2",
      active = true,
      id = 393,
      coords = vector3(1164.62, -454.83, 67.05),
      model = -1666470363,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["happy_yoga"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "yogadoor3",
      active = true,
      id = 394,
      coords = vector3(1158.73, -447.94, 67.08),
      model = 1743859485,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["happy_yoga"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "casinohidden",
      active = true,
      id = 395,
      coords = vector3(969.6023, 47.0294, 116.2636),
      model = -242110718,
      lock = true,
      desc = "",
      access = {
        cid = {
          [3503] = true,
        },
        job = {},
        business = {
          ["creampie"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "nudist camp doors",
      active = true,
      id = 396,
      coords = vector3(-1044.749, 4914.972, 209.953),
      model = -1578791031,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["roosterranch"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "nudist camp doors",
      active = true,
      id = 397,
      coords = vector3(-1041.233, 4906.101, 209.96),
      model = -13153749,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["roosterranch"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "blazin tattoos",
      active = true,
      id = 398,
      coords = vector3(321.8085, 178.3599, 103.6782),
      model = 543652229,
      lock = false,
      desc = "",
      access = {
        job = {},
        business = {
          ["btat"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "blazin tattoos",
      active = true,
      id = 399,
      coords = vector3(320.5102, 184.7164, 103.7365),
      model = 1243635233,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["btat"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "mayor office",
      active = true,
      id = 400,
      coords = vector3(-566.0358, -200.24, 38.34),
      model = 110411286,
      lock = false,
      desc = "",
      access = {
        job = {
          ["GOV"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "lfb front",
      active = true,
      id = 401,
      coords = vector3(1395.92, 1140.705, 114.7902),
      model = 262671971,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot employee door",
      active = true,
      id = 402,
      coords = vector3(-1179.221, -891.50, 14.0),
      model = -1300743830,
      lock = true,
      desc = "",
      access = {
        job = { },
        business = {
          ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb front",
      active = true,
      id = 403,
      coords = vector3(1395.92, 1142.90, 114.8),
      model = 1504256620,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot employee door kitchen",
      active = true,
      id = 404,
      coords = vector3(-1193.9, -900.4, 14.24),
      model = -1448591934,
      lock = true,
      desc = "",
      access = {
        job = { },
        business = {
          ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb front left",
      active = true,
      id = 405,
      coords = vector3(1395.828, 1153.858, 114.4834),
      model = -1032171637,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb front left",
      active = true,
      id = 406,
      coords = vector3(1395.828, 1151.659, 114.4834),
      model = -52575179,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb front far left",
      active = true,
      id = 407,
      coords = vector3(1390.478, 1163.438, 114.4832),
      model = -1032171637,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb front far left",
      active = true,
      id = 408,
      coords = vector3(1390.478, 1161.238, 114.4832),
      model = -52575179,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb front right",
      active = true,
      id = 409,
      coords = vector3(1390.666, 1133.317, 114.4808),
      model = -52575179,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb front right",
      active = true,
      id = 410,
      coords = vector3(1390.666, 1131.117, 114.4808),
      model = -1032171637,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb right",
      active = true,
      id = 411,
      coords = vector3(1398.289, 1128.314, 114.4836),
      model = -52575179,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb right",
      active = true,
      id = 412,
      coords = vector3(1400.489, 1128.314, 114.4836),
      model = -1032171637,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb right",
      active = true,
      id = 413,
      coords = vector3(1400.488, 1128.314, 114.4836),
      model = -52575179,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb right",
      active = true,
      id = 414,
      coords = vector3(1402.688, 1128.314, 114.4836),
      model = -1032171637,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb back",
      active = true,
      id = 415,
      coords = vector3(1409.292, 1144.054, 114.4869),
      model = -1032171637,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb back",
      active = true,
      id = 416,
      coords = vector3(1409.292, 1146.254, 114.4869),
      model = -52575179,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb back",
      active = true,
      id = 417,
      coords = vector3(1409.292, 1146.254, 114.4869),
      model = -1032171637,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb back",
      active = true,
      id = 418,
      coords = vector3(1409.292, 1148.454, 114.4869),
      model = -52575179,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb back",
      active = true,
      id = 419,
      coords = vector3(1409.292, 1148.454, 114.4869),
      model = -1032171637,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb back",
      active = true,
      id = 420,
      coords = vector3(1409.292, 1150.654, 114.4869),
      model = -52575179,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb back right",
      active = true,
      id = 421,
      coords = vector3(1408.581, 1161.165, 114.4833),
      model = -1032171637,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb back right",
      active = true,
      id = 422,
      coords = vector3(1408.581, 1158.965, 114.4833),
      model = -52575179,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb back far right",
      active = true,
      id = 423,
      coords = vector3(1408.581, 1165.834, 114.4833),
      model = -1032171637,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "lfb back far right",
      active = true,
      id = 424,
      coords = vector3(1408.581, 1163.634, 114.4833),
      model = -52575179,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["le_fuente_blanca"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "Otto's back door",
      active = true,
      id = 425,
      coords = vector3(835.07501220703, -816.44854736328, 26.672168731689),
      model = 2142711795,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ottos_auto"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "Otto's side door",
      active = true,
      id = 426,
      coords = vector3(824.87268066406, -820.35577392578, 26.623023986816),
      model = 2142711795,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ottos_auto"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "Otto's garage door",
      active = true,
      id = 427,
      coords = vector3(825.89849853516, -825.54052734375, 29.298183441162),
      model = 750116887,
      lock = true,
      desc = "",
      keyFob = true,
      access = {
        job = {},
        business = {
          ["ottos_auto"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot boss door",
      active = true,
      id = 428,
      coords = vector3(-1182.1, -895.5, 14.1),
      model = 1042741067,
      lock = true,
      desc = "",
      access = {
        job = { },
        business = {
          ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot pier door",
      active = true,
      id = 429,
      coords = vector3(-1680.79, -1095.9, 13.3),
      model = -1300743830,
      lock = true,
      desc = "",
      access = {
        job = { },
        business = {
          ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "burgershot pier window",
      active = true,
      id = 430,
      coords = vector3(-1687.12, -1091.7, 12.2),
      model = -1518705307,
      lock = true,
      desc = "",
      access = {
        job = { },
        business = {
          ["burger_shot"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "methlab_ja", --jazz
      active = true,
      id = 431,
      coords = vector3(50.23402, -2689.355, -1.678635),
      model = 362975687,
      lock = false,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "methlab_mt", -- megatron
      active = true,
      id = 432,
      coords = vector3(2451.212, 1578.782, 25.04652),
      model = 362975687,
      lock = false,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "methlab_bc", -- bonecrusher
      active = true,
      id = 433,
      coords = vector3(182.3292, 2432.331, 51.04614),
      model = 362975687,
      lock = false,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "gallery cg warehouse door",
      active = true,
      id = 434,
      coords = vector3(-445.0654, -26.46161, 44.72485),
      model = 1221385821,
      lock = true,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "wuchang doors",
      active = true,
      id = 435,
      coords = vector3(-819.4991, -711.9124, 28.2056),
      model = 693644064,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["wuchang"] = true,
        },
      },
      forceUnlocked = false,
      hidden = true,
    },
    {
      info = "prison_kitchen",
      active = true,
      id = 436,
      coords = vector3(1789.201, 2558.44, 45.82531),
      model = -1033001619,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "prison_garden1",
      active = true,
      id = 437,
      coords = vector3(1697.409, 2541.411, 46.26889),
      model = -1156020871,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "prison_garden2",
      active = true,
      id = 438,
      coords = vector3(1697.409, 2544.789, 46.26889),
      model = -1156020871,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "prison_gym",
      active = true,
      id = 439,
      coords = vector3(1771.956, 2493.91, 45.97048),
      model = -1437850419,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "prison_showers",
      active = true,
      id = 440,
      coords = vector3(1738.991, 2492.181, 45.97176),
      model = -1033001619,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "prison_scrap",
      active = true,
      id = 441,
      coords = vector3(1640.017, 2538.436, 46.28986),
      model = -1156020871,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "prison_scrap",
      active = true,
      id = 442,
      coords = vector3(1642.188, 2541.023, 46.28986),
      model = -1156020871,
      lock = false,
      desc = "",
      access = {
        job = {
          ["PD"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "bobcat surevilence",
      active = true,
      id = 443,
      coords = vector3(882.3375, -2295.273, 30.61766),
      model = -311575617,
      lock = true,
      desc = "",
      access = {
        job = {},
      },
      forceUnlocked = false,
    },
    {
      info = "waynes green beans",
      active = true,
      id = 444,
      coords = vector3(1330.11,4382.85,44.25),
      model = 227019171,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["green_beans"] = true
        }
      },
      forceUnlocked = false,
    },
    {
      info = "lsbb office left entrance",
      active = true,
      id = 445,
      coords = vector3(-894.543,-442.47,141.17),
      model = 220394186,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["lsbb"] = true
        }
      }
    },
    {
      info = "lsbb office right entrance",
      active = true,
      id = 446,
      coords = vector3(-894.27,-442.99,142.36),
      model = 220394186,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["lsbb"] = true
        }
      }
    },
    {
      info = "bob mulet main right door",
      active = true,
      id = 447,
      coords = vector3(-823.1,-187.82,37.57),
      model = 145369505,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["bobby_brown"] = true
        }
      }
    },
    {
      info = "bob mulet main left door",
      active = true,
      id = 448,
      coords = vector3(-822.7,-187.01,37.57),
      model = -1663512092,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["bobby_brown"] = true
        }
      }
    },
    {
      info = "split sides comedy club front left door",
      active = true,
      id = 449,
      coords = vector3(-430.74,262.75,83.02),
      model = 2059227086,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["split_sides"] = true
        }
      }
    },
    {
      info = "split sides comedy club front right door",
      active = true,
      id = 450,
      coords = vector3(-429.23,262.61,83.02),
      model = 1417577297,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["split_sides"] = true
        }
      }
    },
    {
      info = "sionis backdoor",
      active = true,
      id = 451,
      coords = vector3(1065.237, -2006.079, 32.23295),
      model = -1428622127,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["sionis"] = true
          }
      }
    },
    {
      info = "sionis frontdoor",
      active = true,
      id = 452,
      coords = vector3(1083.547, -1975.435, 31.62222),
      model = -1428622127,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["sionis"] = true
          }
      }
    },
    {
      info = "hayes staff door",
      active = true,
      id = 453,
      coords = vector3(-1427.525, -455.6805, 36.05956),
      model = 1289778077,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["hayes_autos"] = true
          }
      }
    },
    {
      info = "harmony repairs right gate",
      active = true,
      id = 454,
      coords = vector3(1176.224, 2645.41, 40.39615),
      model = -822900180,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["harmony_repairs"] = true
          }
      }
    },
    {
      info = "harmony repairs left gate",
      active = true,
      id = 455,
      coords = vector3(1182.307, 2644.167, 40.50731),
      model = -822900180,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["harmony_repairs"] = true
          }
      }
    },
    {
      info = "harmony repairs door",
      active = true,
      id = 456,
      coords = vector3(1187.203, 2644.95, 38.55177),
      model = 1335311341,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["harmony_repairs"] = true
          }
      }
    },
    {
      info = "sionis top door",
      active = true,
      id = 457,
      coords = vector3(1085.242, -2018.58, 41.66173),
      model = -1428622127,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["sionis"] = true
          }
      }
    },
    {
      info = "lsbb lost storage gate",
      active = true,
      id = 458,
      coords = vector3(838.3782, -2882.322, 11.66133),
      model = -2125774984,
      lock = true,
      desc = "lsbb lost storage gate forceopen",
      access = {
          job = {
              ["PD"] = true
          },
          business = {
              ["lsbb"] = true
          }
      }
    },
    {
      info = "lean house saab door",
      active = true,
      id = 459,
      coords = vector3(-1801.696, 435.0674, 132.4441),
      model = 1042741067,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house tony door",
      active = true,
      id = 460,
      coords = vector3(-1794.633, 436.414, 132.4413),
      model = 1042741067,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house buddha door",
      active = true,
      id = 461,
      coords = vector3(-1794.48, 428.2709, 133.1517),
      model = -1255706107,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house hidden door 2nd floor",
      active = true,
      id = 462,
      coords = vector3(-1799.852, 437.2056, 132.4011),
      model = -2133308674,
      lock = true,
      hidden = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house hidden door den",
      active = true,
      id = 463,
      coords = vector3(-1797.073, 441.1661, 129.0888),
      model = 655398764,
      lock = true,
      hidden = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house front door",
      active = true,
      id = 464,
      coords = vector3(-1805.098, 436.0744, 129.2558),
      model = -1527723153,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house back door",
      active = true,
      id = 465,
      coords = vector3(-1804.114, 429.082, 128.9164),
      model = -1527723153,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house front gate right",
      active = true,
      id = 466,
      coords = vector3(-1801.342, 474.8882, 134.5201),
      model = -1249591818,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house front gate left",
      active = true,
      id = 467,
      coords = vector3(-1799.039, 470.6359, 133.9505),
      model = 546378757,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house front gate side door",
      active = true,
      id = 468,
      coords = vector3(-1798.231, 468.8248, 133.7756),
      model = 724862427,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house balcony door 2nd floor",
      active = true,
      id = 469,
      coords = vector3(-1816.872, 428.6213, 132.5938),
      model = 656216807,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "Lean house discrete office exit door",
      active = true,
      id = 470,
      coords = vector3(-1813.318, 446.4231, 128.7794),
      model = -524036376,
      hidden = true,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house buddha balcony door",
      active = true,
      id = 471,
      coords = vector3(-1791.517, 419.0124, 132.5361),
      model = 2060651272,
      hidden = true,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house bottom walkway door",
      active = true,
      id = 472,
      coords = vector3(-1803.85, 402.6962, 114.2254),
      model = -1568354151,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house bottom driveway right gate",
      active = true,
      id = 473,
      coords = vector3(-1862.484, 351.442, 89.79803),
      model = -1249591818,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "lean house bottom driveway left gate",
      active = true,
      id = 474,
      coords = vector3(-1867.078, 349.4299, 90.0629),
      model = 546378757,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["clean_manor"] = true
        }
      }
    },
    {
      info = "yachtvault",
      active = true,
      id = 475,
      coords = vector3(-2071.79, -1019.254, 3.306306),
      model = -2050208642,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {}
      }
    },
    {
      info = "comic store back door 1",
      active = true,
      id = 476,
      coords = vector3(-138.995, 221.3845, 95.144),
      model = 1715961343,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["comic_store"] = true
        }
      }
    },
    {
      info = "comic store back door 2",
      active = true,
      id = 477,
      coords = vector3(-147.8129, 220.7639, 95.16154),
      model = -905400395,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["comic_store"] = true,
        },
      },
    },
    {
      info = "comic store front door 1",
      active = true,
      id = 478,
      coords = vector3(-142.47, 228.695, 95.13654),
      model = 1483722564,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["comic_store"] = true,
        },
      },
    },
    {
      info = "comic store front door 2",
      active = true,
      id = 479,
      coords = vector3(-145.0708, 228.685, 95.13654),
      model = -1508283750,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["comic_store"] = true,
        },
      },
    },
  }
  