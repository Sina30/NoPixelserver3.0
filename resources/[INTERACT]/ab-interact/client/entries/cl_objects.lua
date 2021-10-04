local Entries = {}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isTrash' },
    data = {
        {
            id = 'trash',
            label = "Pickup trash",
            icon = "circle",
            event = "ab-jobs:sanitationWorker:pickupTrash",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.7 },
        job = { 'sanitation_worker' }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isYogaMat' },
    data = {
        {
            id = 'yoga',
            label = "Yoga",
            icon = "circle",
            event = "ab-healthcare:yoga",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 },
        isEnabled = function(pEntity, pContext)
            return IsEntityTouchingEntity(PlayerPedId(), pEntity)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isExercise' },
    data = {
        {
            id = 'weights',
            label = "Weights",
            icon = "circle",
            event = "ab-healthcare:exercise",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.2 },
    }
}

-- Entries[#Entries + 1] = {
--     type = 'flag',
--     group = { 'isSmokeMachineTrigger' },
--     data = {
--         {
--             id = 'smoke_machine',
--             label = "Smoke Machine",
--             icon = "circle",
--             event = "ab-stripclub:smokemachine",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 1.2 },
--     }
-- }

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isFuelPump' },
    data = {
        {
            id = 'jerrycan_refill',
            label = "Refill Can",
            icon = "circle",
            event = "vehicle:refuel:showMenu",
            parameters = { isJerryCan = true }
        }
    },
    options = {
        distance = { radius = 1.5 },
        isEnabled = function(pEntity, pContext)
            return HasWeaponEquipped(GetHashKey('WEAPON_PetrolCan'))
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isVendingMachine' },
    data = {
        {
            id = 'vending_machine',
            label = "Browse",
            icon = "shopping-basket",
            event = "shops:vendingMachine",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isChair' },
    data = {
        {
            id = 'sit_on_chair',
            icon = "chair",
            event = "ab-emotes:sitOnChair",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isChair' },
  data = {
      {
          id = 'sit_on_vr_gopro_chair_pd',
          label = "Enable GoPixel VR",
          icon = "chair",
          event = "ab-gopro:activateVRChair",
          parameters = { type = "pd" }
      }
  },
  options = {
      distance = { radius = 1.5 },
      isEnabled = function(pEntity, pContext)
          local coords = GetEntityCoords(PlayerPedId())
          if #(coords - vector3(444.6,-997.42,34.98)) > 5.0 then
            return false
          end
          local model = GetEntityModel(pEntity)
          return model == 538002882
      end
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isATM' },
    data = {
        {
            id = 'use_atm',
            label = "Use ATM",
            icon = "credit-card",
            event = "financial:openUI",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isGoProVRChair' },
  data = {
      {
          id = 'sit_on_vr_gopro_chair',
          label = "Enable GoPixel VR",
          icon = "chair",
          event = "ab-gopro:activateVRChair",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isWeedPlant' },
    data = {
        {
            id = 'weed',
            label = "Check",
            icon = "cannabis",
            event = "ab-weed:checkPlant",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 7.0 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isLrgWeedPlant' },
    data = {
        {
            id = 'weed2',
            label = "Harvest",
            icon = "hand-paper",
            event = "ab-weed:pickPlant",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 7.0 }
    }
}

Entries[#Entries + 1] = {
  type = 'model',
  group = { `ch_prop_ch_cash_trolly_01c` },
  data = {
      {
          id = 'trolleygrab',
          label = "Grab it!",
          icon = "hand-holding",
          event = "ab-heists:grabFromTrolley",
          parameters = { type = "cash" }
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'model',
  group = { `ch_prop_gold_trolly_01c` },
  data = {
      {
          id = 'trolleygrabgold',
          label = "Grab it!",
          icon = "hand-holding",
          event = "ab-heists:grabFromTrolley",
          parameters = { type = "gold" }
      }
  },
  options = {
      distance = { radius = 1.5 }
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
