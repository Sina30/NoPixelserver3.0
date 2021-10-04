--Example

RegisterNUICallback("ab-ui:test:input", function(data, cb)
    print("ab-ui:test:input",json.encode(data))
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("guccimanecancel", function(data, cb)
    print("ab-ui:test:input",json.encode(data))
    SetNuiFocus(false)
    cb("ok")
end)

RegisterCommand("testnewkeyboard", function()
    exports['ab-ui']:openApplication('textbox', {
        callbackUrl = 'ab-ui:test:input',
        key = 1,
        items = {
            {
                icon = "fas fa-pencil-alt",
                label = "Text",
                name = "text",
            },
            {
                icon = "fas fa-palette",
                label = "Color (white, red, green, yellow, blue)",
                name = "color",
            },
            {
                icon = "fas fa-people-arrows",
                label = "Distance (0.1 - 10)",
                name = "distance",
            },
        },
    })
end)

RegisterCommand("testtaskbar", function()
    exports["ab-ui"]:sendAppEvent("taskbar", {
        display = true,
        duration = 5000,
        taskID = 1,
        label = "Test Taskbar",
    })
end)