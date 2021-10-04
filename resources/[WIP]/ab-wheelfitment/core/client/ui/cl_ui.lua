--[[
cl_ui.lua
]]

--#[Global Variables]#--
currentItems = nil
previousItems = nil
isMenuShowing = false

--#[Global Functions]#--
function Draw3DText(x, y, z, str, r, g, b, a, font, scaleSize, enableProportional, enableCentre, enableOutline, enableShadow, sDist, sR, sG, sB, sA)
    local onScreen, worldX, worldY = World3dToScreen2d(x, y, z)
    local gameplayCamX, gameplayCamY, gameplayCamZ = table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(1.0, scaleSize)
        SetTextFont(font)
        SetTextColour(r, g, b, a)
        SetTextEdge(2, 0, 0, 0, 150)

        if enableProportional then
            SetTextProportional(1)
        end

        if enableOutline then
            SetTextOutline()
        end

        if enableShadow then
            SetTextDropshadow(sDist, sR, sG, sB, sA)
            SetTextDropShadow()
        end

        if enableCentre then
            SetTextCentre(1)
        end
        
        SetTextEntry("STRING")
        AddTextComponentString(str)
        DrawText(worldX, worldY)
    end
end

function ToggleMenu(state)
    SendNUIMessage({
        toggleMenu = true,
        state = state
    })
end

function CreateMenu(structure)
    SendNUIMessage({
        createMenu = true,
        structure = structure
    })
end

function DestroyMenu()
    SendNUIMessage({
        destroyMenu = true
    })
end

function AddMenu(structure)
    SendNUIMessage({
        addMenu = true,
        structure = structure
    })
end

function RemoveMenu(menu)
    SendNUIMessage({
        removeMenu = true,
        menu = menu
    })
end

function SwitchMenu(menu)
    SendNUIMessage({
        switchMenu = true,
        menu = menu
    })
end

function UpdateMenuStatus(text)
    SendNUIMessage({
        updateMenuStatus = true,
        textData = text
    })
end

function UpdateItemSliderItems(menu, item, name, sliderItems)
    SendNUIMessage({
        updateItemSliderItems = true,
        menu = menu,
        item = item,
        name = name,
        sliderItems = sliderItems
    })
end

function UpdateItemSlider(menu, item, name, sliderPos)
    SendNUIMessage({
        updateItemSlider = true,
        menu = menu,
        item = item,
        name = name,
        sliderPos = sliderPos
    })
end

function UpdateItemText(menu, item, name, label)
    SendNUIMessage({
        updateItemText = true,
        menu = menu,
        item = item,
        name = name,
        label = label
    })
end

function ScrollFunctionality(direction)
    SendNUIMessage({
        scrollFunctionality = true,
        direction = direction
    })
end

function DisplayMenu(state, slider1, slider2, slider3, slider4, slider5, startPos)
    if state then
        if not isMenuShowing then
            local structure = 
            {
                {
                    menu = "mainMenu",
                    heading = "6STR Tuner Shop",
                    subheading = "Adjust Wheel Fitment",
                    items = 
                    {
                        {name = "w_width", type_1 = "normal", label_1 = "Wheels Width", sliderItems_1 = {}, type_2 = "slider", label_2 = "", sliderItems_2 = slider1, sliderStartPos = startPos[1]},
                        {name = "w_fl", type_1 = "normal", label_1 = "Wheel Front Left", sliderItems_1 = {}, type_2 = "slider", label_2 = "", sliderItems_2 = slider2, sliderStartPos = startPos[2]},
                        {name = "w_fr", type_1 = "normal", label_1 = "Wheel Front Right", sliderItems_1 = {}, type_2 = "slider", label_2 = "", sliderItems_2 = slider3, sliderStartPos = startPos[3]},
                        {name = "w_rl", type_1 = "normal", label_1 = "Wheel Rear Left", sliderItems_1 = {}, type_2 = "slider", label_2 = "", sliderItems_2 = slider4, sliderStartPos = startPos[4]},
                        {name = "w_rr", type_1 = "normal", label_1 = "Wheel Rear Right", sliderItems_1 = {}, type_2 = "slider", label_2 = "", sliderItems_2 = slider5, sliderStartPos = startPos[5]}
                    }
                },
                {
                    menu = "exitConfirmation",
                    heading = "Are you sure you want to exit?",
                    subheading = "Choose Yes or No",
                    items = 
                    {
                        {name = "no", type_1 = "normal", label_1 = "No", type_2 = "normal", label_2 = ""},
                        {name = "yes", type_1 = "normal", label_1 = "Yes", type_2 = "normal", label_2 = ""}
                    }
                }
            }

            CreateMenu(structure)
            ToggleMenu(state)
            PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)

            isMenuShowing = true

            Citizen.CreateThread(function()
                while isMenuShowing do 
                    DisableControlAction(1, 172, true) --Key: Up Arrow
                    DisableControlAction(1, 173, true) --Key: Down Arrow
                    DisableControlAction(1, 174, true) --Key: Left Arrow
                    DisableControlAction(1, 175, true) --Key: Right Arrow
                    DisableControlAction(1, 177, true) --Key: Backspace
                    DisableControlAction(1, 176, true) --Key: Enter
        
                    if IsDisabledControlPressed(1, 172) then --Key: Arrow Up
                        ScrollFunctionality("up")
                        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        
                        Citizen.Wait(0)
        
                        MenuManager("arrowup")
        
                        Citizen.Wait(149)
                    end
        
                    if IsDisabledControlPressed(1, 173) then --Key: Arrow Down
                        ScrollFunctionality("down")
                        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        
                        Citizen.Wait(0)
        
                        MenuManager("arrowdown")
        
                        Citizen.Wait(149)
                    end
        
                    if IsDisabledControlPressed(1, 174) then --Key: Arrow Left
                        ScrollFunctionality("left")
                        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        
                        Citizen.Wait(0)
        
                        MenuManager("arrowleft")
        
                        Citizen.Wait(149)
                    end
        
                    if IsDisabledControlPressed(1, 175) then --Key: Arrow Right
                        ScrollFunctionality("right")
                        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        
                        Citizen.Wait(0)
        
                        MenuManager("arrowright")
        
                        Citizen.Wait(149)
                    end
        
                    if IsDisabledControlJustReleased(1, 176) then --Key: Enter
                        MenuManager("enter")
                        PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                    end
        
                    if IsDisabledControlJustReleased(1, 177) then --Key: Backspace
                        MenuManager("backspace")
                        PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                    end
                    
                    Citizen.Wait(1)
                end
            end)
        end
    else
        if isMenuShowing then
            ToggleMenu(state)
            DestroyMenu()

            isMenuShowing = false
        end
    end
end

function MenuManager(input)
    if currentItems ~= nil then
        if input == "enter" then
            if currentItems.menu == "exitConfirmation" then
                if currentItems.item == "yes" then
                    SyncWheelFitment()
                    DisplayMenu(false)
                elseif currentItems.item == "no" then
                    SwitchMenu("mainMenu")
                end
            end
        elseif input == "backspace" then
            if currentItems.menu == "mainMenu" then
                SwitchMenu("exitConfirmation")
            elseif currentItems.menu == "exitConfirmation" then
                SyncWheelFitment()
                DisplayMenu(false)
            end
        elseif input == "arrowup" then

        elseif input == "arrowdown" then

        elseif input == "arrowleft" then
            if currentItems.menu == "mainMenu" then
                if currentItems.item == "w_width" then
                    AdjustWheelFitment(false, currentItems.item, tonumber(currentItems.label_2))
                else
                    AdjustWheelFitment(true, currentItems.item, tonumber(currentItems.label_2))
                end
            end
        elseif input == "arrowright" then
            if currentItems.menu == "mainMenu" then
                if currentItems.item == "w_width" then
                    AdjustWheelFitment(false, currentItems.item, tonumber(currentItems.label_2))
                else
                    AdjustWheelFitment(true, currentItems.item, tonumber(currentItems.label_2))
                end
            end
        end
    end
end

--#[Local Functions]#--
local function stringSplit(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end

    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end

    return t
end

--#[NUI Callbacks]#--
RegisterNUICallback("currentItem", function(data, cb)
    if data.type_1 == "slider" then
        local split = stringSplit(data.item_1, " ")
        local final = ""

        for i = 2, #split - 1 do
            final = final .. " " .. split[i]
        end

        data.item_1 = final
    elseif data.type_2 == "slider" then
        local split = stringSplit(data.item_2, " ")
        local final = ""

        for i = 2, #split - 1 do
            final = final .. " " .. split[i]
        end

        data.item_2 = final
    end

    if currentItems == nil then
        currentItems = 
        {
            menu = data.menu,
            item = data.name,
            label_1 = data.item_1,
            label_2 = data.item_2,
            type_1 = data.type_1,
            type_2 = data.type_2
        }

        previousItems = currentItems
    else
        previousItems = currentItems

        currentItems = 
        {
            menu = data.menu,
            item = data.name,
            label_1 = data.item_1,
            label_2 = data.item_2,
            type_1 = data.type_1,
            type_2 = data.type_2
        }
    end
    cb("ok")
end)

RegisterNUICallback("switchedMenuSuccessfully", function(data, cb)
    if data.type_1 == "slider" then
        local split = stringSplit(data.item_1, " ")
        local final = ""

        for i = 2, #split - 1 do
            final = final .. " " .. split[i]
        end

        data.item_1 = final
    elseif data.type_2 == "slider" then
        local split = stringSplit(data.item_2, " ")
        local final = ""

        for i = 2, #split - 1 do
            final = final .. " " .. split[i]
        end

        data.item_2 = final
    end
    cb("ok")
end)
