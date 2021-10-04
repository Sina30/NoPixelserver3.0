DecorRegister("ObjectFlags", 3)

exports("SetObjectFlag", function (object, flag, enabled)
    local mask = Flags["ObjectFlags"][flag]

    if mask ~= nil and DoesEntityExist(object) then
        local field = DecorGetInt(object, "ObjectFlags")

        Sync.DecorSetInt(object, "ObjectFlags", enabled and field | mask or field &~ mask)
        NotifyChange('object', object, flag, enabled)
    end
end)

exports("HasObjectFlag", function (object, flag)
    local mask = Flags["ObjectFlags"][flag]

    if mask ~= nil and DoesEntityExist(object) then
        local field = DecorGetInt(object, "ObjectFlags")

        return (field & mask) > 0
    end
end)

exports("GetObjectFlags", function (object)
    local field = DecorGetInt(object, "ObjectFlags")
    local flags = {}

    if field and field >= 0 then
        for flag, mask in pairs(Flags["ObjectFlags"]) do
            flags[flag] = (field & mask) > 0
        end
    end

    return flags
end)

exports("SetObjectFlags", function (object, flags)
    local field = DecorGetInt(object, "ObjectFlags")

    for flag, enabled in pairs(flags) do
        local mask = Flags["ObjectFlags"][flag]

        if (mask) then
            field = enabled and field | mask or field &~ mask
        end
    end

    Sync.DecorSetInt(object, "ObjectFlags", field)
end)