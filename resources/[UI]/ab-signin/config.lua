Blips = {
  -- { name = "Police Station 1", id = 60, coords = vector3(425.130, -979.558, 30.711)},
  -- { name = "Police Station 2", id = 60, coords = vector3(850.156677246094, -1283.92004394531, 28.0047378540039)},
  -- { name = "Police Station 4", id = 60, coords = vector3(-450.063201904297, 6016.5751953125, 31.7163734436035)},
  -- { name = "Police Station 3", id = 60, coords = vector3(1856.91320800781, 3689.50073242188, 34.2670783996582)},
  -- { name = "Forensic HQ", id = 60, coords = vector3(638.8463134765, 1.44993293283, 82.78640747074)},
  -- { name = "Police Air HQ", id = 43, coords = vector3(449.359, -980.727, 42.60)},
  -- { name = "Prison", id = 60, coords = vector3(1679.049, 2513.711, 45.565)},
  -- { name = "Hospital", id = 61, coords = vector3(357.43, -593.36, 28.79)},
  -- { name = "Vespucci PD" , id = 60, coords = vector3(-1097.14, -829.4, 37.68)},
  -- { name = "Vespucci Hospital", id = 61, coords = vector3(-817.48, -1227.66, 17.18)}
}

EVENTS = {
  POLICE_SIGN_IN = 1,
  POLICE_SIGN_OFF = 2,
  DOC_SIGN_IN = 4,
  DOC_SIGN_OFF = 8,
  EMS_SIGN_IN = 16,
  EMS_SIGN_OFF = 32,
  EMS_VOLUNTEER_SIGN_IN = 64,
  EMS_VOLUNTEER_SIGN_OFF = 128,
  EMS_VOLUNTEER_VEHICLE = 256,
  FIRE_DEPT_SIGN_IN = 512,
  FIRE_DEPT_SIGN_OFF = 1024,
  JUDGE_SIGN_IN = 2048,
  JUDGE_SIGN_OFF = 4096,
  PUBLIC_DEFENDER_SIGN_IN = 8192,
  PUBLIC_DEFENDER_SIGN_OFF = 16384,
  DISTRICT_ATTORNEY_SIGN_IN = 32768,
  DISTRICT_ATTORNEY_SIGN_OFF = 65536
}

VOLUNTEER_VEHICLES = {
  STANDARD = 1,
  FIRETRUCK = 2
}

MenuData = {
  officer_sign_in = {
    {
      title = "Police",
      description = "Sign in or sign out",
      key = "police",
      children = {
          { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "police" } },
          { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } }
      }
    },
    {
      title = "DOC",
      description = "Sign in or sign out",
      key = "doc",
      children = {
          { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "doc" } },
          { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } }
      }
    }
  },
  ems_sign_in = {
    {
      title = "EMS",
      description = "Sign in or sign out",
      key = "ems",
      children = {
          { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "ems" } },
          { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } },
      }
    },
    {
      title = "Doctor",
      description = "Sign in or sign out",
      key = "doctor",
      children = {
          { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "doctor" } },
          { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } },
      }
    },
    {
      title = "Therapist",
      description = "Sign in or sign out",
      key = "therapist",
      children = {
          { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "therapist" } },
          { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } },
      }
    }
  },
  ems_volunteer_sign_in = {
    {
      title = "EMS Volunteer",
      description = "Sign in/out, spawn vehicle",
      key = "ems_volunteer",
      children = {
          { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "ems" } },
          { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } },
          {
            title = "Spawn Vehicle",
            key = EVENTS.EMS_VOLUNTEER_VEHICLE,
            children = {
              { title = "Ambulance", action = "ab-signin:spawnVehicle", key = VOLUNTEER_VEHICLES.STANDARD },
            }
         },
      }
    }
  },
  fire_dept_sign_in = {
    {
      title = "Fire Dept Volunteer",
      description = "Sign in/out, spawn vehicle",
      key = "fire_dept",
      children = {
          { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "ems" } },
          { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } },
          {
            title = "Spawn Vehicle",
            key = "fire_dept_vehicle",
            children = {
              { title = "Firetruck", action = "ab-signin:spawnVehicle", key = VOLUNTEER_VEHICLES.FIRETRUCK },
            }
         },
      }
    }
  },
  public_services_sign_in = {
    {
      title = "Mayor",
      description = "Sign in or sign out",
      key = "mayor",
      children = {
          { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "mayor" } },
          { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } }
      }
    },
    {
      title = "Judge",
      description = "Sign in or sign out",
      key = "judge",
      children = {
          { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "judge" } },
          { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } }
      }
    },
    {
      title = "Public Defender",
      description = "Sign in or sign out",
      key = "defender",
      children = {
        { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "defender" } },
        { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } }
      }
    },
    {
      title = "District Attorney",
      description = "Sign in or sign out",
      key = "District Attorney",
      children = {
        { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "district attorney" } },
        { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } }
      }
    }
  },
  driving_instructor_sign_in = {
    {
      title = "Driving Instructor",
      description = "Sign in or sign out",
      key = "driving_instructor",
      children = {
          { title = "Sign In", action = "ab-signin:handler", key = { sign_in = true, job = "driving instructor" } },
          { title = "Sign Out", action = "ab-signin:handler", key = { sign_off = true } },
      }
    }
  }
}

VEHICLE_SPAWN_LOCATIONS = {
  vector3(-475.67788696289,-356.32354736328, 34.100078582764),
  vector3(364.68, -590.98, 28.69),
  vector3(218.34973144531, -1637.6884765625, 29.425844192505),
  vector3(-1182.3208007813, -1773.2825927734, 3.9084651470184),
  vector3(1198.3963623047, -1455.646484375, 34.967601776123),
  vector3(-843.68, -1229.8, 6.94) -- Vespucci Hospital
}