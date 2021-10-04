Citizen.CreateThread(function()
	RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(0)
	end

    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
    AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "circlemap", "radarmasksm")

	SetMinimapClipType(1)
    SetMinimapComponentPosition("minimap", "L", "B", -0.0180, -0.030, 0.180, 0.258)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.2, 0.0, 0.065, 0.20)
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.015, -0.010, 0.252, 0.280)
    SetBlipAlpha(GetNorthRadarBlip(), 0.0)
    SetMinimapClipType(1)
    DisplayRadar(0)
    SetRadarBigmapEnabled(true, false)
    Citizen.Wait(0)
    SetRadarBigmapEnabled(false, false)
    DisplayRadar(1)
end)


Citizen.CreateThread(function()
    Citizen.Wait(1500)
    while true do
        --DontTiltMinimapThisFrame()
        HideMinimapInteriorMapThisFrame()
        SetRadarZoom(1000)
        Citizen.Wait(0)
    end
end)

-- local pauseActive = false
-- Citizen.CreateThread(function()
--     Citizen.Wait(1500)
--     while true do
--         Citizen.Wait(50)
--         local player = PlayerPedId()
--         SetRadarZoom(1000)
--         SetRadarBigmapEnabled(false, false)
--         local isPMA = IsPauseMenuActive()
--         if isPMA and not pauseActive or IsRadarHidden() then 
--             pauseActive = true 
--             SendNUIMessage({
--                 action = "hideUI"
--             })
--             uiHidden = true
--         elseif not isPMA and pauseActive then
--             pauseActive = false
--             SendNUIMessage({
--                 action = "displayUI"
--             })
--             uiHidden = false
--         end
--     Citizen.Wait(0)
--     end
-- end)