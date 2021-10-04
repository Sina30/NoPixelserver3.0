RegisterNUICallback("dataPost", function(data, cb)
    SetNuiFocus(false)
    TriggerEvent(data.event, data.args)
    cb('ok')
    PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
end)

RegisterNUICallback("cancel", function()
    SetNuiFocus(false)
    PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
--ADD FUNCTIONS FOR THE CLOSING STUFFF FOR SCRIPTS----
    TriggerEvent("ab-context:closeglobal")
end)


RegisterNetEvent('ab-context:sendMenu', function(data)
    if not data then return end
    SetNuiFocus(true, true)
    PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    SendNUIMessage({
        action = "OPEN_MENU",
        data = data
    })
end)
