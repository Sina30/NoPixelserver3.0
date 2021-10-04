currentRoomLocks = {
    [1] = {},
    [2] = {},
    [3] = {}
}

currentRoomLockdown = {
    [1] = {},
    [2] = {},
    [3] = {}
}

RPC.register("GetMotelInformation",function(pSource,currentRoomType,currentRoomNumber)
    local data =  Await(SQL.execute("SELECT * FROM character_motel WHERE id=@roomnum AND building_type=@ptype",{["roomnum"] = currentRoomNumber.param,["ptype"] = currentRoomType.param}))
    return data
end)

RPC.register("IsValidRoom",function(pSource,RoomType,RoomNumber)
    local data = Await(SQL.execute("SELECT * FROM character_motel WHERE id=@roomnum AND building_type=@ptype",{
        ["roomnum"] = RoomNumber.param,
        ["ptype"] = RoomType.param
    }))
    local retval = false
    if data[1] then
        retval = true
    end

    return retval
end)

RPC.register("apartment:forclose",function(pSource,RoomType,RoomNumber)
    currentRoomLockdown[RoomType][RoomNumber] = not currentRoomLockdown[RoomType][RoomNumber]
end)

RPC.register("apartment:getOwner",function(pSource,RoomType,RoomNumber)
    local data = Await(SQL.execute("SELECT * FROM character_motel WHERE id=@roomnum AND building_type=@ptype",{
        ["roomnum"] = RoomNumber.param,
        ["ptype"] = RoomType.param
    }))

    return data[1].cid
end)

RPC.register("upgradeApartment",function(pSource,apartmentTargetType,RoomType,RoomNumber)
    local data = Await(SQL.execute("SELECT * FROM character_motel WHERE id=@roomnum AND building_type=@ptype",{
        ["roomnum"] = RoomNumber.param,
        ["ptype"] = RoomType.param
    }))

    SQL.execute("UPDATE character_motel SET building_type=@btype WHERE id=@roomnum",{
        ["roomnum"] = RoomNumber.param,
        ["btype"] = apartmentTargetType.param
    })

    return true
end)

RPC.register("getApartmentInformation",function(pSource)
    return Apart.info
end)

RPC.register("apartment:allCurrentApartmentsOfRoomType",function(pSource,Roomtype)
    return currentRoomLocks[Roomtype.param]
end)

RegisterServerEvent("apartment:serverApartmentSpawn")
AddEventHandler("apartment:serverApartmentSpawn",function(roomType,isNew,instance,isSpawn)
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports["ghmattimysql"]:execute("select * from character_motel WHERE cid=@cid",{
        ["cid"] = char.id
    },function(result)
        if #result > 0 then
            if isSpawn then
                TriggerClientEvent("apartments:enterMotel",src,result[1].id,roomType,isSpawn)
            end
            if isNew then
                TriggerClientEvent("apartments:enterMotel",src,result[1].id,roomType,isSpawn)
            end
            TriggerClientEvent("apartments:apartmentSpawn",src,{roomType = roomType},result[1].id)
        end
        currentRoomLocks[roomType][result[1].id] = true
        TriggerClientEvent("apartments:apartmentLocks",-1,currentRoomLocks)
    end)
end)

RegisterServerEvent("apartment:serverEnterAprts")
AddEventHandler("apartment:serverEnterAprts",function(roomType)
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports["ghmattimysql"]:execute("select * from character_motel WHERE cid=@cid",{
        ["cid"] = char.id
    },function(result)
        if #result > 0 then
            if result[1].building_type == roomType then
                TriggerClientEvent("apartments:enterMotel",src,result[1].id,roomType)
            else
                TriggerClientEvent("DoLongHudText", src, "You don't have a Apartment here", 5)
            end
        end
    end)
end)

RegisterServerEvent("apartment:serverUnlockAprts")
AddEventHandler("apartment:serverUnlockAprts",function(roomType)
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports["ghmattimysql"]:execute("select * from character_motel WHERE cid=@cid",{
        ["cid"] = char.id
    },function(result)
        if #result > 0 then
            if result[1].building_type == roomType then
                TriggerClientEvent("ab-apps:unlocks1",src)
            else
                TriggerClientEvent("ab-apps:unlocks2",src)
            end
        end
    end)
end)

RegisterServerEvent("apartments:ToggleLocks")
AddEventHandler("apartments:ToggleLocks",function(RoomType,RoomNumber)
    currentRoomLocks[RoomType][RoomNumber] = not currentRoomLocks[RoomType][RoomNumber]
    TriggerClientEvent("apartments:apartmentLocks",-1,currentRoomLocks)
end)

RegisterServerEvent("apartment:serverLockdown")
AddEventHandler("apartment:serverLockdown",function(RoomType,RoomNumber)
    currentRoomLockdown[RoomType][RoomNumber] = not currentRoomLockdown[RoomType][RoomNumber]
    TriggerClientEvent("apartments:apartmentLockDown",-1,currentRoomLockdown)
end)