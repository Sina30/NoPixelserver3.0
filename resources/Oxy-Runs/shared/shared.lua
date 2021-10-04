Config = {}

Config.StartLocation = vector3(82.08,-1615.25,28.59) -- Location of the NPC to start the job

Config.DeliveryLocations = {
    --vector3(x,y,z), -- use this a template if needed
vector3(969.77990,-1557.03700,30.20764), -- Coords of locations to start delivering
vector3(-173.59390,-1975.40200,27.14530),
vector3(-777.35500,373.81520,87.35204),
vector3(-939.38060, 309.26740,70.67439),
vector3(-227.40120, -1486.49900,30.79996),
}

Config.DeliveryItem = 'SusPackage' -- The item being delivered

Config.GiveMoney = false -- True if you want to give money as a reward, can do money + item

Config.MoneyAmount = 200 -- How much money rewarded

Config.GiveItem = true -- True if you want to give items as a reward, can do money + item

Config.ItemReward = 'oxy' -- Name of the item to give

Config.ItemMin = 1 -- Minimum amount they will get

Config.ItemMax = 5 -- Max amount they will get

Config.GiveStartItems = false -- If True, the NPC will give the player the ammount of items to deliver, if false you will have to find your own method for the player to get the items

Config.MultipleDeliveries = true -- If true, will give a second set of gps Coords after the first job is complete

Config.DeliveryAmount = 4 -- The amount of items needed to be deliverd to complete the job

Config.DeliveryAmount2 = 4 -- How many more deliveries at the next location

Config.StartLocation = vector3(82.08,-1615.25,28.59) -- Location of the NPC to start the job

Config.VehicleModeels = {'washington','gauntlet','glendale','panto','sultan'}

config.PedModels = {'a_f_y_business_02','a_f_y_tourist_01','a_f_y_tourist_01','a_m_m_socenlat_01'}