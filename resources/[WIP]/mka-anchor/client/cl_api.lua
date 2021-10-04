function onBoatTooFast(veh)
  TriggerEvent("DoLongHudText", "Going too fast to anchor!", 2)
end

function onAnchorBroke(veh)
  TriggerEvent("DoLongHudText", "Anchor broke!", 2)
end

function onAnchoring(veh)
  local vehModel = GetEntityModel(veh)
  if vehModel == nil or vehModel == 0 then
    return false
  end
  local isAmphibiousVehicle = IsThisModelABoat(vehModel) or IsThisModelAJetski(vehModel) or IsThisModelAnAmphibiousCar(vehModel) or IsThisModelAnAmphibiousQuadbike(vehModel)
  if not isAmphibiousVehicle then
    return false
  end
  local finished = exports["ab-taskbar"]:taskBar(2000, "Toggling Anchor")
  if finished ~= 100 then
      return false
  end
  return true
end

function onAnchor(active)
  if active then
    TriggerEvent("DoLongHudText", "Anchor dropped", 1)
  else
    TriggerEvent("DoLongHudText", "Anchor retrieved", 1)
  end
end
