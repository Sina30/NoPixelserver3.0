local GeneralEntries, SubMenu = MenuEntries['general'], {}

local Expressions = {
    {
        id = "expressions:angry",
        title="Angry",
        icon="#expressions-angry",
        event = "expressions",
        parameters =  { "mood_angry_1" }
    },
    {
        id = "expressions:drunk",
        title="Drunk",
        icon="#expressions-drunk",
        event = "expressions",
        parameters =  { "mood_drunk_1" }
    },
    {
        id = "expressions:dumb",
        title="Dumb",
        icon="#expressions-dumb",
        event = "expressions",
        parameters =  { "pose_injured_1" }
    },
    {
        id = "expressions:electrocuted",
        title="Electrocuted",
        icon="#expressions-electrocuted",
        event = "expressions",
        parameters =  { "electrocuted_1" }
    },
    {
        id = "expressions:grumpy",
        title="Grumpy",
        icon="#expressions-grumpy",
        event = "expressions",
        parameters =  { "mood_drivefast_1" }
    },
    {
        id = "expressions:happy",
        title="Happy",
        icon="#expressions-happy",
        event = "expressions",
        parameters =  { "mood_happy_1" }
    },
    {
        id = "expressions:injured",
        title="Injured",
        icon="#expressions-injured",
        event = "expressions",
        parameters =  { "mood_injured_1" }
    },
    {
        id = "expressions:joyful",
        title="Joyful",
        icon="#expressions-joyful",
        event = "expressions",
        parameters =  { "mood_dancing_low_1" }
    },
    {
        id = "expressions:mouthbreather",
        title="Mouthbreather",
        icon="#expressions-mouthbreather",
        event = "expressions",
        parameters = { "smoking_hold_1" }
    },
    {
        id = "expressions:normal",
        title="Normal",
        icon="#expressions-normal",
        event = "expressions:clear"
    },
    {
        id = "expressions:oneeye",
        title="One Eye",
        icon="#expressions-oneeye",
        event = "expressions",
        parameters = { "pose_aiming_1" }
    },
    {
        id = "expressions:shocked",
        title="Shocked",
        icon="#expressions-shocked",
        event = "expressions",
        parameters = { "shocked_1" }
    },
    {
        id = "expressions:sleeping",
        title="Sleeping",
        icon="#expressions-sleeping",
        event = "expressions",
        parameters = { "dead_1" }
    },
    {
        id = "expressions:smug",
        title="Smug",
        icon="#expressions-smug",
        event = "expressions",
        parameters = { "mood_smug_1" }
    },
    {
        id = "expressions:speculative",
        title="Speculative",
        icon="#expressions-speculative",
        event = "expressions",
        parameters = { "mood_aiming_1" }
    },
    {
        id = "expressions:stressed",
        title="Stressed",
        icon="#expressions-stressed",
        event = "expressions",
        parameters = { "mood_stressed_1" }
    },
    {
        id = "expressions:sulking",
        title="Sulking",
        icon="#expressions-sulking",
        event = "expressions",
        parameters = { "mood_sulk_1" },
    },
    {
        id = "expressions:weird",
        title="Weird",
        icon="#expressions-weird",
        event = "expressions",
        parameters = { "effort_2" }
    },
    {
        id = "expressions:weird2",
        title="Weird 2",
        icon="#expressions-weird2",
        event = "expressions",
        parameters = { "effort_3" }
    }
}

Citizen.CreateThread(function()
    for index, data in ipairs(Expressions) do
        SubMenu[index] = data.id
        MenuItems[data.id] = {data = data}
    end

    GeneralEntries[#GeneralEntries+1] = {
        data = {
            id = "expressions",
            icon = "#expressions",
            title = "Expressions",
        },
        subMenus = SubMenu,
        isEnabled = function ()
            return not isDead
        end,
    }
end)

