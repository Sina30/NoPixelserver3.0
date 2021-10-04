local listening = false
local success = false

function taskBarSkillCheck(difficulty, skillGapSent, cb)
    TriggerEvent("menu:menuexit")
    Wait(100)
    if listening then
        cb(0)
        return
    end
    listening = true
    sendAppEvent("taskbarskill", {
        display = true,
        duration = difficulty,
        difficulty = skillGapSent,
    })
    SetUIFocus(true, false)
    while listening do
        if IsPedRagdoll(GetPed()) then
            closeApplication("taskbarskill")
            listening = false
            success = false
        end
        Wait(100)
    end
    local result = success == true and 100 or 0
    if not success then
        TriggerEvent("DoLongHudText", "Failed attempt", 2)
    end
    if cb then cb(result) end
    return result
end

exports("taskBarSkill", taskBarSkillCheck)

RegisterNUICallback("ab-ui:taskBarSkillResult", function(data, cb)
    sendAppEvent("taskbarskill", { display = false })
    SetUIFocus(false, false)
    SetNuiFocus(false, false)
    listening = false
    success = data.success
    cb({ data = {}, meta = { ok = true, message = 'done' } })
end)


RegisterCommand("testskill", function()
    local test = exports["ab-ui"]:taskBarSkill(10000,math.random( 10,15 ))
    print("resSkill",test)
end)