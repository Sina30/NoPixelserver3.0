local blips = config.blip_types
local source_cache = { }

-- Init config
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    for k, v in pairs(blips) do
        if not v.members then blips[k].members = { } end
    end
end)

RegisterNetEvent('badBlips:server:registerSourceName')
AddEventHandler('badBlips:server:registerSourceName', function(source, name)
    if not source_cache[source] then source_cache[source] = { } end
    source_cache[source].name = name
end)

RegisterNetEvent('badBlips:server:registerPlayerBlipGroup')
AddEventHandler('badBlips:server:registerPlayerBlipGroup', function(source, group)
    if not blips[group] then
        blips[group] = { members = { } }
    end
    blips[group].members[source] = { is_member = true, }
end)

RegisterNetEvent('badBlips:server:removePlayerBlipGroup')
AddEventHandler('badBlips:server:removePlayerBlipGroup', function(source, group)
    if blips[group].members[source] then
        blips[group].members[source] = nil
    end
end)

RegisterNetEvent('badBlips:server:registerPlayerTempBlipGroup')
AddEventHandler('badBlips:server:registerPlayerTempBlipGroup', function(source, group, time)
    TriggerEvent('badBlips:server:registerPlayerBlipGroup', source, 'police')
    SetTimeout(time, function()
        TriggerEvent('badBlips:server:removePlayerBlipGroup', source, 'police')
    end)
end)

-- Remove the player from the blip group
AddEventHandler('playerDropped', function()
    local source = source
    for blip_name, blip in pairs(blips) do
        for member_source, data in pairs(blip.members) do
            if source == member_source then
                blips[blip_name].members[source] = nil
            end
        end
    end

    -- Remove source from source cache
    if source_cache[source] then
        source_cache[source] = nil
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(config.client_update_interval)

        -- pre-format the data to use it
        -- iterate over one group at a time
        for blip_name, blip in pairs(blips) do
            local blips_data = { } -- Store the blip_data that we want to send to the clients

            -- Add ownership "see" ability of the other groups, (but cant see them)
            -- This is a bit heavier of a check, but it should not cause any problems as the parent loops are light
            if blip._can_see then
                for _, can_see_group_name in pairs(blip._can_see) do
                    for source, data in pairs(blips[can_see_group_name].members) do
                        if data then -- sanity check
                            local ped = GetPlayerPed(source)
                            -- It would be better to cache this information since one ped will get checked twice
                            if DoesEntityExist(ped) then
                                local pos = GetEntityCoords(ped)
                                blips_data = appendBlipsPacket(blips_data, can_see_group_name, source, pos)
                            end
                        end
                    end
                end
            end

            -- Gather where all blips are for a specific character
            for source, data in pairs(blip.members) do
                if data then -- sanity check
                    local ped = GetPlayerPed(source)
                    if DoesEntityExist(ped) then
                        local pos = GetEntityCoords(ped)
                        blips_data = appendBlipsPacket(blips_data, blip_name, source, pos)
                    end
                end
            end

            -- Finally, send it to all clients that are a part of the group
            Citizen.CreateThread(function()
                for source, is_valid_member in pairs(blip.members) do
                    if is_valid_member then -- more sanity checking
                        TriggerClientEvent('badBlips:client:syncMyBlips', source, blips_data)
                        Citizen.Wait(100)
                    end
                end
            end)

            Citizen.Wait(config.wait_between_group_in_thread)
        end
    end
end)

-- Format blip data into an array to use the **LEAST** amount of data possible when sending to the client
function appendBlipsPacket(blips_data, blip_name, source, position)
    local x, y, z = table.unpack(position)
    local label = false

    if source_cache[source] and source_cache[source].name then
        label = source_cache[source].name
    end

    table.insert(blips_data, {
        x, -- [1]
        y, -- [2]
        z, -- [3]
        blip_name, -- [4]
        source, -- [5]
        label, -- [6]
    })

    return blips_data
end

