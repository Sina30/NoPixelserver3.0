
MenuData = {
  apartment_check = {
    {
      title = "Apartment",
      description = "Forclose Apartment",
      key = "judge",
      children = {
          { title = "Yes", action = "ab-apartments:handler", key = { forclose = true} },
          { title = "No", action = "ab-apartments:handler", key = { forclose = false } },
      }
    }
  }
}
