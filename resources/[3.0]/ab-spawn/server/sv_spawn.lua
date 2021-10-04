function Login.decode(tablestring)
    if tablestring == nil or tablestring == "" then
        return {}
    else
        return json.decode(tablestring)
    end
end

RegisterServerEvent("login:getCharModels")
AddEventHandler("login:getCharModels", function(charlist,isReset)
    local src = source
    local char

    local list = ""
    for i=1,#charlist do
        if i == #charlist then
            list = list..charlist[i]
        else
            list = list..charlist[i]..","
        end
    end

    if charlist == nil or json.encode(charlist) == "[]" then
        TriggerClientEvent("login:CreatePlayerCharacterPeds", src, nil, isReset)
        return
    end

    exports.ghmattimysql:execute("SELECT cc.*, cf.*, ct.* FROM character_face cf LEFT JOIN character_current cc on cc.cid = cf.cid LEFT JOIN playerstattoos ct on ct.identifier = cf.cid WHERE cf.cid IN ("..list..")",{},function(result)
        if result then
            local temp_data = {}

            for k,v in pairs(result) do
                temp_data[v.cid] = {
                    model = v.model,
                    drawables = Login.decode(v.drawables),
                    props = Login.decode(v.props),
                    drawtextures = Login.decode(v.drawtextures),
                    proptextures = Login.decode(v.proptextures),
                    hairColor = Login.decode(v.hairColor),
                    headBlend = Login.decode(v.headBlend),
                    headOverlay = Login.decode(v.headOverlay),
                    headStructure = Login.decode(v.headStructure),
                    tattoos = Login.decode(v.tattoos),
                }
            end

            for i=1,#charlist do
                if temp_data[charlist[i]] == nil then
                    temp_data[charlist[i]] = nil
                end
            end

            TriggerClientEvent("login:CreatePlayerCharacterPeds",src,temp_data,isReset)
        end
    end)
end)

RegisterServerEvent("ab-login:disconnectPlayer")
AddEventHandler("ab-login:disconnectPlayer", function()
    local src = source
    DropPlayer(src, "You DisConnected")
end)

RegisterServerEvent("ab-base:playerSessionStarted")
AddEventHandler("ab-base:playerSessionStarted", function()
    local src = source
    Citizen.CreateThread(function()
        Citizen.Wait(600000 * 3)
        local user = exports["ab-base"]:getModule("Player"):GetUser(src)
        if not user or not user:getVar("characterLoaded") then
            DropPlayer(src, "You timed out while choosing a character")
            return
        end
    end)
end)


RegisterServerEvent("srp-spawn:licenses")
AddEventHandler("srp-spawn:licenses", function()
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local char = user:getVar("character")
    exports.ghmattimysql:execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {['@type'] = "Firearm",['@owner'] = char.id})
    --exports.ghmattimysql:execute("INSERT INTO user_licenses (type, owner, status) VALUES (@type, @owner, @status)", {['@type'] = "Driver", ['@owner'] = char.id, ['@status'] = "1"})
    exports.ghmattimysql:execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {['@type'] = "Driver",['@owner'] = char.id})
    exports.ghmattimysql:execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {['@type'] = "Hunting",['@owner'] = char.id})
    exports.ghmattimysql:execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {['@type'] = "Fishing",['@owner'] = char.id})
end)


-- Don't use this, its poor SQL code. It just added more rows into the DB and doesn't UPDATE them -- devyn.
RegisterCommand('licensebish', function(source, args)
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local char = user:getVar("character")
    exports.ghmattimysql:execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {['@type'] = "Firearm",['@owner'] = char.id})
    exports.ghmattimysql:execute("INSERT INTO user_licenses (type, owner, status) VALUES (@type, @owner, @status)", {['@type'] = "Driver", ['@owner'] = char.id, ['@status'] = "1"})
    exports.ghmattimysql:execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {['@type'] = "Hunting",['@owner'] = char.id})
    exports.ghmattimysql:execute("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", {['@type'] = "Fishing",['@owner'] = char.id})
end)

