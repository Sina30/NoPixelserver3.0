barberShops = {
	{1932.0756835938, 3729.6706542969, 32.844413757324},
	{-278.19036865234, 6228.361328125, 31.695510864258},
	{1211.9903564453, -472.77117919922, 66.207984924316},
	{-33.224239349365, -152.62608337402, 57.076496124268},
	{136.7181854248, -1708.2673339844, 29.291622161865},
	{-815.18896484375, -184.53868103027, 37.568943023682},
	{-1283.2886962891, -1117.3210449219, 6.9901118278503}
}

Citizen.CreateThread(function()
	exports["ab-polyzone"]:AddBoxZone("barber_shop", vector3(1931.27, 3730.69, 32.84), 4.8, 4.6, {
		heading=30,
		minZ=31.84,
		maxZ=34.64
	})
	
	exports["ab-polyzone"]:AddBoxZone("barber_shop", vector3(-277.51, 6227.35, 31.7), 5.6, 5.0, {
		heading=45,
		minZ=30.7,
		maxZ=33.7
	})
	
	exports["ab-polyzone"]:AddBoxZone("barber_shop", vector3(1213.32, -473.15, 66.21), 6.8, 5.4, {
		heading=75,
		minZ=65.01,
		maxZ=68.01
	})
	
	exports["ab-polyzone"]:AddBoxZone("barber_shop", vector3(-33.67, -153.46, 57.08), 5.2, 7.2, {
		heading=70,
		minZ=55.88,
		maxZ=58.88
	})
	
	exports["ab-polyzone"]:AddBoxZone("barber_shop", vector3(137.73, -1707.2, 29.29), 5.6, 7.0, {
		heading=50,
		minZ=28.09,
		maxZ=31.29
	})
	
	exports["ab-polyzone"]:AddBoxZone("barber_shop", vector3(-813.86, -184.15, 37.57), 7.4, 8.6, {
		heading=30,
		minZ=36.57,
		maxZ=39.37
	})
	
	exports["ab-polyzone"]:AddBoxZone("barber_shop", vector3(-1281.76, -1117.41, 6.99), 6.0, 7.0, {
		heading=0,
		minZ=5.99,
		maxZ=8.99
	})

end)
