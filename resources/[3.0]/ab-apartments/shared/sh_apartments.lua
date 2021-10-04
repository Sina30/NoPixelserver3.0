Apart = {}
Apart.func = {}
Apart.MaxRooms = {
	[1] = 999,
	[2] = 90,
	[3] = 60,
}


function getModule(module)
    if not Apart then print("Warning: '" .. tostring(module) .. "' module doesn't exist") return false end
    return Apart[module]
end

Apart.info = {
    [1] = {
        ["apartmentType"] = 1,
        ["apartmentPrice"] = 2000,
        ["apartmentStreet"] = "No3",
    },
    [2] = {
        ["apartmentType"] = 2,
        ["apartmentPrice"] = 80000,
        ["apartmentStreet"] = "Prosperity",
    },
    [3] = {
        ["apartmentType"] = 3,
        ["apartmentPrice"] = 130000,
        ["apartmentStreet"] = "Pill Box Swiss St",
    },
}


Apart.exitPoint = {
	[1] = {
		[1] = vector3(-270.13,-957.28,31.23),
		[2] = vector3(-268.45,-962.18,31.23),
		[3] = vector3(-264.49,-960.07,31.23),
		[4] = vector3(-266.58,-955.75,31.23),

	},
	[2] = vector3(-1236.27,-860.84,12.91),
	[3] = {
		[1] = vector3(284.77087402344, -640.73846435547, 42.018623352051),
		[2] = vector3(288.49661254883, -642.02453613281, 42.018623352051),
		[3] = vector3(292.02172851562, -643.47479248047, 42.018611907959),
		[4] = vector3(287.96154785156, -655.54913330078, 42.018619537354),
		[5] = vector3(284.2268371582, -654.06915283203, 42.018627166748),
		[6] = vector3(280.53570556641, -652.64044189453, 42.018619537354),
	},
}


Apart.Locations = {
	[1] = vector3(-270.13,-957.28,31.23),
	[2] = vector3(-1236.27,-860.84,12.91),
	[3] = vector3(277.88, -640.43, 42.01), 
}