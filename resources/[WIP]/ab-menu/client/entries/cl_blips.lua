local GeneralEntries, SubMenu = MenuEntries['general'], {}

local Blips = {
    {
        id = 'blips:gasstations',
        title = "Gas Stations",
        icon = "#blips-gasstations",
        event = "CarPlayerHud:ToggleGas"
    },
    {
        id = 'blips:trainstations',
        title = "Train Stations",
        icon = "#blips-trainstations",
        event = "Trains:ToggleTainsBlip"
    },
    {
        id = 'blips:barbershop',
        title = "Barber Shop",
        icon = "#blips-barbershop",
        event = "hairDresser:ToggleHair"
    },
    {
        id = 'blips:tattooshop',
        title = "Tattoo Shop",
        icon = "#blips-tattooshop",
        event = "tattoo:ToggleTattoo"
    },
    {
        id = 'blips:fishinglocation',
        title = "Fishing Location",
        icon = "#blips-fishing",
        event = "fishing:addFishingBlip"
    },
}

Citizen.CreateThread(function()
    for index, data in ipairs(Blips) do
        SubMenu[index] = data.id
        MenuItems[data.id] = {data = data}
    end

    GeneralEntries[#GeneralEntries+1] = {
        data = {
            id = "blips",
            icon = "#blips",
            title = "Blips"
        },
        subMenus = SubMenu,
        isEnabled = function()
            return not isDead
        end,
    }
end)

