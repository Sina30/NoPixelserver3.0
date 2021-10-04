local Entries = {}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isRecycleExchange' },
    data = {
        {
            id = "recycle_exchange",
            label = "Exchange recyclables",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:exchangeRecycleMaterial",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isBankAccountManager' },
    data = {
        {
            id = "bank_paycheck_collect",
            label = "Collect paycheck",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:paycheckCollect",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isBankAccountManager' },
    data = {
        {
            id = "bank_receipt_collect",
            label = "trade in receipts",
            icon = "money-bill-wave",
            event = "ab-npcs:ped:receiptTradeIn",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        isEnabled = function()
            local isEmployedAtBurgerShot = exports["ab-business"]:IsEmployedAt("burger_shot")
            local isEmployedAtRoosters = exports["ab-business"]:IsEmployedAt("rooster")
            local isPublic = exports["ab-config"]:IsPublic()
            return isEmployedAtBurgerShot or isEmployedAtRoosters or isPublic
        end
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isBankAccountManager' },
  data = {
      {
          id = "bank_receipt_m_collect",
          label = "Trade in Market Receipts",
          icon = "money-bill-wave",
          event = "ab-npcs:ped:receiptTradeInMarket",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 },
      isEnabled = function()
          return exports["ab-inventory"]:getQuantity("farmersmarketreceipt", true) > 0
      end
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isCommonJobProvider' },
    data = {
        {
            id = "common_job_signIn",
            label = "Sign in",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:signInJob",
            parameters = {}
        },
        {
            id = "common_job_signOut",
            label = "Sign out",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:signInJob",
            parameters = { "unemployed" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isJobEmployer' },
    data = {
        {
            id = "jobs_employer_checkIn",
            label = "Sign in",
            icon = "fas fa-circle",
            event = "jobs:checkIn",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        isEnabled = function()
            return CurrentJob == 'unemployed'
        end
    }
}

-- Entries[#Entries + 1] = {
--     type = 'flag',
--     group = { 'isJobEmployer' },
--     data = {
--         {
--             id = "fishing_borrow_boat",
--             label = "Borrow Fishing Boat",
--             icon = "fas fa-circle",
--             event = "ab-fishing:rentBoat",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 2.5 },
--         isEnabled = function(pEntity, pContext)
--             return pContext.job.id == CurrentJob and not IsDisabled() and not IsPedInAnyVehicle(PlayerPedId()) and (pEntity and pContext.flags['isBoatRenter']) and (currentlyRentedBoat == nil or not DoesEntityExist(currentlyRentedBoat))
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = 'flag',
--     group = { 'isJobEmployer' },
--     data = {
--         {
--             id = "fishing_return_boat",
--             label = "Return Fishing Boat",
--             icon = "fas fa-circle",
--             event = "ab-fishing:returnBoat",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 2.5 },
--         isEnabled = function(pEntity, pContext)
--             return pContext.job.id == CurrentJob and not IsDisabled() and not IsPedInAnyVehicle(PlayerPedId()) and (pEntity and pContext.flags['isBoatRenter']) and (currentlyRentedBoat ~= nil and DoesEntityExist(currentlyRentedBoat))
--         end
--     }
-- }

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isJobEmployer' },
    data = {
        {
            id = "jobs_employer_paycheck",
            label = "Get paycheck",
            icon = "fas fa-circle",
            event = "jobs:getPaycheck",
            parameters = {}
        },
        {
            id = "jobs_employer_checkOut",
            label = "Sign Out",
            icon = "fas fa-circle",
            event = "jobs:checkOut",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        isEnabled = function(pEntity, pContext)
            return pContext.job.id == CurrentJob
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isShopKeeper' },
    data = {
        {
            id = "shopkeeper",
            label = "Purchase goods",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:keeper",
            parameters = { "2" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isGarbageInst' },
    data = {
        {
            id = "garbagehelper",
            label = "Duty Actions",
            icon = "fas fa-circle",
            event = "event:start:garbagejob",
            parameters = { "2" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isChickienSeller' },
    data = {
        {
            id = "chicken_start",
            label = "Catch Chickens",
            icon = "fas fa-circle",
            event = "initial:chicken",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"chicken_start"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isChickienSeller' },
    data = {
        {
            id = "chicken_seller",
            label = "Offer Packaged Chickens",
            icon = "fas fa-circle",
            event = "end:chicken",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"chicken_seller"}
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "liqourkeeper",
          label = "Purchase alcohol",
          icon = "fas fa-circle",
          event = "ab-npcs:ped:keeperLiqour",
          parameters = { "42076" }
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"liqourkeeper_1", "liqourkeeper_2", "liqourkeeper_3", "liqourkeeper_4", "liqourkeeper_5", "liqourkeeper_6","liqourkeeper_7", "liqourkeeper_8", "liqourkeeper_9", "liqourkeeper_10", "liqourkeeper_11"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "getpaintballgun",
          label = "Pickup Paintball Gun",
          icon = "fas fa-circle",
          event = "ab-paintball:getPaintballGun",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"paintball_vendor"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "getpaintballammo",
          label = "Pickup Paintball Ammo",
          icon = "fas fa-circle",
          event = "ab-paintball:getPaintballAmmo",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"paintball_vendor"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "licensekeeper",
          label = "Purchase License ($500.00)",
          icon = "id-card-alt",
          event = "ab-npcs:ped:licenseKeeper",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"npc_license_keeper_1", "npc_license_keeper_2"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "vendorlicensekeeper",
          label = "Get Vendor License",
          icon = "id-card-alt",
          event = "ab-farmersmarket:generateVendorLicense",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"npc_license_keeper_1"},
      isEnabled = function()
        return myJob == "judge" or myJob == "mayor" or myJob == "police" or myJob == "deputy_mayor" or myJob == "county_clerk"
      end,
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "craftitemvendor",
          label = "Collect Farmers Market Items",
          icon = "hand-holding",
          event = "ab-farmersmarket:craftItem",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"fm_craft_shopkeeper"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "fmregisterbanner",
          label = "Register Farmers Market Banner",
          icon = "image",
          event = "ab-farmersmarket:registerBanner",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"fm_craft_shopkeeper"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "dwfindloststuff",
          label = "Find Lost Stuff",
          icon = "search",
          event = "ab-deanworld:findLostStuff",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"dw_drop_1"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "dwbuyshitfood",
          label = "Purchase Food",
          icon = "hamburger",
          event = "ab-deanworld:buyShitFood",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"dw_food_1"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "dwbuybumperupgrades",
          label = "Purchase Upgrades",
          icon = "fas fa-circle",
          event = "ab-deanworld:purchaseRLUpgrades",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"dw_bumper_1"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "dwdropoffstuff",
          label = "Drop Off",
          icon = "handshake",
          event = "ab-deanworld:dropOffCases",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"dw_drop_1"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "dwadminentrance",
          label = "Buy Entrance Ticket",
          icon = "times-circle",
          event = "ab-deanworld:buyAdministrationTicket",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"dw_admin_1"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "fmregisteritem",
          label = "Register Farmers Market Item",
          icon = "hamburger",
          event = "ab-farmersmarket:registerItem",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"fm_craft_shopkeeper"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "pcagrader",
          label = "Grade Items",
          icon = "fas fa-circle",
          event = "ab-business:pcaGradeItems",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"dw_pca_grader_1"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "airxvendor",
          label = "Collect Parachute",
          icon = "parachute-box",
          event = "ab-business:collectAirXParachute",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"airx_1"}
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isWeaponShopKeeper' },
    data = {
        {
            id = "weaponshop_keeper",
            label = "Purchase weapons",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:keeper",
            parameters = { "5" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isToolShopKeeper' },
    data = {
        {
            id = "toolshop_keeper",
            label = "Purchase tools",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:keeper",
            parameters = { "4" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isSportShopKeeper' },
    data = {
        {
            id = "sportshop_keeper",
            label = "Purchase gear",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:keeper",
            parameters = { "34" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isWeedShopKeeper' },
  data = {
      {
          id = "weedshop_keeper",
          label = "Purchase Weed",
          icon = "cannabis",
          event = "ab-npcs:ped:weedSales",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isJobVehShopKeeper' },
  data = {
      {
          id = "jobveh_keeper",
          label = "Purchase Job Vehicle",
          icon = "car",
          event = "ab-showrooms:buyJobVehicles",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isWineryShopKeeper' },
  data = {
      {
          id = "winery_keeper",
          label = "Pick up Wine",
          icon = "wine-bottle",
          event = "ab-business:buyWineryWine",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isWineryShopKeeper' },
  data = {
      {
          id = "winery_keeper_goods",
          label = "Purchase Goods",
          icon = "wine-glass-alt",
          event = "ab-business:buyWineryGoods",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 }
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isCasinoChipSeller' },
    data = {
      {
          id = "casino_purchase_chips",
          label = "Purchase Chips",
          icon = "fas fa-circle",
          event = "ab-casino:purchaseChipsAction",
          parameters = { "purchase" }
      },
      {
          id = "casino_withdraw_cash",
          label = "Cashout (Cash)",
          icon = "wallet",
          event = "ab-casino:purchaseChipsAction",
          parameters = { "withdraw:cash" }
      },
      {
          id = "casino_withdraw_bank",
          label = "Cashout (Bank)",
          icon = "university",
          event = "ab-casino:purchaseChipsAction",
          parameters = { "withdraw:bank" }
      },
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
    {
        id = "casino_wheel_spin_npc_toggle",
        label = "Toggle Wheel Enabled",
        icon = "fas fa-circle",
        event = "ab-casino:wheel:toggleEnable",
    },
    {
        id = "casino_wheel_spin_npc_spin",
        label = "Spin Wheel! ($500)",
        icon = "dollar-sign",
        event = "ab-casino:wheel:spinWheel",
    },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"casino_wheel_spin_npc"}
  }
}


-- Entries[#Entries + 1] = {
--   type = 'flag',
--   group = { 'isCasinoChipSeller' },
--   data = {
--       {
--           id = "casino_purchase_chips_bands",
--           label = "Purchase Chips (Dirty)",
--           icon = "fas fa-circle",
--           event = "ab-casino:purchaseChipsAction",
--           parameters = { "purchase:dirty" }
--       },
--   },
--   options = {
--       distance = { radius = 2.5 },
--       isEnabled = function()
--           return myJob == 'unemployed'
--             and (exports['ab-inventory']:hasEnoughOfItem("markedbills", 20, false, true)
--             or exports['ab-inventory']:hasEnoughOfItem("rollcash", 5, false, true)
--             or exports['ab-inventory']:hasEnoughOfItem("band", 5, false, true))
--       end
--   }
-- }

-- Entries[#Entries + 1] = {
--   type = 'flag',
--   group = { 'isCasinoMembershipGiver' },
--   data = {
--     {
--         id = "casino_membership_giver",
--         label = "Get Membership",
--         icon = "fas fa-circle",
--         event = "ab-casino:purchaseMembership",
--         parameters = {}
--     },
--   },
--   options = {
--       distance = { radius = 2.5 }
--   }
-- }

-- Entries[#Entries + 1] = {
--   type = 'flag',
--   group = { 'isCasinoMembershipGiver' },
--   data = {
--     {
--         id = "casino_vip_membership_giver",
--         label = "Get VIP Membership",
--         icon = "fas fa-circle",
--         event = "ab-casino:purchaseVipMembership",
--         parameters = {}
--     },
--   },
--   options = {
--       distance = { radius = 2.5 }
--   }
-- }

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isCasinoMembershipGiver' },
  data = {
    {
        id = "casino_membership_giver",
        label = "Purchase Membership ($250)",
        icon = "fas fa-circle",
        event = "ab-casino:purchaseMembershipCard",
        parameters = {}
    },
  },
  options = {
      distance = { radius = 2.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isCasinoDrinkGiver' },
  data = {
    {
        id = "casino_drink_giver",
        label = "Purchase Drinks",
        icon = "fas fa-circle",
        event = "ab-casino:purchaseDrinks",
        parameters = {}
    },
  },
  options = {
      distance = { radius = 2.5 }
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isPawnBuyer' },
    data = {
        {
            id = "pawn_give_items",
            label = "Give stolen items",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:giveStolenItems",
            parameters = {}
        },
        {
            id = "pawn_sell_items",
            label = "Sell given items",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:sellStolenItems",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "vehicleshopkeeper",
            label = "Purchase vehicle",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:vehiclekeeper",
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"npc_bike_shop", "npc_boat_shop", "npc_air_shop"}
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "vehiclerentalkeeper",
          label = "Rent vehicle",
          icon = "fas fa-circle",
          event = "ab-npcs:ped:vehiclekeeperrent",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"npc_air_shop"}
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "vehicleshoprenter",
            label = "Rent vehicle",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:vehiclekeeper",
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"npc_veh_rental"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "fish_market",
            label = "Sell fish",
            icon = "fas fa-dollar-sign",
            event = "ab-npcs:ped:sellFish",
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"fish_market"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "fish_shop",
            label = "Millars Shop",
            icon = "fas fa-circle",
            event = "ab-npcs:ped:keeper",
            parameters = { "9775" }

        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"fish_shop"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "coke_spawner",
            label = "Discuss about deal",
            icon = "fas fa-circle",
            event = "coke:int:ban",
            parameters = { "" }

        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"coke_spawner"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "boat_spawner",
            label = "Rent Boat",
            icon = "fas fa-ship",
            event = "ab-rental:nearboatrentmenu",
            parameters = {}

        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"boat_spawner"}
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "hunting_market",
          label = "Sell Pelts",
          icon = "dollar-sign",
          event = "ab-hunting:makeSales",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"hunting_market"}
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "digital_den_npc",
            label = "Digital Den",
            icon = "fas fa-mobile-alt",
            event = "ab-npcs:ped:openDigitalDenShop",
        }
    },
    options = {
        distance = { radius = 3.5 },
        npcIds = {"digital_den_npc"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "city_hall_npc_f",
            label = "Request Id",
            icon = "fas fa-id-card",
            event = "ab-npcs:ped:giveidcard",
        }
    },
    options = {
        distance = { radius = 7.0 },
        npcIds = {"city_hall_npc_f"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "pizza_delivery_start",
            label = "Check for delivery details",
            icon = "fas fa-pizza-slice",
            event = "ab-pizza:start",
        }
    },
    options = {
        distance = { radius = 3.5 },
        npcIds = {"pizza_delivery_start"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "city_hall_npc_m",
            label = "Request Id",
            icon = "fas fa-id-card",
            event = "ab-npcs:ped:giveidcard",
        }
    },
    options = {
        distance = { radius = 7.0 },
        npcIds = {"city_hall_npc_m"}
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isMethDude' },
  data = {
      {
          id = "purchasemethkey",
          label = "Purchase Lab Key",
          icon = "key",
          event = "ab-meth:purchaseMethLabKey",
          parameters = {}
      },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"purchasemethkey"}
  }
}

local validPracCids = {
  [1062] = true, -- claire
  [1363] = true, -- violet
  [1380] = true, -- lexi
  [3503] = true,
}
Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isMethDude' },
  data = {
      {
          id = "purchasepraclaptop",
          label = "Purchase Practice Laptop",
          icon = "laptop",
          event = "ab-heists:purchasePracticeLaptop",
          parameters = {}
      },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"purchasemethkey"},
      isEnabled = function()
        local cid = exports["isPed"]:isPed("cid")
        return validPracCids[cid]
      end,
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "sellgallerygem",
          label = "Sell Gems",
          icon = "gem",
          event = "ab-gallery:sellGems",
          parameters = {}
      },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"gemshop_1"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "nikezrollercoasterspawnride",
          label = "Summon roller coaster",
          icon = "child",
          event = "nikez-rollercoaster:canSpawnCoaster",
          parameters = {}
      },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"nikez_rollercoaster_worker"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "nikezfreefalltowerspawnride",
          label = "Summon ride",
          icon = "space-shuttle",
          event = "nikez-freefalltower:canSpawnRide",
          parameters = {}
      },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"nikez_freefalltower_worker"}
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "pubtownhallbuylicense",
            label = "purchase licenses",
            icon = "id-card-alt",
            event = "ab-gov:purchaseLicenses",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 3.5 },
        npcIds = {"npc_pub_townhall"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "pubbusinessbuylicense",
            label = "purchase business license",
            icon = "business-time",
            event = "ab-gov:purchaseBusiness",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 3.5 },
        npcIds = {"npc_pub_business"}
    }
}

local validAnimalModels = {
  [`a_c_chop`] = true,
  [`a_c_husky`] = true,
  [`a_c_husky_np`] = true,
  [`a_c_panther`] = true,
  [`a_c_cat_01`] = true,
  [`a_c_poodle`] = true,
  [`a_c_pug`] = true,
  [`a_c_retriever`] = true,
  [`a_c_retriever_np`] = true,
  [`a_c_shepherd`] = true,
  [`a_c_shepherd_np`] = true,
  [`a_c_pit_np`] = true,
  [`a_c_coyote`] = true,
  [`a_c_rottweiler`] = true,
  [`a_c_westy`] = true,
}
Entries[#Entries + 1] = {
  type = 'entity',
  group = { 1 },
  data = {
      {
          id = "petthebaby",
          label = "Pet",
          icon = "fas fa-circle",
          event = "ab-interact:doPettingAnimal",
          parameters = "petting",
      },
  },
  options = {
      distance = { radius = 2.5 },
      isEnabled = function(pEntity, pContext)
        -- -- Don't show options if this entity is dead 
        if pContext.isDead then
            return
        end

        return validAnimalModels[pContext.model]
      end,
  }
}
local lastStressTime = 0
AddEventHandler("ab-interact:doPettingAnimal", function()
  ClearPedTasksImmediately(PlayerPedId())
  TriggerEvent("animation:runtextanim", "petting")
  if lastStressTime == 0 or lastStressTime + (60000 * 15) < GetGameTimer() then
    lastStressTime = GetGameTimer()
    TriggerEvent("client:newStress", false, 250)
  end
end)

Entries[#Entries + 1] = {
  type = 'entity',
  group = { 1 },
  data = {
      {
          id = "bobcatblowc4",
          label = "Blow the Door!",
          icon = "fas fa-circle",
          event = "ab-heists:interactBobcatC4Npc",
          parameters = {},
      },
  },
  options = {
      distance = { radius = 2.5 },
      isEnabled = function(pEntity)
        return DecorGetBool(pEntity, "BobcatC4Ped")
      end,
  }
}

Citizen.CreateThread(function()
    for _, entry in ipairs(Entries) do
        if entry.type == 'flag' then
            AddPeekEntryByFlag(entry.group, entry.data, entry.options)
        elseif entry.type == 'model' then
            AddPeekEntryByModel(entry.group, entry.data, entry.options)
        elseif entry.type == 'entity' then
            AddPeekEntryByEntityType(entry.group, entry.data, entry.options)
        elseif entry.type == 'polytarget' then
            AddPeekEntryByPolyTarget(entry.group, entry.data, entry.options)
        end
    end
end)
