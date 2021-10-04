RegisterNetEvent("mka-anchor:passedAnchor")
AddEventHandler("mka-anchor:passedAnchor", function(veh)
  isAnchored = true
  doAnchor(NetworkGetEntityFromNetworkId(veh))
end)

function setAnchor(state)
  local veh = GetVehiclePedIsIn(PlayerPedId(), true)
  if not canAnchor(veh) then
    return
  end
  isAnchored = state
  onAnchor(isAnchored)
  if isAnchored then doAnchor(veh) end
end
RegisterNetEvent("mka-anchor:setAnchor")
AddEventHandler("mka-anchor:setAnchor", setAnchor)

function toggleAnchor()
  local veh = GetVehiclePedIsIn(PlayerPedId(), true)
  if not canAnchor(veh) then
    return
  end
  isAnchored = not isAnchored
  onAnchor(isAnchored)
  if isAnchored then doAnchor(veh) end
end
RegisterNetEvent("mka-anchor:toggleAnchor")
AddEventHandler("mka-anchor:toggleAnchor", toggleAnchor)
