local GeneralEntries, SubMenu = MenuEntries['general'], {}

local Animations = {
    {
        id = 'animations:arrogant',
        title = "Arrogant",
        icon = "#animation-arrogant",
        event = "Animation:Set:Gait",
        parameters = { 'move_f@arrogant@a' }
    },
    {
        id = 'animations:casual',
        title = "Casual",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@casual@a' }
    },
    {
        id = 'animations:casual2',
        title = "Casual 2",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@casual@b' }
    },
    {
        id = 'animations:casual3',
        title = "Casual 3",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@casual@c' }
    },
    {
        id = 'animations:casual4',
        title = "Casual 4",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@casual@d' }
    },
    {
        id = 'animations:casual5',
        title = "Casual 5",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@casual@e' }
    },
    {
        id = 'animations:casual6',
        title = "Casual 6",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@casual@f' }
    },
    {
        id = 'animations:confident',
        title = "Confident",
        icon = "#animation-confident",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@confident' }
    },
    {
        id = 'animations:business',
        title = "Business",
        icon = "#animation-business",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@business@a' }
    },
    {
        id = 'animations:business2',
        title = "Business 2",
        icon = "#animation-business",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@business@b' }
    },
    {
        id = 'animations:business3',
        title = "Business 3",
        icon = "#animation-business",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@business@c' }
    },

    {
        id = 'animations:femme',
        title = "Femme",
        icon = "#animation-female",
        event = "Animation:Set:Gait",
        parameters = { 'move_f@femme@' }
    },
    {
        id = 'animations:flee',
        title = "Flee",
        icon = "#animation-flee",
        event = "Animation:Set:Gait",
        parameters = { 'move_f@flee@a' }
    },
    {
        id = 'animations:gangster',
        title = "Gangster",
        icon = "#animation-gangster",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@gangster@generic' }
    },
    {
        id = 'animations:gangster2',
        title = "Gangster 2",
        icon = "#animation-gangster",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@gangster@ng' }
    },
    {
        id = 'animations:gangster3',
        title = "Gangster 3",
        icon = "#animation-gangster",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@gangster@var_e' }
    },
    {
        id = 'animations:gangster4',
        title = "Gangster 4",
        icon = "#animation-gangster",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@gangster@var_f' }
    },
    {
        id = 'animations:gangster5',
        title = "Gangster 5",
        icon = "#animation-gangster",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@gangster@var_i' }
    },
    {
        id = 'animations:heels',
        title = "Heels",
        icon = "#animation-female",
        event = "Animation:Set:Gait",
        parameters = { 'move_f@heels@c' }
    },
    {
        id = 'animations:heels2',
        title = "Heels 2",
        icon = "#animation-female",
        event = "Animation:Set:Gait",
        parameters = { 'move_f@heels@d' }
    },
    {
        id = 'animations:hiking',
        title = "Hiking",
        icon = "#animation-hiking",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@hiking' }
    },
    {
        id = 'animations:muscle',
        title = "Muscle",
        icon = "#animation-tough",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@muscle@a' }
    },
    {
        id = 'animations:quick',
        title = "Quick",
        icon = "#animation-quick",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@quick' }
    },
    {
        id = 'animations:wide',
        title = "Wide",
        icon = "#animation-wide",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@bag' }
    },
    {
        id = 'animations:scared',
        title = "Scared",
        icon = "#animation-scared",
        event = "Animation:Set:Gait",
        parameters = { 'move_f@scared' }
    },
    {
        id = 'animations:brave',
        title = "Brave",
        icon = "#animation-brave",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@brave' }
    },
    {
        id = 'animations:tipsy',
        title = "Tipsy",
        icon = "#animation-tipsy",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@drunk@slightlydrunk' }
    },
    {
        id = 'animations:injured',
        title = "Injured",
        icon = "#animation-injured",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@injured' }
    },
    {
        id = 'animations:tough',
        title = "Tough",
        icon = "#animation-tough",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@tough_guy@' }
    },
    {
        id = 'animations:sassy',
        title = "Sassy",
        icon = "#animation-sassy",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@sassy' }
    },
    {
        id = 'animations:sad',
        title = "Sad",
        icon = "#animation-sad",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@sad@a' }
    },
    {
        id = 'animations:posh',
        title = "Posh",
        icon = "#animation-posh",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@posh@' }
    },
    {
        id = 'animations:alien',
        title = "Alien",
        icon = "#animation-alien",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@alien' }
    },
    {
        id = 'animations:nonchalant',
        title = "Nonchalant",
        icon = "#animation-nonchalant",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@non_chalant' }
    },
    {
        id = 'animations:hobo',
        title = "Hobo",
        icon = "#animation-hobo",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@hobo@a' }
    },
    {
        id = 'animations:money',
        title = "Money",
        icon = "#animation-money",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@money' }
    },
    {
        id = 'animations:swagger',
        title = "Swagger",
        icon = "#animation-swagger",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@swagger' }
    },
    {
        id = 'animations:shady',
        title = "Shady",
        icon = "#animation-shady",
        event = "Animation:Set:Gait",
        parameters = { 'move_m@shadyped@a' }
    },
    {
        id = 'animations:maneater',
        title = "Man Eater",
        icon = "#animation-maneater",
        event = "Animation:Set:Gait",
        parameters = { 'move_f@maneater' }
    },
    {
        id = 'animations:chichi',
        title = "ChiChi",
        icon = "#animation-chichi",
        event = "Animation:Set:Gait",
        parameters = { 'move_f@chichi' }
    },
    {
        id = 'animations:default',
        title = "Default",
        icon = "#animation-default",
        event = "AnimSet:default"
    }
}

Citizen.CreateThread(function()
    for index, data in ipairs(Animations) do
        SubMenu[index] = data.id
        MenuItems[data.id] = {data = data}
    end
    GeneralEntries[#GeneralEntries+1] = {
        data = {
            id = "animations",
            icon = "#walking",
            title = "Walk Style",
        },
        subMenus = SubMenu,
        isEnabled = function()
            return not isDead
        end,
    }
end)




