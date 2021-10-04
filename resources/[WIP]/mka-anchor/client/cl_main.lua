isAnchored = false

local function calculateForce(veh, toVector, dist)
  local dir = toVector / dist
  local distanceFactor = dir * (dist + 3.0) ^ 3
  local speedFactor = math.min(GetEntitySpeed(veh), 2.0) * 0.10
  return distanceFactor * math.max(speedFactor, 0.25)
end

local function isStillOwner(veh, serverId)
  local currentOwnerPlayerId = NetworkGetEntityOwner(veh)
  local currentOwnerNetworkId = GetPlayerServerId(currentOwnerPlayerId)
  if currentOwnerPlayerId == -1 then
    return false
  end
  if currentOwnerNetworkId ~= serverId then
    TriggerServerEvent("mka-anchor:passAnchor", currentOwnerNetworkId, NetworkGetNetworkIdFromEntity(veh))
    return false
  end
  return true
end

function canAnchor(veh)
  if not DoesEntityExist(veh) then
    return false
  end
  if GetEntitySpeed(veh) > config.maxAnchoringSpeed then
    onBoatTooFast(veh)
    return false
  end
  local success = onAnchoring(veh)
  if not success then
    return false
  end
  return true
end

function doAnchor(veh)
  local anchorPos = GetEntityCoords(veh)
  local lastMagnitude = 0.0
  local serverId = GetPlayerServerId(PlayerId())
  CreateThread(function()
    while isAnchored do
      if not isStillOwner(veh, serverId) then
        isAnchored = false
        return
      end
      local toVector = anchorPos - GetEntityCoords(veh)
      local dist = #(toVector)
      if dist > config.minAnchorDriftDistance then
        local force = calculateForce(veh, toVector, dist)
        local magnitude = #force
        ApplyForceToEntityCenterOfMass(veh, 1, force.x, force.y, 0.0, false, false, false)
        local exceedsBreakingForce = lastMagnitude > config.breakingForce and magnitude < lastMagnitude
        if dist > 20.0 or exceedsBreakingForce then
          isAnchored = false
          onAnchorBroke(veh)
          return
        end
        lastMagnitude = magnitude
      end
      Wait(0)
    end
  end)
end
