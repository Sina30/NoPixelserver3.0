ABX.Admin.Menu = {}
ABX._Admin.Menu = {}
ABX._Admin.Menu.PlayerOptions = {}
ABX._Admin.Menu.SearchOptions = {
    type = nil,
    data = nil
}
ABX._Admin.Menu.Target = {}

ABX._Admin.Menu.DevMode = false
ABX._Admin.Menu.DevDebug = false

function ABX.Admin.Menu.Init(self)
    WarMenu.CreateMenu("amenu", "Admin Menu")
    WarMenu.SetSubTitle("amenu", "Options")

    WarMenu.SetMenuWidth("amenu", 0.5)
    WarMenu.SetMenuX("amenu", 0.71)
    WarMenu.SetMenuY("amenu", 0.017)
    WarMenu.SetMenuMaxOptionCountOnScreen("amenu", 30)
    WarMenu.SetTitleColor("amenu", 135, 206, 250, 255)
    WarMenu.SetTitleBackgroundColor("amenu", 0 , 0, 0, 150)
    WarMenu.SetMenuBackgroundColor("amenu", 0, 0, 0, 100)
    WarMenu.SetMenuSubTextColor("amenu", 255, 255, 255, 255)

    local function SetDefaultSubMenuProperties(menu)
        WarMenu.SetMenuWidth(menu, 0.5)
        WarMenu.SetTitleColor(menu, 135, 206, 250, 255)
        WarMenu.SetTitleBackgroundColor(menu, 0 , 0, 0, 150)
        WarMenu.SetMenuBackgroundColor(menu, 0, 0, 0, 100)
        WarMenu.SetMenuSubTextColor(menu, 255, 255, 255, 255)
    end

    WarMenu.CreateSubMenu("aplayers", "amenu", "Player List")
    SetDefaultSubMenuProperties("aplayers")

    WarMenu.CreateSubMenu("adplayers", "amenu", "Disconnected Player List")
    SetDefaultSubMenuProperties("adplayers")

    WarMenu.CreateSubMenu("aplayeropts", "amenu", "Player Info")
    SetDefaultSubMenuProperties("aplayeropts")

    WarMenu.CreateSubMenu("acommands", "amenu", "Commands")
    SetDefaultSubMenuProperties("acommands")

    WarMenu.CreateSubMenu("aDev", "amenu", "Dev Toggle")
    SetDefaultSubMenuProperties("aDev")

    WarMenu.CreateSubMenu("acategories", "amenu", "Categories")
    SetDefaultSubMenuProperties("acategories")

    WarMenu.CreateSubMenu("asearch", "amenu", "Searching")
    SetDefaultSubMenuProperties("asearch")

    WarMenu.CreateSubMenu("targetmenu", "amenu", "Available Targets")
    SetDefaultSubMenuProperties("targetmenu")

    WarMenu.CreateSubMenu("jobmenu", "amenu", "Available Jobs")
    SetDefaultSubMenuProperties("jobmenu")

    WarMenu.CreateSubMenu("ranklist", "amenu", "Ranks")
    SetDefaultSubMenuProperties("ranklist")

    WarMenu.CreateSubMenu("command", "amenu", "Command Options")
    SetDefaultSubMenuProperties("command")

    WarMenu.CreateSubMenu("searchopts", "amenu", "Search Options")
    SetDefaultSubMenuProperties("searchopts")
end

function ABX.Admin.Menu.SetSubMenuProperties(self, menu)
    WarMenu.SetMenuWidth(menu, 0.5)
    WarMenu.SetTitleColor(menu, 135, 206, 250, 255)
    WarMenu.SetTitleBackgroundColor(menu, 0 , 0, 0, 150)
    WarMenu.SetMenuBackgroundColor(menu, 0, 0, 0, 100)
    WarMenu.SetMenuSubTextColor(menu, 255, 255, 255, 255)
end

function ABX.Admin.Menu.DrawCommand(self, cmd)
    if not cmd or not ABX.Admin:CommandExists(cmd) then return end

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if WarMenu.IsMenuOpened("command") then ABX.Admin:GetCommandData(cmd).drawcommand() else return end
            if WarMenu.MenuButton("Back", "acommands") then return end
        end
    end)
end

function ABX.Admin.Menu.DrawTargets(self, cmd, cb)
    WarMenu.OpenMenu("targetmenu")

    Citizen.CreateThread(function()
        while WarMenu.IsMenuOpened("targetmenu") do
            Citizen.Wait(0)
            for k,v in spairs(ABX._Admin.Players, function(t, a, b) return t[a].source < t[b].source end) do
                if WarMenu.MenuButton("[" .. v.source .. "] " .. v.name, "command") then self:DrawCommand(cmd) cb(v) ABX.Admin:GetCommandData(cmd).drawcommand() return end
            end
            if WarMenu.MenuButton("Back", "command") then self:DrawCommand(cmd) ABX.Admin:GetCommandData(cmd).drawcommand() return end
        end
    end)
end

function ABX.Admin.Menu.DrawJobs(self, cmd, cb)
    WarMenu.OpenMenu("jobmenu")
    local jobs = exports["ab-base"]:getModule("JobManager").ValidJobs;
    Citizen.CreateThread(function()
        while WarMenu.IsMenuOpened("jobmenu") do
            Citizen.Wait(0)
            for k,v in spairs(jobs, function(t, a, b) return t[a].name < t[b].name end) do
                if WarMenu.MenuButton("[" .. v.name .. "] ", "command") then self:DrawCommand(cmd) cb(k) ABX.Admin:GetCommandData(cmd).drawcommand() return end
            end
            if WarMenu.MenuButton("Back", "command") then self:DrawCommand(cmd) ABX.Admin:GetCommandData(cmd).drawcommand() return end
        end
    end)
end



function ABX.Admin.Menu.DrawTextInput(self, defaultText, cb)
    Citizen.CreateThread(function()
        DisplayOnscreenKeyboard(6, "FMMC_KEY_TIP8", "", "", defaultText and defaultText or "" , "", "", 99)

        while true do
            Citizen.Wait(0)
            DisableAllControlActions(0)

            if UpdateOnscreenKeyboard() == 1 then cb(GetOnscreenKeyboardResult()) return
            elseif UpdateOnscreenKeyboard() == 2 or UpdateOnscreenKeyboard == 3 then return end
        end
    end)
end

local textEntryCb

local function nuiCallBack(data)
    if data.textEntry then
        textEntryCb(data.text and data.text or nil)
    end

    if data.close then
        SetNuiFocus(false, false)
    end

    if data.showcursor or data.showcursor == false then SetNuiFocus(data.showcursor, data.showcursor) end
end

RegisterNUICallback("nuiMessage", nuiCallBack)

function ABX.Admin.Menu.ShowTextEntry(self, title, subMsg, cb)
    SendNUIMessage({open = true, textEntry = true, title = title, submsg = subMsg and subMsg or ""})
    textEntryCb = function(text) cb(text) end
end

function ABX.Admin.Menu.DrawRanks(self, cmd, cb)
    WarMenu.OpenMenu("ranklist")

    Citizen.CreateThread(function()
        while WarMenu.IsMenuOpened("ranklist") do
            Citizen.Wait(0)
            for k,v in spairs(ABX.Admin:GetRanks(), function(t, a, b) return t[a].grant < t[b].grant end) do
                if WarMenu.MenuButton(k, "command") then self:DrawCommand(cmd) cb(k) ABX.Admin:GetCommandData(cmd).drawcommand() return end
            end
            if WarMenu.MenuButton("Back", "command") then self:DrawCommand(cmd) ABX.Admin:GetCommandData(cmd).drawcommand() return end
        end
    end)
end

local viewingIp = false
local viewingLicense = false
local cat = nil

Citizen.CreateThread(function()
    local function DrawMain()
        if WarMenu.Button("Commands") then
            WarMenu.OpenMenu("acategories")
        end

        if ABX.Admin:GetPlayerRank() == "dev" then
            if WarMenu.Button("Dev Toggle") then
                WarMenu.OpenMenu("aDev")
            end
        end
        
        if WarMenu.Button("Player List") then
            WarMenu.OpenMenu("aplayers")
        end

        if WarMenu.Button("Searching") then
            WarMenu.OpenMenu("asearch")
        end


        if WarMenu.Button("Close") then
            WarMenu.CloseMenu()
        end
    end

    local function DrawPlayers()        
        for k,v in spairs(ABX._Admin.Players, function(t, a, b) return t[a].source < t[b].source end) do
            if WarMenu.Button("[" .. v.source .. "] " .. v.name .. (v.sessioned and " - SESSIONED?" or ""), v.status, v.sessioned and {r = 255, g = 0, b = 0, a = 255} or nil) then ABX._Admin.Menu.PlayerOptions = v viewingIp = false viewingLicense = false WarMenu.OpenMenu("aplayeropts") end
        end
        if WarMenu.MenuButton("Disconnected Players", "adplayers") then end
        if WarMenu.MenuButton("Back", "amenu") then return end
    end

    local function DrawDiscPlayers()
        for k,v in spairs(ABX._Admin.DiscPlayers, function(t, a, b) return t[a].source < t[b].source end) do
            if WarMenu.MenuButton("[" .. v.source .. "] " .. v.name, "aplayeropts") then ABX._Admin.Menu.PlayerOptions = v viewingIp = false end
        end
        if WarMenu.MenuButton("Back", "aplayers") then return end
    end

    local function DrawPlayerOptions()
        local options = ABX._Admin.Menu.PlayerOptions

        if options then
            for k,v in pairs(options) do
                if not v or v == "" then options[k] = "Unknown" end
            end

            if WarMenu.Button("User:", options.name) then end
            if WarMenu.Button("Source:", options.source) then end
            if WarMenu.Button("Rank:", options.rank) then end
            if WarMenu.Button("Steam ID:", options.steamid) then end
            if WarMenu.Button("Community ID:", options.comid) then end
            if WarMenu.Button("Hex ID:", options.hexid) then end

            local license = string.gsub(options.license, "license:", "")
            if not viewingLicense then if WarMenu.Button("License:", "Press enter to view") then viewingLicense = true end else if WarMenu.Button("", license) then viewingLicense = false end end

            if ABX.Admin:IsSuperAdmin() then
                if WarMenu.Button("Ping:", options.ping .. " ms") then end
                if not viewingIp then if WarMenu.Button("IP:", "Press enter to view") then viewingIp = true end else if WarMenu.Button("IP:", options.ip) then viewingIp = false end end
            end
            if WarMenu.Button("Status:", options.status) then end
            if options.sessioned then if WarMenu.Button("SESSIONED?", nil, {r = 255, g = 0, b = 0, a = 255}) then end end
        end
        if WarMenu.MenuButton("Back", "aplayers") then return end
    end

    local function DrawCommands()
        local userRank = ABX.Admin:GetPlayerRank()

        if cat then
            for k,v in spairs(ABX.Admin:GetCommands(), function(t, a, b) return t[a].title < t[b].title end) do
                if v.category == cat then
                    WarMenu.SetLastCat(cat)
                    if ABX.Admin:RankHasCommand(userRank, v.command) then if WarMenu.Button(v.title) then WarMenu.OpenMenu("command") ABX.Admin.Menu:DrawCommand(v.command) end end
                end
            end
        end
        if WarMenu.MenuButton("Back", "acategories") then return end
    end

    local function DrawCategories()
        for k,v in spairs(ABX.Admin:GetCategories(), function(t, a, b) return a < b end) do
            if WarMenu.Button(k) then
                cat = k
                WarMenu.SetSubTitle("acommands", "COMMANDS - " .. cat)
                WarMenu.OpenMenu("acommands")
            end
        end
        if WarMenu.MenuButton("Back", "amenu") then return end
    end

    local function DrawDev()
        local userRank = ABX.Admin:GetPlayerRank()
        if WarMenu.Button("Dev mode: " .. (ABX._Admin.Menu.DevMode and "Disable" or "Enable")) and userRank == "dev" then 
            ABX._Admin.Menu.DevMode = not ABX._Admin.Menu.DevMode 
            TriggerEvent("ab-admin:currentDevmode",ABX._Admin.Menu.DevMode)
        end
        if WarMenu.Button("Dev debug: " .. (ABX._Admin.Menu.DevDebug and "Disable" or "Enable")) and userRank == "dev" then 
            ABX._Admin.Menu.DevDebug = not ABX._Admin.Menu.DevDebug 
            TriggerEvent("ab-admin:currentDebug",ABX._Admin.Menu.DevDebug)
            TriggerServerEvent("server:enablehuddebug", nil,ABX._Admin.Menu.DevDebug)
        end
        if WarMenu.MenuButton("Back", "amenu") then return end
    end

    local function DrawSearching()
        local userRank = ABX.Admin:GetPlayerRank()
        if WarMenu.MenuButton("Ban Search", "searchopts") then ABX._Admin.Menu.SearchOptions.type = "ban" end
        if WarMenu.MenuButton("Character Search", "searchopts") then ABX._Admin.Menu.SearchOptions.type = "character" end
        if WarMenu.MenuButton("Steam ID Search", "searchopts") then ABX._Admin.Menu.SearchOptions.type = "steamid" end
        if WarMenu.Button("Dump Current Players") then ABX.Admin.DumpCurrentPlayers() end
    end

    searchTypes = {
        ["ban"] = {},
        ["character"] = {},
        ["steamid"] = {steamid = false}
    }

    local searching = false

    local function DrawSearchOptions()
        local type = ABX._Admin.Menu.SearchOptions.type
        if not type then return end

        if WarMenu.Button("Search Type:", type) then end

        type = searchTypes[type]

        local function openTextEntry(title)
            if searching then return end
            
            ABX.Admin.Menu:ShowTextEntry(title, "", function(result)
                if result then
                    searching = true

                    if string.gsub(result, " ", "") == "" or result == "" then result = nil end
                end

                TriggerServerEvent("ab-admin:searchRequest", ABX._Admin.SearchOptions.type, result)
            end)
        end

        if type.steamid ~= false and WarMenu.Button("Search with Steam ID") then openTextEntry("Enter a Steam ID") end
        if type.cid ~= false and WarMenu.Button("Search with Character ID") then openTextEntry("Enter a Character ID") end
        if type.src ~= false and WarMenu.Button("Search with Source Number") then openTextEntry("Enter a Source Number") end
        if type.phone ~= false and WarMenu.Button("Search with Phone Number") then openTextEntry("Enter a Phone Number") end
        if WarMenu.MenuButton("Back", "asearch") then end
    end

    ABX._Admin.Menu.Menus = {
        ["amenu"] = DrawMain,
        ["asearch"] = DrawSearching,
        ["searchopts"] = DrawSearchOptions,
        ["aplayers"] = DrawPlayers,
        ["adplayers"] = DrawDiscPlayers,
        ["aplayeropts"] = DrawPlayerOptions,
        ["acommands"] = DrawCommands,
        ["aDev"] = DrawDev,
        ["acategories"] = DrawCategories,
        ["command"] = false,
        ["targetmenu"] = false,
        ["ranklist"] = false
    }

    TriggerEvent("ab-admin:currentDevmode",ABX._Admin.Menu.DevMode)
    TriggerEvent("ab-admin:currentDebug",ABX._Admin.Menu.DevDebug)

    while true do
        Citizen.Wait(0)

        for k,v in pairs(ABX._Admin.Menu.Menus) do
            if v ~= false and WarMenu.IsMenuOpened(k) then
                v()
            end
        end

        WarMenu.Display()
    end
end)

RegisterNetEvent("ab-admin:openMenu")
AddEventHandler("ab-admin:openMenu", function()
    WarMenu.OpenMenu("amenu")
end)

RegisterNetEvent("ab-admin:drawLastCat")
AddEventHandler("ab-admin:drawLastCat", function(sentCat)
    cat = sentCat
    WarMenu.OpenMenu("acommands")
end)

RegisterNetEvent("ab-admin:currentDebug")
AddEventHandler("ab-admin:currentDebug", function(debugToggle)
    ABX._Admin.Menu.DevDebug = debugToggle
end)

RegisterCommand('menu', function()
    TriggerEvent('ab-admin:openMenu')
end)