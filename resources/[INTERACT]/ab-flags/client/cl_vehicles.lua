DecorRegister("VehicleFlags", 3)

exports("SetVehicleFlag", function (vehicle, flag, enabled)
    local mask = Flags["VehicleFlags"][flag]

    if mask ~= nil and DoesEntityExist(vehicle) then
        local field = DecorGetInt(vehicle, "VehicleFlags")

        Sync.DecorSetInt(vehicle, "VehicleFlags", enabled and field | mask or field &~ mask)
        NotifyChange('vehicle', vehicle, flag, enabled)
    end
end)

exports("HasVehicleFlag", function (vehicle, flag)
    local mask = Flags["VehicleFlags"][flag]

    if mask ~= nil and DoesEntityExist(vehicle) then
        local field = DecorGetInt(vehicle, "VehicleFlags")

        return (field & mask) > 0
    end
end)

exports("GetVehicleFlags", function (vehicle)
    local field = DecorGetInt(vehicle, "VehicleFlags")
    local flags = {}

    if field and field >= 0 then
        for flag, mask in pairs(Flags["VehicleFlags"]) do
            flags[flag] = (field & mask) > 0
        end
    end

    return flags
end)

exports("SetVehicleFlags", function (vehicle, flags)
    local field = DecorGetInt(vehicle, "VehicleFlags")

    for flag, enabled in pairs(flags) do
        local mask = Flags["VehicleFlags"][flag]

        if (mask) then
            field = enabled and field | mask or field &~ mask
        end
    end

    Sync.DecorSetInt(vehicle, "VehicleFlags", field)
end)