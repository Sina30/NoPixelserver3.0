ABX.Commands = ABX.Commands or {}

RegisterNetEvent("ab-commands:meCommand")
AddEventHandler("ab-commands:meCommand",
    function(user, msg)
        local monid = PlayerId()
        local sonid = GetPlayerFromServerId(user)
        print('using lol')
          if sonid ~= -1 then
            if
                #(GetEntityCoords(GetPlayerPed(monid)) - GetEntityCoords(GetPlayerPed(sonid))) < 8.0 and
                    HasEntityClearLosToEntity(GetPlayerPed(monid), GetPlayerPed(sonid), 17)
            then
                TriggerEvent("DoHudTextCoords", msg, GetPlayerPed(sonid))
            end
        end
    end)

 AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    TriggerServerEvent("ab-commands:buildCommands","")
  end)