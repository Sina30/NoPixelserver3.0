-- Binds that are used globaly and do not fit in a single resouce
-- All Binds should use the event name and bool

Citizen.CreateThread(function()

    RegisterCommand('+showPlayerList', function() end, false)
    RegisterCommand('-showPlayerList', function() end, false)
    exports["ab-binds"]:registerKeyMapping("PlayerList", "Player", "View Online Players", "+showPlayerList", "-showPlayerList", "U", true)

    RegisterCommand('+generalUse', function() end, false)
    RegisterCommand('-generalUse', function() end, false)
    exports["ab-binds"]:registerKeyMapping("general", "Player", "General Use", "+generalUse", "-generalUse", "E", true)

    RegisterCommand('+housingMain', function() end, false)
    RegisterCommand('-housingMain', function() end, false)
    exports["ab-binds"]:registerKeyMapping("housingMain", "Housing", "Housing Main", "+housingMain", "-housingMain", "H", true)

    RegisterCommand('+housingSecondary', function() end, false)
    RegisterCommand('-housingSecondary', function() end, false)
    exports["ab-binds"]:registerKeyMapping("housingSecondary", "Housing", "Housing Secondary", "+housingSecondary", "-housingSecondary", "G", true)

    RegisterCommand('+generalUseThird', function() end, false)
    RegisterCommand('-generalUseThird', function() end, false)
    exports["ab-binds"]:registerKeyMapping("generalUseThird", "Player", "General Use Third", "+generalUseThird", "-generalUseThird", "G", true)
end)

-- disable pause
Citizen.CreateThread(function()
	while true do
		DisableControlAction(1, 199, true)
		Wait(5)
	end
end)
