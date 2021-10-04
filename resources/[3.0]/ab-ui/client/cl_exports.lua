local Events = {}

function SendUIMessage(data)
    SendNUIMessage(data)
end

exports('SendUIMessage', SendUIMessage)

function RegisterUIEvent(eventName)
    if not Events[eventName] then
        Events[eventName] = true

        RegisterNUICallback(eventName, function (...)
            TriggerEvent(('_vui_uiReq:%s'):format(eventName), ...)
        end)
    end
end

exports('RegisterUIEvent', RegisterUIEvent)

function SetUIFocusCustom(hasKeyboard, hasMouse)
    HasNuiFocus = hasKeyboard or hasMouse

    SetNuiFocus(hasKeyboard, hasMouse)
    SetNuiFocusKeepInput(HasNuiFocus)
end

exports('SetUIFocusCustom', SetUIFocusCustom)


function GetUIFocus()
    return HasFocus, HasCursor
end

exports('GetUIFocus', GetUIFocus)

Citizen.CreateThread(function()
    TriggerEvent('_vui_uiReady')
end)

function cashFlash(pCash, pChange)
    SendUIMessage({
        action = "cash",
        data = {
            cash = pCash,
            amountAdjustment = pChange
        },
    })
end

exports("cashFlash", cashFlash)

function openApplication(app, data, stealFocus)
    stealFocus = stealFocus == nil and true or false
    SendUIMessage({
        action = app,
        show = true,
        data = data or {},
    })
    if stealFocus then
        SetUIFocus(true, true)
    end
end

exports("openApplication", openApplication)

RegisterNetEvent("ab-ui:open-application")
AddEventHandler("ab-ui:open-application", openApplication)

function closeApplication(app, data)
    SendUIMessage({
        action = app,
        show = false,
        data = data or {},
    })
    SetUIFocus(false, false)
    SetNuiFocus(false, false)
    TriggerEvent("ab-ui:application-closed", app, { fromEscape = false })
end

exports("closeApplication", closeApplication)

function sendAppEvent(app, data)
    SendUIMessage({
        action = app,
        data = data or {},
    })
end

exports("sendAppEvent", sendAppEvent)