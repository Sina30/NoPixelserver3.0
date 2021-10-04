local actions = { ["has"] = true, ["add"] = true, ["remove"] = true }

RegisterCommand("clFlag", function (source, args)
    local flagType, action, flag = args[1], args[2], args[3]

    local playerPed = PlayerPedId()

    local vehicle = GetVehiclePedIsIn(playerPed, true)

    if not DoesEntityExist(vehicle) then
        return print("[Flags] Vehicle not Found")
    end

    if flagType then
        if Flags[flagType] then

            if action == nil or not actions[action] then
                print(("[Flags] Invalid Action | Actions: {'has', 'add', 'remove'}"):format(flagType, flag))
            elseif not Flags[flagType][flag] then
                local states = {}
                for state, _ in pairs(Flags[flagType]) do
                    states[#states + 1] = state
                end
                print(("[Flags] Flag Type: %s | List: %s"):format(flagType, json.encode(states)))
            elseif action == "has" then
                print(("[Flags] Flag Type: %s | Flag: %s | Active: %s"):format(flagType, flag, HasVehicleFlag(vehicle, flag)))
            elseif action == "add" then
                SetVehicleFlag(vehicle, flag, true)
                print(("[Flags] Flag Type: %s | Flag: %s | Added"):format(flagType, flag))
            elseif action == "remove" then
                SetVehicleFlag(vehicle, flag, false)
                print(("[Flags] Flag Type: %s | Flag: %s | Removed"):format(flagType, flag))
            end
        else
            print(("[Flags] Type '%s' not found"):format(flagType))
        end
    else
        local flags = {}
        for typeName, _ in pairs(Flags) do
            flags[#flags + 1] = typeName
        end
        print(("[Flags] Flag Types | %s"):format(json.encode(flags)))
    end
end)