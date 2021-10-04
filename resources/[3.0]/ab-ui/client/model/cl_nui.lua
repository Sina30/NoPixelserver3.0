RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)

-- RegisterNUICallback("saveToggle", function(data,cb)
--     SetResourceKvp(data.type, tostring(data.state))
-- end)

-- RegisterNUICallback("saveColor", function(data,cb)
--     SetResourceKvp(data.type, tostring(data.color))
-- end)

-- RegisterNUICallback("resetcolor", function(data,cb)
--     SetResourceKvp('#health',"#3BB273")
--     SetResourceKvp('#armor',"#418aff")
--     SetResourceKvp('#hunger',"#D1993C")
--     SetResourceKvp('#thirst',"#4F7CAC")
--     SetResourceKvp('#stamina',"#3dc4dc")
--     SetResourceKvp('#oxygen',"#495A74")
--     SetResourceKvp('#stress',"#984447")
--     SetResourceKvp('#voice',"#FFF")
-- end)

-- function showSettings()
--     print("[ab-ui] Open Setting")
--     local toggledata = {
--         health = GetResourceKvpString('healthshow'),
--         armor = GetResourceKvpString('armorshow'),
--         hunger = GetResourceKvpString('hungershow'),
--         thirst = GetResourceKvpString('thirstshow'),
--         stamina = GetResourceKvpString('staminashow'),
--         oxygen = GetResourceKvpString('oxyshow'),
--         stress = GetResourceKvpString('stressshow'),
--         voice = GetResourceKvpString('voiceshow'),
--     }
--     Citizen.Wait(500)
--     SendNUIMessage({
--         action = "settings",
--         dataset = toggledata
--     })
--     SetNuiFocus(true, true)
-- end

-- RegisterKeyMapping("+hud","Show HUD Settings","keyboard","f3")

-- RegisterCommand("+hud", function()
--     showSettings()
-- end, false)