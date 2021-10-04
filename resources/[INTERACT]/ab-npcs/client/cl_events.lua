RegisterNetEvent("ab-npcs:set:ped")
AddEventHandler("ab-npcs:set:ped", function(pNPCs)
  if type(pNPCs) == "table" then
    for _, ped in ipairs(pNPCs) do
      RegisterNPC(ped, 'ab-npcs')
      EnableNPC(ped.id)
    end
  else
    RegisterNPC(ped, 'ab-npcs')
    EnableNPC(ped.id)
  end
end)

RegisterNetEvent("ab-npcs:ped:giveStolenItems")
AddEventHandler("ab-npcs:ped:giveStolenItems", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local npcCoords = GetEntityCoords(pEntity)
  local finished = exports["ab-taskbar"]:taskBar(15000, "Preparing to receive goods, don't move.")
  if finished == 100 then
    if #(GetEntityCoords(PlayerPedId()) - npcCoords) < 2.0 then
      TriggerEvent("server-inventory-open", "1", "Stolen-Goods-1")
    else
      TriggerEvent("DoLongHudText", "You moved too far you idiot.", 105)
    end
  end
end)

RegisterNetEvent("ab-npcs:ped:exchangeRecycleMaterial")
AddEventHandler("ab-npcs:ped:exchangeRecycleMaterial", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local npcCoords = GetEntityCoords(pEntity)
  local finished = exports["ab-taskbar"]:taskBar(3000, "Preparing to exchange material, don't move.")
  if finished == 100 then
    if #(GetEntityCoords(PlayerPedId()) - npcCoords) < 2.0 then
      TriggerEvent("server-inventory-open", "35", "Craft");
    else
      TriggerEvent("DoLongHudText", "You moved too far you idiot.", 105)
    end
  end
end)

RegisterNetEvent("ab-npcs:ped:signInJob")
AddEventHandler("ab-npcs:ped:signInJob", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  if #pArgs == 0 then
    local npcId = DecorGetInt(pEntity, 'NPC_ID')
    if npcId == `news_reporter` then
      TriggerServerEvent("jobssystem:jobs", "news")
    elseif npcId == `head_stripper` then
      TriggerServerEvent("jobssystem:jobs", "entertainer")
    end
  else
    TriggerServerEvent("jobssystem:jobs", "unemployed")
  end
end)

RegisterNetEvent("ab-npcs:ped:paycheckCollect")
AddEventHandler("ab-npcs:ped:paycheckCollect", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  TriggerServerEvent("server:paySlipPickup")
end)

RegisterNetEvent("ab-npcs:ped:receiptTradeIn")
AddEventHandler("ab-npcs:ped:receiptTradeIn", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local cid = exports["isPed"]:isPed("cid")
  local accountStatus, accountTarget = RPC.execute("GetDefaultBankAccount", cid)
  if not accountStatus then return end
  RPC.execute("ab-inventory:tradeInReceipts", cid, accountTarget)
end)

RegisterNetEvent("ab-npcs:ped:sellStolenItems")
AddEventHandler("ab-npcs:ped:sellStolenItems", function()
  RPC.execute("ab-inventory:sellStolenItems")
end)

RegisterNetEvent("ab-npcs:ped:keeper")
AddEventHandler("ab-npcs:ped:keeper", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  TriggerEvent("server-inventory-open", pArgs[1], "Shop");
end)


TriggerServerEvent("ab-npcs:location:fetch")

AddEventHandler("ab-npcs:ped:weedSales", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local result, message = RPC.execute("ab-npcs:weedShopOpen")
  if not result then
    TriggerEvent("DoLongHudText", message, 2)
    return
  end
  TriggerEvent("server-inventory-open", "44", "Shop");
end)

AddEventHandler("ab-npcs:ped:licenseKeeper", function()
  RPC.execute("ab-npcs:purchaseDriversLicense")
end)

AddEventHandler("ab-npcs:ped:openDigitalDenShop", function()
  TriggerEvent("server-inventory-open", "42073", "Shop")
end)
RegisterNetEvent("ab-npcs:ped:giveidcard")
AddEventHandler("ab-npcs:ped:giveidcard", function()
  RPC.execute("ab-npcs:idcard")
end)

RegisterNetEvent("ab-npcs:ped:garbagejob")
AddEventHandler("ab-npcs:ped:garbagejob", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  RPC.execute("ab-npcs:GarbageVals")
end)


