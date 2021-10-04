--[[
    Functions below: Utility
    Description: Simple utility functions to make scripts easier
]]

function Apart.FindCurrentRoom(roomType)
    local name = ""

    if roomType == 1 then
        name = "np_apartments_room"
    elseif roomType == 2 then
        name = "v_int_16_mid"
    elseif roomType == 3 then
        name = "v_int_16_high"
    elseif roomType == 111 then
        name = "v_int_72_l"
    end

    return name
end

local _i, _f, _v, _r, _ri, _rf, _rl, _s, _rv, _ro, _in, _ii, _fi =
Citizen.PointerValueInt(), Citizen.PointerValueFloat(), Citizen.PointerValueVector(),
Citizen.ReturnResultAnyway(), Citizen.ResultAsInteger(), Citizen.ResultAsFloat(), Citizen.ResultAsLong(), Citizen.ResultAsString(), Citizen.ResultAsVector(), Citizen.ResultAsObject(),
Citizen.InvokeNative, Citizen.PointerValueIntInitialized, Citizen.PointerValueFloatInitialized

local string_len = string.len
local inv_factor = 1.0 / 370.0

function Draw3DText(x,y,z, text)
    local factor = string_len(text) * inv_factor
    local onScreen,_x,_y = _in(0x34E82F05DF2974F5, x, y, z, _f, _f, _r) -- GetScreenCoordFromWorldCoord

    if onScreen then
        _in(0x07C837F9A01C34C9, 0.35, 0.35) -- SetTextScale
        _in(0x66E0276CC5F6B9DA, 4) -- SetTextFont
        _in(0x038C1F517D7FDCF8, 1) -- SetTextProportional
        _in(0xBE6B23FFA53FB442, 255, 255, 255, 215) -- SetTextColour
        _in(0x25FBB336DF1804CB, "STRING") -- SetTextEntry
        _in(0xC02F4DBFB51D988B, 1) -- SetTextCentre
        _in(0x6C188BE134E074AA, text) -- AddTextComponentString, assumes "text" is of type string
        _in(0xCD015E5BB0D96A57, _x, _y) -- DrawText
        _in(0x3A618A217E5154F0, _x,_y+0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68) -- DrawRect
    end
end


function Apart.FindApartmentGivenNumber(roomNumberSent)

    local roomType = 0
    local roomNumber = 0 
    Apart.plyCoords = GetEntityCoords(PlayerPedId())

    for i=1,3 do
        if type(Apart.Locations[i]) == type(vector3(0.0,0.0,0.0)) then
            if #(Apart.Locations[i]-Apart.plyCoords) < 9.0 then
                roomType = i
            end
        else
            local dist = 3
            for k,v in pairs(Apart.Locations[i]) do
                local d = #(v-Apart.plyCoords)
                if d < 2.0 and d < dist then
                    dist = d
                    roomNumber = k
                    roomType = i
                end
            end
            if roomNumber ~= 0 then break end
        end
    end

    if roomType == 0 then 
        TriggerEvent("DoLongHudText","Invalid location",2)
        return false,false
    else
        if roomNumberSent == 0 or roomNumberSent == nil then 
            if roomNumber == 0 then
                TriggerEvent("DoLongHudText","Invalid input given , add a room number to enter",2)
                return false,false
            else
                --print("entering Found room : "..roomNumber.." of type "..roomType)
                return roomNumber,roomType
            end
        else
            roomNumber = roomNumberSent
            --print("entering room with number: "..roomNumber.." of type "..roomType)
            return roomNumber,roomType
        end
    end

    return false,false
end