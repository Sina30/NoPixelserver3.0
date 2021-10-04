local GeneralEntries, SubMenu = MenuEntries['judge'], {}

local JudgeActions = {
    {
        id = 'judge-raid:checkowner',
        title = 'Check Owner',
        icon = '#judge-raid-check-owner',
        event = 'property:menuAction',
        parameters = {action = "checkOwner"}
    },
    {
        id = 'judge-raid:lockdown',
        title = 'Toggle Lockdown Property',
        icon = '#judge-raid-lock-down',
        event = 'property:menuAction',
        parameters = {action = "lockdown"}
    },
    {
        id = 'judge-raid:forfeit',
        title = 'Forfeit Property',
        icon = '#judge-raid-forfeit',
        event = 'property:menuAction',
        parameters = {action = "forfeit"}
    },
    {
        id ='judge-action:checkbank',
        title = 'Check Bank',
        icon = '#police-check-bank',
        event = 'police:checkBank'
    }
}

Citizen.CreateThread(function()
    for index, data in ipairs(JudgeActions) do
        SubMenu[index] = data.id
        MenuItems[data.id] = {data = data}
    end
    GeneralEntries[#GeneralEntries+1] = {
        data = {
            id = 'judge',
            icon = '#judge-actions',
            title = 'Judge Actions',
        },
        subMenus = SubMenu,
        isEnabled = function()
            return not isDead
        end,
    }
end)
