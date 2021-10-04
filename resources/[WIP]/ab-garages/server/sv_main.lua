RPC.register("ab-garages:select",function(pSource,garname)
	print(garname.param)
    local src = source
	local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	exports.ghmattimysql:execute('SELECT * FROM characters_cars WHERE cid = @cid AND current_garage = @garage ', { ['@cid'] = char.id, ["garage"] = garname.param }, function(result)
		if (result and result[1]) then
			for ind, value in pairs(result) do
				enginePercent = value.engine_damage / 10
				bodyPercent = value.body_damage / 10
				curGarage = value.current_garage

				TriggerClientEvent('ab-context:sendMenu', src, {
					{
						id = value.id,
						header = value.name,
						txt = 'Plate: ' .. value.license_plate,
						params = {
							event = "ab-garages:takeout",
							args = value.id
						}
					},
				})
			end
		else
			TriggerClientEvent('DoLongHudText', src, 'You have not parked a vehicle here', 2)
		end
	end)
end)

RPC.register("ab-garages:attempt:sv",function(pSource,pdata)
	local src = source
	local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	exports.ghmattimysql:execute('SELECT * FROM characters_cars WHERE cid = @cid AND id = @id', { ['@cid'] = char.id, ['@id'] = pdata.param }, function(result)
		for ind, value in pairs(result) do
			TriggerClientEvent('ab-context:sendMenu', src, {
				{
					id = "close",
					header = "< Go Back",
					txt = "",
					params = {
						event = "ab-garages:open"
					}
				},
				{
					id = "take",
					header = "Take Out : " ..value.name ,
					txt = 'Spawn Selected Vehicle',
					params = {
						event = "ab-garages:attempt:spawn",
						args = result
					}
				},
				{
					id = "status",
					header = "Vehicle Status",
					txt = 'Garage : ' ..value.current_garage.. ' | Body : ' .. bodyPercent .. '% | Engine : ' .. enginePercent..'% | Fuel : '..value.fuel..'%',
					params = {
						event = "ab-garages:open"
					}
				},
				
			})
		end
	end)
end)

RPC.register("ab-garages:spawned:get",function(pSource,valid)
	local src = source
	local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()

	exports.ghmattimysql:execute('SELECT * FROM characters_cars WHERE cid = @cid AND id = @id', { ['@cid'] = char.id, ['@id'] = valid.param }, function(result)
		if result[1].vehicle_state == "In" then
			TriggerClientEvent("ab-garages:attempt:spawn", src, result, true)
		else
			TriggerClientEvent('DoLongHudText', src, 'Vehicle is not in the garage. Check in your phone maybe.', 2)
		end
    end)
end)

RPC.register("ab-garages:states",function(pSource,state,plate,curGarage,fuel)
	local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	exports.ghmattimysql:execute('SELECT * FROM characters_cars WHERE cid = @cid AND license_plate = @plate', { ['@cid'] = char.id, ['@plate'] = plate.param }, function(result)
		exports.ghmattimysql:execute("UPDATE characters_cars SET vehicle_state = @state, current_garage = @garage, fuel = @fuel WHERE license_plate = @plate", {['garage'] = curGarage.param, ['state'] = state.param, ['fuel'] = fuel.param, ['plate'] = plate.param})
    end)
	return true
end)

RPC.register("ab-garages:getonlyimpound",function(pSource)
	local src = source
	local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	exports.ghmattimysql:execute('SELECT * FROM characters_cars WHERE cid = @cid AND current_garage = @garage', { ['@cid'] = char.id, ['@garage'] = "Impound Lot"}, function(result)
		if (result and result[1]) and result[1].current_garage == "Impound Lot" then
			for ind, value in pairs(result) do
				enginePercent = value.engine_damage / 10
				bodyPercent = value.body_damage / 10
				curGarage = value.current_garage

				TriggerClientEvent('ab-context:sendMenu', src, {
					{
						id = value.id,
						header = value.name,
						txt = 'Plate: ' .. value.license_plate,
						params = {
							event = "ab-garages:takeout",
							args = value.id
						}
					},
				})
			end
		else
			TriggerClientEvent('DoLongHudText', src, 'You have no vehicle here', 2)
		end
	end)
end)

RegisterServerEvent('garages:CheckGarageForVeh')
AddEventHandler("garages:CheckGarageForVeh", function()
    local src = source
    local user = exports["ab-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local owner = char.id

    exports.ghmattimysql:execute('SELECT * FROM characters_cars WHERE cid = @cid', { ['@cid'] = owner }, function(vehicles)
		local v = vehicles[1]
        TriggerClientEvent('phone:Garage', src, vehicles)
    end)
end)

-- AddEventHandler('onResourceStart', function(resourceName)
-- 	exports.ghmattimysql:execute('SELECT * FROM characters_cars', {}, function(vehicles)
-- 		for k, v in ipairs(vehicles) do
-- 			if v.vehicle_state == "Out" then
-- 				exports.ghmattimysql:execute("UPDATE characters_cars SET vehicle_state = @state, current_garage = @garage, coords = @coords WHERE license_plate = @plate", {['garage'] = 'Impound Lot', ['state'] = 'In', ['coords'] = nil, ['plate'] = v.license_plate})
-- 			end
-- 		end
-- 	end)
-- end)



RegisterServerEvent('updateVehicle')
AddEventHandler('updateVehicle', function(vehicleMods,plate)
	local src = source
	local user = exports["ab-base"]:getModule("Player"):GetUser(src)
	if not user then return end
	local char = user:getCurrentCharacter()
	if not char then return end
	local owner = user:getVar("hexid")
	if not owner then return end
	vehicleMods = json.encode(vehicleMods)
	exports.ghmattimysql:execute("UPDATE characters_cars SET data=@mods WHERE license_plate = @plate",
	{['mods'] = vehicleMods, ['plate'] = plate})
end)