local Entries = {}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_flip",
            label = "Flip Vehicle",
            icon = "car-crash",
            event = "FlipVehicle",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return not IsVehicleOnAllWheels(pEntity)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_refuel_station",
            label = "Refuel Vehicle",
            icon = "fas fa-gas-pump",
            event = "vehicle:refuel:menu",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.2, boneId = 'wheel_lr' },
        isEnabled = function(pEntity, pContext)
            return exports['ab-fuel']:NearGasFn()
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "carry_bike",
            label = "Carry Bike",
            icon = "spinner",
            event = "carryEntity",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return IsThisModelABicycle(pContext.model) and not IsEntityAttachedToAnyPed(pEntity) and not IsEntityAttachedToAnyPed(PlayerPedId())
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_getintrunk",
            label = "Enter trunk",
            icon = "user-secret",
            event = "vehicle:getInTrunk",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 4.0 },
        isEnabled = function(pEntity, pContext)
            local lockStatus = GetVehicleDoorLockStatus(pEntity)
            return DoesVehicleHaveDoor(pEntity, 5) and isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model) and (lockStatus == 1 or lockStatus == 0 or lockStatus == 4)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_runplate",
            label = "Run Plate",
            icon = "money-check",
            event = "clientcheckLicensePlate",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 7.0 },
        isEnabled = function(pEntity, pContext)
            return isPolice and (isCloseToHood(pEntity, PlayerPedId(), 2.0) or isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model)) and not IsPedInAnyVehicle(PlayerPedId(), false)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_inspectvin",
            label = "Check VIN",
            icon = "sim-card",
            event = "vehicle:checkVIN",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return isCloseToHood(pEntity, PlayerPedId(), 2.0) and (isPolice or isMedic) and not IsPedInAnyVehicle(PlayerPedId(), false)
        end
    }
}

-- Entries[#Entries + 1] = {
--     type = 'entity',
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_add_fakeplate",
--             label = "Add Fakeplate",
--             icon = "screwdriver",
--             event = "vehicle:addFakePlate",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 3.0 },
--         isEnabled = function(pEntity, pContext)
--             return (isCloseToHood(pEntity, PlayerPedId(), 2.0) or isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model)) and not IsPedInAnyVehicle(PlayerPedId(), false)
--             and exports["ab-vehicles"]:HasVehicleKey(pEntity) and exports["ab-inventory"]:hasEnoughOfItem("fakeplate", 1, false)
--             and not exports["ab-vehicles"]:GetVehicleMetadata(pEntity, 'fakePlate')
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = 'entity',
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_remove_fakeplate",
--             label = "Remove Fakeplate",
--             icon = "ban",
--             event = "vehicle:removeFakePlate",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 3.0 },
--         isEnabled = function(pEntity, pContext)
--             return isCloseToBoot(pEntity, PlayerPedId(), 1.8, pContext.model) and not IsPedInAnyVehicle(PlayerPedId(), false)
--             and exports["ab-vehicles"]:HasVehicleKey(pEntity) and exports["ab-vehicles"]:GetVehicleMetadata(pEntity, 'fakePlate')
--         end
--     }
-- }

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_examine",
            label = "Examine Vehicle",
            icon = "wrench",
            event = "np:vehicles:examineVehicle",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isCloseToEngine(pEntity, PlayerPedId(), 3.0, pContext.model)
        end
    }
}

-- Entries[#Entries + 1] = {
--     type = 'entity',
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_refuel_station",
--             label = "Refuel Vehicle",
--             icon = "gas-pump",
--             event = "vehicle:refuel:showMenu",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 1.2, boneId = 'wheel_lr' },
--         isEnabled = function(pEntity, pContext)
--             return polyChecks.gasStation.isInside and canRefuelHere(pEntity, polyChecks.gasStation.polyData) 
--         end
--     }
-- }

Entries[#Entries + 1] = {
  type = 'entity',
  group = { 2 },
  data = {
      {
          id = "vehicle_refuel_station_plane",
          label = "Refuel Vehicle",
          icon = "gas-pump",
          event = "vehicle:refuel:showMenu",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.0 },
      isEnabled = function(pEntity, pContext)
          local vehicleClass = GetVehicleClass(pEntity)
          if vehicleClass ~= 16 then return false end
          return polyChecks.gasStation.isInside
      end
  }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_refuel_station_boat",
            label = "Refuel Vehicle",
            icon = "gas-pump",
            event = "vehicle:refuel:showMenu",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 5.0 },
        isEnabled = function(pEntity, pContext)
            local vehicleClass = GetVehicleClass(pEntity)
            if vehicleClass ~= 14 then return false end
            return polyChecks.gasStation.isInside
        end
    }
}

Entries[#Entries + 1] = {
  type = 'entity',
  group = { 2 },
  data = {
      {
          id = "vehicle_refuel_station_chopter",
          label = "Refuel Vehicle",
          icon = "gas-pump",
          event = "vehicle:refuel:showMenu",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 5.0 },
      isEnabled = function(pEntity, pContext)
          local vehicleClass = GetVehicleClass(pEntity)
          if vehicleClass ~= 15 then return false end
          return polyChecks.gasStation.isInside
      end
  }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_refuel_jerrycan",
            label = "Refuel Vehicle",
            icon = "gas-pump",
            event = "vehicle:refuel:jerryCan",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.2, boneId = 'wheel_lr' },
        isEnabled = function(pEntity, pContext)
            return HasWeaponEquipped(883325847) -- WEAPON_PetrolCan
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_putinvehicle",
            label = "seat in vehicle",
            icon = "fas fa-chevron-circle-left",
            event = "police:forceEnter",
            parameters = {}
        },
        {
            id = "vehicle_unseatnearest",
            label = "unseat from vehicle",
            icon = "fas fa-chevron-circle-right",
            event = "unseatPlayer",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 4.0 },
        isEnabled = function(pEntity, pContext)
            return (not (isCloseToHood(pEntity, PlayerPedId()) or isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model))
              or pContext.model == GetHashKey("emsnspeedo"))
              and not IsPedInAnyVehicle(PlayerPedId(), false)
              and NetworkGetEntityIsNetworked(pEntity)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_keysgive",
            label = "give key",
            icon = "key",
            event = "vehicle:giveKey",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.8 },
        isEnabled = function(pEntity, pContext)
            return hasKeys(pEntity)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isWheelchair' },
    data = {
        {
            id = "wheelchair",
            label = "toggle wheelchair",
            icon = "wheelchair",
            event = "np:vehicle:wheelchair:control",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 0.9, boneId = 'misc_a' }
    }
}


Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isTowTruck' },
    data = {
        {
            id = "towtruck_tow",
            label = "tow vehicle",
            icon = "trailer",
            event = "jobs:towVehicle",
            parameters = {}
        }
    },
    options = {
        job = { 'impound' },
        distance = { radius = 2.5, boneId = 'wheel_lr' },
        isEnabled = function (pEntity, pContext)
            return not pContext.flags['isTowingVehicle']
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isTowTruck' },
    data = {
        {
            id = "towtruck_untow",
            label = "untow vehicle",
            icon = "trailer",
            event = "jobs:untowVehicle",
            parameters = {}
        }
    },
    options = {
        job = { 'impound' },
        distance = { radius = 2.5, boneId = 'wheel_lr' },
        isEnabled = function (pEntity, pContext)
            return pContext.flags['isTowingVehicle']
        end
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { GetHashKey('trash2') },
    data = {
        {
            id = "sanitation_worker_throw_trash",
            label = "throw in trash",
            icon = "trash-restore-alt",
            event = "ab-jobs:sanitationWorker:vehicleTrash",
            parameters = {}
        }
    },
    options = {
        job = { 'sanitation_worker' },
        distance = { radius = 3.8, boneId = 'wheel_lr' },
        isEnabled = function (pEntity, pContext)
            return isCloseToTrunk(pEntity, PlayerPedId(), 1.1, true)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { GetHashKey('benson') },
    data = {
        {
            id = "247_deliveries_take_goods",
            label = "Grab goods",
            icon = "box",
            event = "ab-jobs:247delivery:takeGoods",
            parameters = {}
        }
    },
    options = {
        job = { '247_deliveries' },
        distance = { radius = 2.0, boneId = 'boot' },
        isEnabled = function (pEntity, pContext)
            return isCloseToTrunk(pEntity, PlayerPedId())
        end
    }
}

Entries[#Entries + 1] = {
  type = 'entity',
  group = { 2 },
  data = {
      {
          id = "vehicle_buy_vehicle",
          label = "sell vehicle",
          icon = "money-check-alt",
          event = "ab-ottosauto:vehicle:transaction",
          parameters = {
            action = "sell"
          }
      }
  },
  options = {
      distance = { radius = 1.8 },
      isEnabled = function(pEntity, pContext)
          return polyChecks.ottosAuto.isInside and hasJobPermission("ottos_auto") and CanSellOrBuyCar(pEntity, true)
      end
  }
}

Entries[#Entries + 1] = {
  type = 'entity',
  group = { 2 },
  data = {
      {
          id = "vehicle_sell_vehicle",
          label = "buy vehicle",
          icon = "shopping-cart",
          event = "ab-ottosauto:vehicle:transaction",
          parameters = {
            action = "buy"
          }
      }
  },
  options = {
      distance = { radius = 1.8 },
      isEnabled = function(pEntity, pContext)
          return polyChecks.ottosAuto.isInside and hasJobPermission("ottos_auto", "buy_car") and CanSellOrBuyCar(pEntity, false)
      end
  }
}

-- local stockadeHash = `STOCKADE`
-- Entries[#Entries + 1] = {
--   type = 'entity',
--   group = { 2 },
--   data = {
--       {
--           id = "moneytruckthermite",
--           label = "Use Thermite",
--           icon = "circle",
--           event = "ab-heists:bobcatThermiteMoneyTruckDoor",
--           parameters = {}
--       }
--   },
--   options = {
--       distance = { radius = 8.0 },
--       isEnabled = function(pEntity, pContext)
--           return pContext.model == stockadeHash
--             and isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model)
--             and not DecorGetBool(pEntity, "BobcatMoneyTruck")
--             and exports["ab-inventory"]:hasEnoughOfItem("thermitecharge", 1, false, true)
--       end
--   }
-- }

-- Entries[#Entries + 1] = {
--   type = 'entity',
--   group = { 2 },
--   data = {
--       {
--           id = "moneytruckloot",
--           label = "Take Goods",
--           icon = "circle",
--           event = "ab-heists:bobcatMoneyTruckTakeGoods",
--           parameters = {}
--       }
--   },
--   options = {
--       distance = { radius = 8.0 },
--       isEnabled = function(pEntity, pContext)
--           return pContext.model == stockadeHash
--             and isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model)
--             and DecorGetBool(pEntity, "BobcatMoneyTruck")
--       end
--   }
-- }

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
