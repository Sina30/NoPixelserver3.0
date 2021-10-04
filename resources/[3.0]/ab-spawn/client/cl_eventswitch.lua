function Login.playerLoaded() end

function Login.characterLoaded()
  -- Main events leave alone 
  TriggerEvent("ab-base:playerSpawned")
  TriggerEvent("playerSpawned")
  TriggerServerEvent('character:loadspawns')
  TriggerEvent("ab-base:initialSpawnModelLoaded")
  -- Main events leave alone 

  TriggerEvent("Relog")

  -- Everything that should trigger on character load 
  TriggerServerEvent('checkTypes')
  TriggerServerEvent('isVip')
  TriggerEvent('rehab:changeCharacter')
  TriggerEvent("resetinhouse")
  TriggerEvent("fx:clear")
  TriggerServerEvent('tattoos:retrieve') -- HEY THIS DOESN'T WORK RIGHT.
  TriggerServerEvent("raid_clothes:retrieve_tats")
  TriggerServerEvent('Blemishes:retrieve')
  TriggerServerEvent("currentconvictions")
  TriggerServerEvent("GarageData")
  TriggerServerEvent("Evidence:checkDna")
  TriggerEvent("banking:viewBalance")
  TriggerServerEvent("police:getLicensesCiv")
  TriggerServerEvent('ab-doors:requestlatest')
  TriggerServerEvent("item:UpdateItemWeight")
  TriggerServerEvent("ab-weapons:getAmmo")
  TriggerServerEvent("ReturnHouseKeys")
  TriggerServerEvent("requestOffices")
  Wait(500)
  TriggerServerEvent("police:getAnimData")
  TriggerServerEvent("police:getEmoteData")
  TriggerServerEvent("police:SetMeta")
  TriggerServerEvent('ABX-scoreboard:AddPlayer')
  TriggerServerEvent("ab-base:PolyZoneUpdate")
  TriggerServerEvent("retreive:licenes:server")
  -- Anything that might need to wait for the client to get information, do it here.
  Wait(3000)
  TriggerServerEvent("bones:server:requestServer")
  TriggerEvent("apart:GetItems")

  Wait(4000)
  TriggerServerEvent('distillery:getDistilleryLocation')
  TriggerServerEvent("retreive:jail",exports["isPed"]:isPed("cid"))	
  TriggerServerEvent("bank:getLogs")
end

function Login.characterSpawned()

  isNear = false
  TriggerServerEvent('ab-base:sv:player_control')
  TriggerServerEvent('ab-base:sv:player_settings')

  TriggerServerEvent("TokoVoip:clientHasSelecterCharacter")
  TriggerEvent("spawning", false)
  TriggerEvent("attachWeapons")
  TriggerEvent("tokovoip:onPlayerLoggedIn", true)


  TriggerServerEvent("request-dropped-items")
  TriggerServerEvent("server-request-update", exports["isPed"]:isPed("cid"))
  TriggerServerEvent("stocks:retrieveclientstocks")

  if Spawn.isNew then
      Wait(1000)
      if not exports["ab-inventory"]:hasEnoughOfItem("mobilephone", 1, false) then
          TriggerEvent("player:receiveItem", "mobilephone", 1)
      end
      if not exports["ab-inventory"]:hasEnoughOfItem("idcard", 1, false) then
          TriggerEvent("player:receiveItem", "idcard", 1)
      end

      -- commands to make sure player is alive and full food/water/health/no injuries
      local src = GetPlayerServerId(PlayerId())
      TriggerServerEvent("reviveGranted", src)
      TriggerEvent("Hospital:HealInjuries", src, true)
      TriggerServerEvent("ems:healplayer", src)
      TriggerEvent("heal", src)
      TriggerEvent("status:needs:restore", src)

      TriggerServerEvent("ab-spawn:newPlayerFullySpawned")
  end
  SetPedMaxHealth(PlayerPedId(), 200)
  --SetPlayerMaxArmour(PlayerId(), 100) -- This is setting players armor on relog??
  runGameplay() -- moved from ab-base 
  Spawn.isNew = false
end
RegisterNetEvent("ab-spawn:characterSpawned");
AddEventHandler("ab-spawn:characterSpawned", Login.characterSpawned);
