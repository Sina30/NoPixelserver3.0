DecorRegister("PedFlags", 3)

exports("SetPedFlag", function (ped, flag, enabled)
    local mask = Flags["PedFlags"][flag]

    if mask ~= nil and DoesEntityExist(ped) then
        local field = DecorGetInt(ped, "PedFlags")

        DecorSetInt(ped, "PedFlags", enabled and field | mask or field &~ mask)
        NotifyChange('ped', ped, flag, enabled)
    end
end)

exports("HasPedFlag", function (ped, flag)
    local mask = Flags["PedFlags"][flag]

    if mask ~= nil and DoesEntityExist(ped) then
        local field = DecorGetInt(ped, "PedFlags")
        return (field & mask) > 0
    end
end)

exports("GetPedFlags", function (ped)
    local field = DecorGetInt(ped, "PedFlags")
    local flags = {}

    if field and field >= 0 then
        for flag, mask in pairs(Flags["PedFlags"]) do
            flags[flag] = (field & mask) > 0
        end
    end

    return flags
end)

exports("SetPedFlags", function (ped, flags)
    local field = DecorGetInt(ped, "PedFlags")

    for flag, enabled in pairs(flags) do
        local mask = Flags["PedFlags"][flag]

        if (mask) then
            field = enabled and field | mask or field &~ mask
        end
    end

    DecorSetInt(ped, "PedFlags", field)
end)