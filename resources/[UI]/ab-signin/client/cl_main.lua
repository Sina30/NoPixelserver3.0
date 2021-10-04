CreateThread(function()
  -- for _, item in pairs(Blips) do
  --   item.blip = AddBlipForCoord(item.coords)
  --   SetBlipSprite(item.blip, item.id)
  --   SetBlipScale(item.blip, 0.8)
  --   SetBlipColour(item.blip, 3)
  --   SetBlipAsShortRange(item.blip, true)
  --   BeginTextCommandSetBlipName("STRING")
  --   AddTextComponentString(item.name)
  --   EndTextCommandSetBlipName(item.blip)
  -- end

  SetScenarioTypeEnabled("WORLD_VEHICLE_STREETRACE", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_SALTON_DIRT_BIKE", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_SALTON", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_NEXT_TO_CAR", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_CAR", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_POLICE_BIKE", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_MILITARY_PLANES_SMALL", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_MILITARY_PLANES_BIG", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_MECHANIC", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_EMPTY", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_BUSINESSMEN", false)
  SetScenarioTypeEnabled("WORLD_VEHICLE_BIKE_OFF_ROAD_RACE", false)

  -- MRPD
  exports["ab-polytarget"]:AddBoxZone("officer_sign_in", vector3(441.83, -982.05, 30.69), 0.5, 0.35, {
    heading=12,
    minZ=30.79,
    maxZ=30.84
  })

  -- Popular Street PD
  exports["ab-polyzone"]:AddCircleZone("officer_sign_in", vector3(827.2, -1290.18, 28.25), 0.5, {
    useZ = true
  })

  -- Sandy PD
  exports["ab-polytarget"]:AddCircleZone("officer_sign_in", vector3(1853.78, 3690.95, 34.28), 0.3, {
    useZ=true,
  })

  -- Paleto PD
  exports["ab-polytarget"]:AddCircleZone("officer_sign_in", vector3(-450.41, 6012.82, 31.72), 0.3, {
    useZ=true,
  })

  -- VB PD
  exports["ab-polytarget"]:AddCircleZone("officer_sign_in", vector3(-1083.61, -810.31, 19.3), 0.3, {
    useZ = true
  })

  -- Prison
  exports["ab-polytarget"]:AddCircleZone("officer_sign_in", vector3(1840.22, 2584.38, 46.01), 0.44, {
    useZ = true
  })

  -- EMS Pillbox
  exports["ab-polytarget"]:AddBoxZone("ems_sign_in", vector3(310.24, -597.54, 43.28), 0.35, 0.25, {
    heading=331,
    minZ=43.28,
    maxZ=43.33
  })

  -- EMS Dorset
  exports["ab-polyzone"]:AddCircleZone("ems_sign_in", vector3(-497.31, -335.48, 34.51), 1.0, {
    useZ = true
  })

  -- EMS Vespucci
  exports["ab-polytarget"]:AddBoxZone("ems_sign_in", vector3(-815.28, -1240.17, 7.34), 0.35, 0.25, {
    heading=310,
    minZ=7.34,
    maxZ=7.39
  })

  -- EMS Volunteer Pillbox
  exports["ab-polytarget"]:AddBoxZone("ems_volunteer_sign_in", vector3(350.25, -587.67, 28.8), 0.85, 0.8, {
    heading=340,
    minZ=28.4,
    maxZ=28.8
  })

  -- Fire Dept
  exports["ab-polyzone"]:AddCircleZone("fire_dept_sign_in", vector3(204.23, -1642.16, 29.81), 1.0, {
    useZ = true
  })

  -- Fire Dept
  exports["ab-polyzone"]:AddCircleZone("fire_dept_sign_in", vector3(1193.58, -1467.42, 34.86), 1.0, {
    useZ = true
  })

  exports["ab-polytarget"]:AddCircleZone("public_services_sign_in", vector3(-553.09, -192.81, 38.22), 0.3, {
    useZ=true
  })

  exports["ab-polytarget"]:AddCircleZone("driving_instructor_sign_in", vector3(-36.2, -206.96, 45.79), 0.4, {
    useZ=true
  })

end)

function findClosestSpawnPoint(pCurrentPosition)
  local closestDistance = -1
  local closestCoord = pCurrentPosition
  for _, location in ipairs(VEHICLE_SPAWN_LOCATIONS) do
    local distance = #(location - pCurrentPosition)
    if closestDistance == -1 or closestDistance > distance then
      closestDistance = distance
      closestCoord = location
    end
  end
  return closestCoord
end