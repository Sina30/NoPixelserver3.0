function checkOverwrites(char)
    local rev = nil
    if char.jail then
        rev = "jail"
    end

    return rev
end

RegisterServerEvent("character:loadspawns")
AddEventHandler("character:loadspawns", function()
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local cid = tonumber(char.id)

    exports.ghmattimysql:execute("SELECT ho.*, cm.cid, cm.building_type, hp.level, hp.illness, hp.time FROM character_motel cm LEFT JOIN houses ho on ho.cid = cm.cid LEFT JOIN hospital_patients hp on hp.cid = cm.cid WHERE cm.cid = @cid ",{
        ["@cid"] = cid
    },function(housingMotels)
        exports.ghmattimysql:execute('SELECT * FROM houses WHERE `cid` = @id', {
            ['@id'] = cid
        },function(housing_keys)
            if housingMotels[1] then
                local spawnData = {
                    ["overwrites"] = checkOverwrites(char),
                    ["hospital"] = {
                        ["illness"] = housingMotels[1].illness,
                        ["level"] = housingMotels[1].level,
                        ["time"] = housingMotels[1].time,
                    },
                    ["motelRoom"] = {
                        ["roomType"] = housingMotels[1].building_type,
                        ["cid"] = housingMotels[1].cid,
                    },
                    ["houses"] = {},
                    ["keys"] = {},
                }

                --if housingMotels[1] ~= nil then
                --    for i = 1, #housingMotels do
                --        local lol = json.decode(housingMotels[i].data)
                --        spawnData["houses"][lol["house_id"]] = true
                --    end
                --end
                --[[for k,v in pairs(housingMotels) do
                    if v.housing_id ~= nil then
                        spawnData["houses"][v.housing_id] = true
                    end
                end]]

                --if housing_keys[1] ~= nil then
                --    for i = 1, #housing_keys do
                --        local lol = json.decode(housing_keys[i].data)
                --        spawnData["keys"][lol["house_id"]] = true
                --    end
                --end
                --[[for k,v in pairs(housing_keys) do
                    if v.housing_id ~= nil then
                        spawnData["keys"][v.housing_id] = true
                    end
                end]]
                TriggerClientEvent("spawn:clientSpawnData",src,spawnData)
            else
                --This assumes a New Character
                exports.ghmattimysql:execute("INSERT INTO character_motel (cid) VALUES (@cid)",{
                    ["cid"] = cid
                })
                exports.ghmattimysql:execute("INSERT INTO hospital_patients (cid,level,illness,time) VALUES (@cid,@level,@illness,@time)",{
                    ["cid"] = cid,
                    ["level"] = 0,
                    ["illness"] = "none",
                    ["time"] = 0
                })

                local spawnData = {
                    ["overwrites"] = "new",
                    ["hospital"] = {
                        ["illness"] = "none",
                        ["level"] = 0,
                        ["time"] = 0,
                    },
                    ["motelRoom"] = {
                        ["roomType"] = 1,
                        ["cid"] = cid,
                    },
                    ["houses"] = {},
                    ["keys"] = {},
                }
                TriggerClientEvent("spawn:clientSpawnData",src,spawnData)
            end
        end)
    end)
end)