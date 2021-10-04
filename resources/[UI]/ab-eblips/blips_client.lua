local blips_cache = { }
local server_has_heartbeat = false
local blip_types = config.blip_types


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15 * 1000)
        server_has_heartbeat = false
        SetTimeout(5 * 1000, function()
            if not server_has_heartbeat then
                for check_follow_id_key, data in pairs(blips_cache) do
                    if not blips_cache[check_follow_id_key].has_server_validated then
                        RemoveBlip(data.blip_id)
                        RemoveBlip(data.synced_blip_id)
                        blips_cache[check_follow_id_key] = nil
                    end
                end
            end
        end)
    end
end)

local passes = 0

RegisterNetEvent('badBlips:client:syncMyBlips')
AddEventHandler('badBlips:client:syncMyBlips', function(blips)
    print("client triggered")
    local me_ped = PlayerPedId()
    server_has_heartbeat = true
    for _, properties in ipairs(blips) do
        local follow_on_source = properties[5]
        local follow_id_key = properties[4] .. '_' .. properties[5]

        if not blips_cache[follow_id_key] then
            blips_cache[follow_id_key] = { properties = { } }
        end


        blips_cache[follow_id_key].needs_server = true

        local is_networked = NetworkIsPlayerActive(GetPlayerFromServerId(follow_on_source))
        if is_networked then
            local me_player = GetPlayerServerId(PlayerId())
            if config.hide_own_blip and follow_on_source == me_player then
                blips_cache[follow_id_key].ignored = true
            end
            blips_cache[follow_id_key].needs_server = false
            blips_cache[follow_id_key].player_ped = GetPlayerPed(GetPlayerFromServerId(follow_on_source))
        end

        if not blips_cache[follow_id_key].ignored then -- Used to hide own blip
            if blips_cache[follow_id_key].is_created and not blips_cache[follow_id_key].needs_removal then
                -- Update
                local blip_id = blips_cache[follow_id_key].blip_id
                blips_cache[follow_id_key].properties = properties
                blips_cache[follow_id_key].has_server_validated = true
                doUpdateBlip(follow_id_key, blip_id, properties)
            else
                -- Create
                local blip_id = doAddBlip(properties)
                blips_cache[follow_id_key].is_created = true
                blips_cache[follow_id_key].blip_id = blip_id
                blips_cache[follow_id_key].properties = properties
                blips_cache[follow_id_key].has_server_validated = true
            end
        end
    end

    for _, __ in pairs(blips_cache) do
        if not blips_cache[_].has_server_validated then
            if blips_cache[_].synced_blip_id then
                RemoveBlip(blips_cache[_].synced_blip_id)
                blips_cache[_].synced_blip_id = false
            end

            if blips_cache[_].blip_id then
                RemoveBlip(blips_cache[_].blip_id)
                blips_cache[_].blip_id = false
            end

            blips_cache[_] = nil
        end

        if blips_cache[_] then
            blips_cache[_].has_server_validated = false
        end
    end
end)

function doUpdateBlip(follow_id_key, blip_id, properties)
    if blips_cache[follow_id_key].needs_server then 
        if not blips_cache[follow_id_key].blip_id then
            RemoveBlip(blips_cache[follow_id_key].synced_blip_id)
            local new_blip_id = doAddBlip(properties)
            blips_cache[follow_id_key].synced_blip_id = nil
            blips_cache[follow_id_key].blip_id = new_blip_id
        end

        if blips_cache[follow_id_key].blip_id then
            if DoesBlipExist(blips_cache[follow_id_key].blip_id) then -- Sanity check
                SetBlipCoords(blip_id, properties[1] + 0.001,properties[2] + 0.001,properties[3] + 0.001)
            end
        end
    end
end

function doAddBlip(properties)
    print("do add blips")
    print(properties[1])
    local blip_id = AddBlipForCoord(properties[1] + 0.001,properties[2] + 0.001,properties[3] + 0.001)
    setBlipProperties(blip_id, properties)
    return blip_id
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for follow_id_key, data in pairs(blips_cache) do
            if not blips_cache[follow_id_key].needs_server and not blips_cache[follow_id_key].needs_removal then

                if not blips_cache[follow_id_key].synced_blip_id then
                    if blips_cache[follow_id_key].blip_id then
                        RemoveBlip(blips_cache[follow_id_key].blip_id)
                        blips_cache[follow_id_key].blip_id = nil
                    end

                    if DoesEntityExist(blips_cache[follow_id_key].player_ped) then
                        local new_blip_id = AddBlipForEntity(blips_cache[follow_id_key].player_ped)
                        blips_cache[follow_id_key].synced_blip_id = new_blip_id
                    else
                        print('ERROR - Could not find networked player ped')
                    end
                end

                if GetBlipFromEntity(data.player_ped) then
                    local blip_id = blips_cache[follow_id_key].synced_blip_id
                    local veh = GetVehiclePedIsIn(data.player_ped, false)

                    if veh ~= 0 then
                        SetBlipRotation(blip_id, math.ceil(GetEntityHeading(veh)))
                    end

                    setBlipProperties(blips_cache[follow_id_key].synced_blip_id, data.properties)
                end
            end
        end
    end
end)

function setBlipProperties(blip_id, properties)
    local current_type = GetBlipSprite(blip_id)
    local current_color = GetBlipColour(blip_id)
    local template_type = properties[4]
    local type = config.default_type._type
    local color = config.default_type._color
    local scale = config.default_type._scale
    local alpha = config.default_type._alpha
    local show_local_indicator = config.default_type._show_local_direction
    local show_off_screen = config.default_type._show_off_screen

    if blip_types[template_type]._type then type = blip_types[template_type]._type end
    if blip_types[template_type]._color then color = blip_types[template_type]._color end
    if blip_types[template_type]._scale then scale = blip_types[template_type]._scale end
    if blip_types[template_type]._alpha then alpha = blip_types[template_type]._alpha end
    if blip_types[template_type]._show_local_direction then show_local_indicator = blip_types[template_type]._show_local_direction end
    if blip_types[template_type]._show_off_screen then show_off_screen = blip_types[template_type]._show_off_screen end

    if current_type ~= type or current_color ~= color then
        SetBlipSprite(blip_id, type)
        SetBlipColour(blip_id, color)
        SetBlipScale(blip_id, scale)
        SetBlipAlpha(blip_id, alpha)
        SetBlipAsShortRange(not show_off_screen)

        if show_local_indicator then
            ShowHeadingIndicatorOnBlip(blip_id, true)
        end

        if properties[6] then
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(properties[6])
            EndTextCommandSetBlipName(blip_id)
        else
            SetBlipHiddenOnLegend(blip_id)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString("Colleague")
            EndTextCommandSetBlipName(blip_id)
        end
    end
end

