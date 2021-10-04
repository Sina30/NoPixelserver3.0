-- PRE SPAWN
local charSpawned = false

local pedId, plyId = PlayerPedId(), PlayerId()

function GetPed()
    return pedId
end

function GetPlayer()
    return plyId
end

Citizen.CreateThread(function()
    while not charSpawned do
        DisplayRadar(0)
        Citizen.Wait(0)
    end
end)

-- RegisterNetEvent("ab-spawn:characterSpawned")
-- AddEventHandler("ab-spawn:characterSpawned", function()
--     charSpawned = true
--     Citizen.CreateThread(function()
--         DisplayRadar(0)
--         SetRadarBigmapEnabled(true, false)
--         Citizen.Wait(0)
--         SetRadarBigmapEnabled(false, false)
--         DisplayRadar(0)
--         Citizen.Wait(0)

--         sendAppEvent("hud", {
--             display = true,
--         })
--         startHealthArmorUpdates()
--     end)
-- end)

RegisterNetEvent("timeheader")
AddEventHandler("timeheader", function(pHour, pMinutes)
    setGameValue("time", ("%s:%s"):format(pHour > 9 and pHour or "0" .. pHour, pMinutes > 9 and pMinutes or "0" .. pMinutes))
end)

RegisterNetEvent("kWeatherSync")
AddEventHandler("kWeatherSync", function(pWeather)
    setGameValue("weather", pWeather)
    setGameValue("weatherIcon", getWeatherIcon(pWeather))
end)

-- Please lua, get yourself a GOD DAMN FUCKING SWITCH CASE FUCKING IDIOT PIECE OF SHIT
function getWeatherIcon(pWeather)
    if pWeather == "EXTRASUNNY" or pWeather == "CLEAR" then
        return "sun"
    elseif pWeather == "THUNDER" then
        return "poo-storm"
    elseif pWeather == "CLEARING" or pWeather == "OVERCAST" then
        return "cloud-sun-rain"
    elseif pWeather == "CLOUD" then
        return "cloud"
    elseif pWeather == "RAIN" then
        return "cloud-rain"
    elseif pWeather == "SMOG" or pWeather == "FOGGY" then
        return "smog"
    end
end

CreateThread(function()
    while true do
        if GetPed() ~= PlayerPedId() then
            pedId = PlayerPedId()
            SetPedMinGroundTimeForStungun(pedId, 5000)
        end
        if GetPlayer() ~= PlayerId() then
            plyId = PlayerId()
            SetPlayerHealthRechargeMultiplier(plyId, 0.0)
        end
        SetPedMinGroundTimeForStungun(pedId, 5000)
        SetPlayerHealthRechargeMultiplier(plyId, 0.0)
        SetRadarBigmapEnabled(false, false)
        Wait(2000)
    end
end)

-- DISABLE BLIND FIRING
Citizen.CreateThread(function()
    while true do
        if IsPedInCover(GetPed(), 0) and not IsPedAimingFromCover(GetPed()) then
            DisablePlayerFiring(GetPed(), true)
        end
        Citizen.Wait(0)
    end
end)