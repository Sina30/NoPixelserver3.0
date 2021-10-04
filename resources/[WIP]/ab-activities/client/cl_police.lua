local listening, currentPrompt = false, nil
local defaultDuiUrl = 'https://i.imgur.com/5Ust2GQ.jpg'
local currentBoardUrl = 'https://i.imgur.com/5Ust2GQ.jpg'
local inClassRoom, isMegaphoneActivated = false, false
local dui = nil

Citizen.CreateThread(function()

  exports["ab-polyzone"]:AddPolyZone("mrpd_classroom", {
    vector2(448.41372680664, -990.47613525391),
    vector2(439.50704956055, -990.55731201172),
    vector2(439.43478393555, -981.08758544922),
    vector2(448.419921875, -981.26306152344),
    vector2(450.23190307617, -983.00885009766),
    vector2(450.25042724609, -988.77667236328)
  }, {
    gridDivisions = 25,
    minZ = 34.04,
    maxZ = 37.69
  })

  exports["ab-polyzone"]:AddBoxZone("mrpd_clothing_lockers", vector3(461.81, -997.79, 30.69), 4.4, 4.8, {
    heading=0,
    minZ=29.64,
    maxZ=32.84
  })

  exports["ab-polyzone"]:AddBoxZone("mrpd_armory", vector3(481.59, -995.35, 30.69), 3.2, 0.8, {
    heading=90,
    minZ=29.69,
    maxZ=32.49
  })

  exports["ab-polyzone"]:AddBoxZone("mrpd_evidence", vector3(474.84, -996.26, 26.27), 1.2, 3.0, {
    heading=90,
    minZ=25.27,
    maxZ=27.87
  })

  exports["ab-polyzone"]:AddBoxZone("mrpd_trash", vector3(472.88, -996.28, 26.27), 1.2, 3.0, {
    heading=90,
    minZ=25.27,
    maxZ=27.87
  })

  exports["ab-polyzone"]:AddBoxZone("mrpd_character_switcher", vector3(478.88, -983.49, 30.69), 1.35, 1.3, {
    heading=0,
    minZ=29.74,
    maxZ=32.74
  })

  -- Armory, VBPD
  exports["ab-polyzone"]:AddBoxZone("vbpd_armory", vector3(-1075.05, -830.85, 19.3), 4.6, 1.2, {
    heading=308,
    minZ=18.3,
    maxZ=21.1
  })

  exports["ab-polyzone"]:AddBoxZone("vbpd_clothing_lockers", vector3(-1087.41, -832.43, 19.3), 4.2, 11.2, {
    heading=308,
    minZ=18.15,
    maxZ=21.95
  })

  exports["ab-polyzone"]:AddCircleZone("vbpd_character_switcher", vector3(-1081.85, -834.42, 19.3), 0.5, {
    useZ=true,
  })

  exports["ab-polyzone"]:AddCircleZone("vbpd_evidence", vector3(-1099.11, -824.35, 19.3), 0.7, {
    useZ=true,
  })

  exports["ab-polyzone"]:AddCircleZone("vbpd_trash", vector3(-1096.47, -818.9, 19.3), 0.3, {
    useZ=true,
  })

  exports["ab-polyzone"]:AddBoxZone("sandy_clothing_lockers", vector3(1861.04, 3689.48, 34.28), 2.9, 2.95, {
    heading=30,
    minZ=33.28,
    maxZ=35.48
  })

  exports["ab-polyzone"]:AddBoxZone("sandy_character_switch_evidence_trash_armory", vector3(1849.44, 3694.38, 34.28), 2.4, 2.2, {
    heading=30,
    minZ=33.28,
    maxZ=36.68
  })

  exports["ab-polyzone"]:AddBoxZone("paleto_clothing_lockers_character_switch_evidence_trash_armory", vector3(-452.63, 6014.1, 31.72), 2.4, 2.8, {
    heading=44,
    minZ=30.5,
    maxZ=33.0
  })

  exports["ab-polyzone"]:AddBoxZone("doc_clothing_lockers", vector3(1783.38, 2493.71, 50.43), 3.8, 2.0, {
    heading=30,
    minZ=49.43,
    maxZ=53.43
  })

  exports["ab-polyzone"]:AddBoxZone("doc_armory", vector3(1774.73, 2511.36, 45.83), 3.0, 1.4, {
    heading=300,
    minZ=44.83,
    maxZ=48.83
  })
  
  -- Prison - Bus Spawn
  exports["ab-polyzone"]:AddBoxZone("pd_shared", vector3(1671.45, 2606.07, 45.56), 5.8, 15.0, {
    heading=0,
    minZ=44.56,
    maxZ=47.56
  })

  -- MRPD - Bus Spawn
  exports["ab-polyzone"]:AddBoxZone("pd_shared", vector3(479.43, -1019.49, 27.96), 6.0, 15.0, {
    heading=0,
    minZ=26.96,
    maxZ=28.96
  })

  -- MRPD Helipads
  exports["ab-polyzone"]:AddBoxZone("pd_shared", vector3(466.16, -981.74, 43.69), 13.6, 46.8, {
    heading=0,
    minZ=39.89,
    maxZ=46.89
  })

  -- Vespucci PD Helipad
  exports["ab-polyzone"]:AddBoxZone("pd_shared", vector3(-1095.58, -834.96, 37.68), 14.0, 13.6, {
    heading=40,
    minZ=36.48,
    maxZ=40.68
  })

  -- Paleto PD Helipad
  exports["ab-polyzone"]:AddBoxZone("pd_shared", vector3(-475.69, 5988.67, 31.34), 14.0, 13.6, {
    heading=40,
    minZ=30.34,
    maxZ=34.54
  })

  -- VBPD Garage
  exports["ab-polyzone"]:AddBoxZone("pd_shared", vector3(-1131.84, -836.9, 3.75), 37.35, 62.6, {
    heading=37,
    minZ=2.55,
    maxZ=6.75
  })

  -- Paleto PD Garage
  exports["ab-polyzone"]:AddBoxZone("pd_shared", vector3(-474.19, 6029.99, 31.34), 28.4, 12.8, {
    heading=315,
    minZ=30.24,
    maxZ=34.24
  })

  -- Courthouse PD Shared Garage
  exports["ab-polyzone"]:AddBoxZone("pd_shared", vector3(-585.92, -236.39, 35.7), 36.0, 4.4, {
    heading=30,
    minZ=34.7,
    maxZ=37.9
  })

  -- Sandy PD Shared Garage
  exports["ab-polyzone"]:AddBoxZone("pd_shared", vector3(1842.01, 3671.63, 39.64), 73.4, 20, {
    heading=300.0,
    minZ=32.33,
    maxZ=41.33
  })

  -- Beaver Bush PD Shared Garage
  exports["ab-polyzone"]:AddBoxZone("pd_shared", vector3(374.53, 795.94, 187.28), 10, 8, {
    heading= 180.0,
    minZ=186.08,
    maxZ=191.28
  })


  exports["ab-polyzone"]:AddBoxZone("ems_shared", vector3(352.26, -588.32, 74.36), 15.8, 16.4, {
    name="emschop",
    heading=330,
    minZ=73.0,
    maxZ=76.36
  })

  exports["ab-polyzone"]:AddBoxZone("ems_shared", vector3(-790.76, -1191.65, 53.03), 14.2, 13.2, {
    name="ems3",
    heading=320,
    minZ=51.03,
    maxZ=55.03
  })
  
  exports["ab-polyzone"]:AddCircleZone("doc_trash", vector3(1840.87, 2572.94, 46.01), 0.4, {
    useZ=true,
  })

  exports["ab-polyzone"]:AddCircleZone("doc_trash2", vector3(1771.26, 2497.24, 50.43), 0.4, {
    useZ=true,
  })

  exports["ab-polytarget"]:AddBoxZone("mrdp_change_picture", vector3(439.44, -985.89, 34.97), 1.0, 0.4, {
    heading=0,
    minZ=35.37,
    maxZ=36.17
  })

  exports["ab-interact"]:AddPeekEntryByPolyTarget("mrdp_change_picture", {{
      event = "ab-polce:changewhiteboardurl",
      id = 'polcechangewhiteboardurl',
      icon = "circle",
      label = "Change URL",
      parameters = {}
  }}, { distance = { radius = 2.5 } })

end)

local EVENTS = {
  LOCKERS = 1,
  CLOTHING = 2,
  SWITCHER = 3,
  EVIDENCE = 4,
  TRASH = 5,
  ARMORY = 6
}

local zoneData = {
  mrpd_clothing_lockers = {
    promptText = "[E] Lockers & Clothes",
    menuData = {
      {
        title = "Lockers",
        description = "Access your personal locker",
        action = "ab-police:handler",
        key = EVENTS.LOCKERS
      },
      {
        title = "Clothing",
        description = "Gotta look Sharp",
        action = "ab-police:handler",
        key = EVENTS.CLOTHING
      }
    }
  },
  vbpd_clothing_lockers = {
    promptText = "[E] Lockers & Clothes",
    menuData = {
      {
        title = "Lockers",
        description = "Access your personal locker",
        action = "ab-police:handler",
        key = EVENTS.LOCKERS
      },
      {
        title = "Clothing",
        description = "Gotta look Sharp",
        action = "ab-police:handler",
        key = EVENTS.CLOTHING
      }
    }
  },
  sandy_clothing_lockers = {
    promptText = "[E] Lockers & Clothes",
    menuData = {
      {
        title = "Lockers",
        description = "Access your personal locker",
        action = "ab-police:handler",
        key = EVENTS.LOCKERS
      },
      {
        title = "Clothing",
        description = "Gotta look Sharp",
        action = "ab-police:handler",
        key = EVENTS.CLOTHING
      }
    }
  },
  doc_clothing_lockers = {
    promptText = "[E] Lockers & Clothes",
    menuData = {
      {
        title = "Lockers",
        description = "Access your personal locker",
        action = "ab-police:handler",
        key = EVENTS.LOCKERS
      },
      {
        title = "Clothing",
        description = "Gotta look Sharp",
        action = "ab-police:handler",
        key = EVENTS.CLOTHING
      }
    }
  },
  mrpd_character_switcher = {
    promptText = "[E] Switch Character",
    menuData = {
      {
        title = "Character switch",
        description = "Go bowling with your cousin",
        action = "ab-police:handler",
        key = EVENTS.SWITCHER
      }
    }
  },
  vbpd_character_switcher = {
    promptText = "[E] Switch Character",
    menuData = {
      {
        title = "Character switch",
        description = "Go bowling with your cousin",
        action = "ab-police:handler",
        key = EVENTS.SWITCHER
      }
    }
  },
  sandy_character_switch_evidence_trash_armory = {
    promptText = "[E] Station Services",
    menuData = {
      {
        title = "Armory",
        description = "WEF - Weapons, Equipment, Fun!",
        action = "ab-police:handler",
        key = EVENTS.ARMORY
      },
      {
        title = "Evidence",
        description = "Drop off some evidence",
        action = "ab-police:handler",
        key = EVENTS.EVIDENCE
      },
      {
        title = "Trash",
        description = "Where Spaghetti Code belongs",
        action = "ab-police:handler",
        key = EVENTS.TRASH
      },
      {
        title = "Character switch",
        description = "Go bowling with your cousin",
        action = "ab-police:handler",
        key = EVENTS.SWITCHER
      },
    } 
  },
  mrpd_trash = {
    promptText = "[E] Trash"
  },
  vbpd_trash = {
    promptText = "[E] Trash"
  },
  mrpd_armory = {
    promptText = "[E] Armory"
  },
  vbpd_armory = {
    promptText = "[E] Armory"
  },
  doc_armory = {
    promptText = "[E] Armory"
  },
  mrpd_evidence = {
    promptText = "[E] Evidence"
  },
  vbpd_evidence = {
    promptText = "[E] Evidence"
  },
  doc_trash = {
    promptText = "[E] Trash"
  },
  doc_trash2 = {
    promptText = "[E] Trash"
  },
  paleto_clothing_lockers_character_switch_evidence_trash_armory = {
    promptText = "[E] Station Services",
    menuData = {
      {
        title = "Lockers",
        description = "Access your personal locker",
        action = "ab-police:handler",
        key = EVENTS.LOCKERS
      },
      {
        title = "Clothing",
        description = "Gotta look Sharp",
        action = "ab-police:handler",
        key = EVENTS.CLOTHING
      },
      {
        title = "Armory",
        description = "WEF - Weapons, Equipment, Fun!",
        action = "ab-police:handler",
        key = EVENTS.ARMORY
      },
      {
        title = "Evidence",
        description = "Drop off some evidence",
        action = "ab-police:handler",
        key = EVENTS.EVIDENCE
      },
      {
        title = "Trash",
        description = "Where Spaghetti Code belongs",
        action = "ab-police:handler",
        key = EVENTS.TRASH
      },
      {
        title = "Character switch",
        description = "Go bowling with your cousin",
        action = "ab-police:handler",
        key = EVENTS.SWITCHER
      },
    } 
  }
}

RegisterUICallback("ab-police:handler", function(data, cb)
  local eventData = data.key
  local location = currentPrompt ~= nil and string.match(currentPrompt, "(.-)_") or ''
  local job = exports["isPed"]:isPed("myjob")
  if eventData == EVENTS.LOCKERS and (job == "police" or job == "doc") then
    exports["ab-ui"]:hideInteraction("classic")
    Wait(500)
    local cid = exports["isPed"]:isPed("cid")
    TriggerEvent("server-inventory-open", "1", ("personalStorage-%s-%s"):format(location, cid))
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'LockerOpen', 0.4)
  elseif eventData == EVENTS.CLOTHING then
    exports["ab-ui"]:hideInteraction("classic")
    Wait(500)
    TriggerEvent("raid_clothes:openClothing", true, true)
  elseif eventData == EVENTS.SWITCHER then
    exports["ab-ui"]:hideInteraction("classic")
    isCop = false
    TransitionToBlurred(500)
    DoScreenFadeOut(500)
    Wait(1000)
    TriggerEvent("ab-base:clearStates")
    exports["ab-base"]:getModule("SpawnManager"):Initialize()
    Wait(1000)
  elseif eventData == EVENTS.EVIDENCE and (job == "police" or job == "doc") then
    TriggerEvent("server-inventory-open", "1", ("%s_evidence"):format(location))
  elseif eventData == EVENTS.TRASH and (job == "police" or job == "doc") then
    TriggerEvent("server-inventory-open", "1", ("%s_trash"):format(location))
  elseif eventData == EVENTS.ARMORY and (job == "police" or job == "doc") then
    TriggerEvent("server-inventory-open", "10", "Shop")
  end
  cb({ data = {}, meta = { ok = true, message = "done" } })
end)

local function listenForKeypress(pZone)
  listening = true
  Citizen.CreateThread(function()
    while listening do
      if IsControlJustReleased(0, 38) then
        local job = exports["isPed"]:isPed("myjob")
        if pZone == "mrpd_clothing_lockers" or pZone == "vbpd_clothing_lockers" or pZone == "sandy_clothing_lockers" or pZone == "doc_clothing_lockers" or pZone == "paleto_clothing_lockers_character_switch_evidence_trash_armory" then
          exports["ab-ui"]:showContextMenu(zoneData[pZone].menuData)
        elseif pZone == "mrpd_character_switcher" or pZone == "vbpd_character_switcher" or pZone == "sandy_character_switch_evidence_trash_armory" then
          exports["ab-ui"]:showContextMenu(zoneData[pZone].menuData)
        elseif (pZone == "mrpd_armory" or pZone == "vbpd_armory" or pZone == "doc_armory") and (job == "police" or job == "doc") then
          TriggerEvent("server-inventory-open", "10", "Shop")
        elseif pZone == "mrpd_trash" or pZone == "vbpd_trash" or pZone == "doc_trash" or pZone == "doc_trash2" and (job == "police" or job == "doc") then
          TriggerEvent("server-inventory-open", "1", pZone)
          TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'Stash', 0.4)
        elseif pZone == "mrpd_evidence" or pZone == "vbpd_evidence" and (job == "police" or job == "doc") then
          TriggerEvent("server-inventory-open", "1", pZone)
          TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'LockerOpen', 0.4)
        end
      end
      Wait(0)
    end
  end)
end

AddEventHandler("ab-polyzone:enter", function(zone)
  local currentZone = zoneData[zone]
  if zone == "mrpd_classroom" then
    if not dui then
      dui = exports["ab-lib"]:getDui(currentBoardUrl)
      AddReplaceTexture('prop_planning_b1', 'prop_base_white_01b', dui.dictionary, dui.texture)
    else
      exports["ab-lib"]:changeDuiUrl(dui.id, currentBoardUrl)
    end
    inClassRoom = true
  elseif currentZone then --and isCop
    currentPrompt = zone
    local prompt = type(currentZone.promptText) == 'function' and currentZone.promptText() or currentZone.promptText
    exports["ab-ui"]:showInteraction(prompt, "classic")
    listenForKeypress(zone)
  end
end)

AddEventHandler("ab-polyzone:exit", function(zone)
  local currentZone = zoneData[zone]
  if zone == "mrpd_classroom" then
    RemoveReplaceTexture('prop_planning_b1', 'prop_base_white_01b')
    if dui ~= nil then
      exports["ab-lib"]:releaseDui(dui.id)
      dui = nil
    end
    inClassRoom = false
  elseif currentZone then
    exports["ab-ui"]:hideInteraction("classic")
    listening = false
    currentPrompt = nil
  end
end)