local isDoingMission = false
local GarbageLocation
local GarbageShit = false
local garbageHQBlip = nil
local lastMission = 'none'
local garbageped = vector3(-321.49, -1545.49, 31.01)
local bag = 0
local payout
local Unity = {}
local FatNonce
local locations = {
    [1] = {
        ["name"] = "1",
        ['x'] = -562.33044433594,
        ['y'] = -708.04522705078,
        ['z'] = 33.004611968994,
        ['h'] = 89.264846801758,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [2] = {
        ["name"] = "2",
        ['x'] = 395.05264282227,
        ['y'] = -739.52471923828,
        ['z'] = 29.2767162323,
        ['h'] = 60.26685333252,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [3] = {
        ["name"] = "3",
        ['x'] = -634.51733398438,
        ['y'] = -1225.6052246094,
        ['z'] = 12.047869682312,
        ['h'] = 254.06277,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [4] = {
        ["name"] = "4",
        ['x'] = -1285.3321533203,
        ['y'] = -825.46240234375,
        ['z'] = 17.108228683472,
        ['h'] = 20.804275512695,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [5] = {
        ["name"] = "5",
        ['x'] = -1056.1796875,
        ['y'] = -515.45819091797,
        ['z'] = 36.038555145264,
        ['h'] = 184.91636657715,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [6] = {
        ["name"] = "6",
        ['x'] = 357.56777954102,
        ['y'] = -1811.0784912109,
        ['z'] = 28.967132568359,
        ['h'] = 204.20796203613,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [7] = {
        ["name"] = "7",
        ['x'] = 201.09181213379,
        ['y'] = -1474.9484863281,
        ['z'] = 29.141109466553,
        ['h'] = 217.11318969727,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [8] = {
        ["name"] = "8",
        ['x'] = 296.17901611328,
        ['y'] = -1237.3959960938,
        ['z'] = 29.43826675415,
        ['h'] = 17.849418640137,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [9] = {
        ["name"] = "9",
        ['x'] = 437.76168823242,
        ['y'] = -1062.2944335938,
        ['z'] = 29.212842941284,
        ['h'] = 13.103993415833,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [10] = {
        ["name"] = "10",
        ['x'] = 242.61546325684,
        ['y'] = -824.49176025391,
        ['z'] = 29.985176086426,
        ['h'] = 345.55709838867,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [11] = {
        ["name"] = "11",
        ['x'] = 449.47512817383,
        ['y'] = -574.18640136719,
        ['z'] = 28.499795913696,
        ['h'] = 343.2314453125,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [12] = {
        ["name"] = "12",
        ['x'] = 490.47567749023,
        ['y'] = -998.47778320312,
        ['z'] = 27.778720855713,
        ['h'] = 91.999237060547,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [13] = {
        ["name"] = "13",
        ['x'] = 50.611587524414,
        ['y'] = -1044.984375,
        ['z'] = 29.586198806763,
        ['h'] = 27.627149581909,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [14] = {
        ["name"] = "14",
        ['x'] = -34.201133728027,
        ['y'] =  -88.479202270508,
        ['z'] = 57.254016876221,
        ['h'] = 12.538998603821,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [15] = {
        ["name"] = "15",
        ['x'] = 327.0133972168,
        ['y'] = -186.11437988281,
        ['z'] = 57.410400390625,
        ['h'] = 153.33584594727,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [16] = {
        ["name"] = "16",
        ['x'] = -455.51870727539,
        ['y'] = 66.245582580566,
        ['z'] = 58.481414794922,
        ['h'] = 355.552734375,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [17] = {
        ["name"] = "17",
        ['x'] = -1270.576171875,
        ['y'] = -288.75280761719,
        ['z'] = 37.707916259766,
        ['h'] = 299.05218505859,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [18] = {
        ["name"] = "18",
        ['x'] = -1516.6302490234,
        ['y'] = -411.58602905273,
        ['z'] = 35.591934204102,
        ['h'] = 320.15240478516,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [19] = {
        ["name"] = "19",
        ['x'] = -1367.7197265625,
        ['y'] = -666.95123291016,
        ['z'] = 26.734607696533,
        ['h'] = 70.097793579102,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [20] = {
        ["name"] = "20",
        ['x'] = -710.50109863281,
        ['y'] = -1141.4176025391,
        ['z'] = 10.812646865845,
        ['h'] = 213.22152709961,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [21] = {
        ["name"] = "21",
        ['x'] = 1168.6563720703,
        ['y'] = -1651.2203369141,
        ['z'] = 36.778526306152,
        ['h'] = 228.32330322266,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [22] = {
        ["name"] = "22",
        ['x'] = 1051.3479003906,
        ['y'] = -2389.6975097656,
        ['z'] = 30.334142684937,
        ['h'] = 276.23965454102,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [23] = {
        ["name"] = "23",
        ['x'] = 827.57897949219,
        ['y'] = -2489.4543457031,
        ['z'] = 24.182064056396,
        ['h'] = 255.58296203613,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [24] = {
        ["name"] = "24",
        ['x'] = 715.31878662109,
        ['y'] = -2021.3975830078,
        ['z'] = 29.292030334473,
        ['h'] = 77.624794006348,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [25] = {
        ["name"] = "25",
        ['x'] = 103.33500671387,
        ['y'] = -1811.9942626953,
        ['z'] = 26.50276184082,
        ['h'] = 8.4402351379395,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [26] = {
        ["name"] = "26",
        ['x'] = 155.22679138184,
        ['y'] = -1308.5531005859,
        ['z'] = 29.20228767395,
        ['h'] = 242.96148681641,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [27] = {
        ["name"] = "27",
        ['x'] = -175.76670837402,
        ['y'] = -1285.1262207031,
        ['z'] = 31.295957565308,
        ['h'] = 252.7926940918,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [28] = {
        ["name"] = "28",
        ['x'] = -1178.2696533203,
        ['y'] = -945.70849609375,
        ['z'] = 3.2628552913666,
        ['h'] = 119.97543334961,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [29] = {
        ["name"] = "29",
        ['x'] = -1264.7823486328,
        ['y'] = -824.32946777344,
        ['z'] = 17.099201202393,
        ['h'] = 241.20642089844,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [30] = {
        ["name"] = "30",
        ['x'] = -1127.2039794922,
        ['y'] = -832.26989746094,
        ['z'] = 13.395785331726,
        ['h'] = 354.50543212891,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [31] = {
        ["name"] = "31",
        ['x'] = -495.24468994141, -- trashcan
        ['y'] = -251.43963623047,
        ['z'] = 35.759140014648,
        ['h'] = 16.633857727051,
        ['completed'] = false,
        ['task'] = 'none'
    },
    [32] = {
        ["name"] = "32",
        ['x'] = -433.72982788086, -- trashcan
        ['y'] = -97.032730102539,
        ['z'] = 40.28048324585,
        ['h'] = 214.52449035645,
        ['completed'] = false,
        ['task'] = 'none'
    },
}

RegisterNetEvent("ab-jobmanager:playerBecameJob")
AddEventHandler("ab-jobmanager:playerBecameJob", function(job, name, notify)
    local LocalPlayer = exports["ab-base"]:getModule("LocalPlayer")
    LocalPlayer:setVar("job", job)
    if job == 'garbage' then
        havegarbagejob = true
        if garbageHQBlip == nil or garbageHQBlip == 0 then
            garbageHQBlip = AddBlipForCoord(garbageped)
            SetBlipSprite(garbageHQBlip, 318)
            SetBlipDisplay(garbageHQBlip, 4)
            SetBlipScale(garbageHQBlip, 0.5)
            SetBlipColour(garbageHQBlip, 25)
            SetBlipAsShortRange(garbageHQBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Garbage HQ")
            EndTextCommandSetBlipName(garbageHQBlip)
        end    
    else
        havegarbagejob = false
        if garbageHQBlip ~= nil or garbageHQBlip ~= 0 then
            RemoveBlip(garbageHQBlip)
            garbageHQBlip = 0
        end
    end

    TriggerServerEvent("ab-items:updateID",job,exports["isPed"]:retreiveBusinesses())
end)


RegisterNetEvent('event:start:garbagejob')
AddEventHandler('event:start:garbagejob', function()
    job = exports["isPed"]:isPed("myjob")
    if job == 'garbage' then
        if not isDoingMission then
            RPC.execute('ab-garbage:checkmyneek',math.random(15,25))
            Unity.MaxBaby = math.random(2,3)
            Unity.TotalDropOffs = 0
        else
            TriggerEvent('DoLongHudText', 'Finish your first run and then come back!', 2)
        end
    else
        TriggerEvent('DoLongHudText', "You don't have garbage job registered ?", 2)
    end
end)

RegisterNetEvent('ab-garbage:Imacunt')
AddEventHandler('ab-garbage:Imacunt', function(callback,virgin)
    if callback then
        if not isDoingMission then
            local getVehicleInArea = GetClosestVehicle(-327.45944213867, -1526.208984375, 27.257116317749, 3.000, 0, 70)
            if DoesEntityExist(getVehicleInArea) then
                TriggerEvent("DoLongHudText", "The area is crowded", 2)
                exports["ab-ui"]:hideContextMenu()
                return
            end
            if virgin then 
                local hash = GetHashKey('trash2')
                RequestModel(hash)
                while not HasModelLoaded(hash) do
                    Wait(50)
                    RequestModel(hash)
                end

                local vehicle = CreateVehicle(hash, -327.45550537109, -1526.2092285156, 27.536148071289, 271.50534057617,
                    isNetwork, thisScriptCheck)
                FatNonce = vehicle
                SetVehicleOnGroundProperly(vehicle)
                local plate = GetVehicleNumberPlateText(vehicle)
                SetModelAsNoLongerNeeded(hash)
                SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                local netid = NetworkGetNetworkIdFromEntity(vehicle)
                SetNetworkIdCanMigrate(netid, true)
                NetworkRegisterEntityAsNetworked(VehToNet(vehicle))	
                TriggerEvent("keys:addNew", vehicle, plate)
                TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                SetVehicleEngineOn(vehicle, true, true)
                ChooseLocation()
                isDoingMission = true
            end
        end
    else
        TriggerEvent('DoLongHudText', 'Poor basturd, get some money.', 2)
    end
end)

function ChooseLocation()
    if Unity.TotalDropOffs <= Unity.MaxBaby then
        for i = 1, #locations do
            local tit = math.random(1, 32)
            GarbageLocation = locations[tit]
        end
        exports["ab-ui"]:hideContextMenu()
        SetNewWaypoint(GarbageLocation.x, GarbageLocation.y)
        TriggerEvent('DoLongHudText', 'Drive to the location on your GPS and start cleaning the streets!')
        GarbageShit = true
        StartGarbageMission()
    end
end

function StartGarbageMission()
    Citizen.CreateThread(function()
        local BagsProcessed = math.random(1, 6)
        while GarbageShit do
            Citizen.Wait(5)
            if #(GetEntityCoords(PlayerPedId()) - vector3(GarbageLocation.x, GarbageLocation.y, GarbageLocation.z)) < 20 then
                if GarbageLocation.task == 'none' then
                    DrawMarker(43, GarbageLocation.x, GarbageLocation.y, GarbageLocation.z - 1, 0, 0, 0, 0, 0, 0, 1.5,
                        1.5, 1.0001, 0, 80, 255, 200, 0, 0, 0, 0)
                elseif GarbageLocation.task == 'Deposit' then
                    local taillight_r = GetWorldPositionOfEntityBone(FatNonce,
                        GetEntityBoneIndexByName(FatNonce, "taillight_r"))
                    local taillight_l = GetWorldPositionOfEntityBone(FatNonce,
                        GetEntityBoneIndexByName(FatNonce, "taillight_l"))
                    local newposx = (taillight_r.x - taillight_l.x) / 2
                    local newposy = (taillight_r.y - taillight_l.y) / 2
                    DrawMarker(43, taillight_r.x - newposx, taillight_r.y - newposy, taillight_r.z, 0, 0, 0, 0, 0, 0,
                        1.25, 1.25, 1.0001, 0, 80, 255, 200, 0, 0, 0, 0)
                end
            end
            local playercoords = GetEntityCoords(GetPlayerPed(-1), false)
            if GarbageLocation.task == 'none' then
                local dst = #(GetEntityCoords(PlayerPedId()) -
                                vector3(GarbageLocation.x, GarbageLocation.y, GarbageLocation.z))
                if dst <= 2 and IsControlJustReleased(0, 38) then
                    GarbageLocation.task = 'Picking-Up'
                    RequestAnimDict('anim@heists@narcotics@trash')
                    while not HasAnimDictLoaded('anim@heists@narcotics@trash') do
                        Citizen.Wait(50)
                        RequestAnimDict('anim@heists@narcotics@trash')
                    end
                    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
                    Citizen.Wait(4500)
                    ClearPedTasks(PlayerPedId())
                    bag = CreateObject(GetHashKey("prop_cs_street_binbag_01"), 0, 0, 0, true, true, true)
                    AttachEntityToEntity(bag, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.4, 0, 0, 0,
                        270.0, 60.0, true, true, false, true, 1, true)
                    Citizen.Wait(100)
                    GarbageLocation.task = 'Deposit'
                end
            elseif GarbageLocation.task == 'Deposit' then
                local taillight_r = GetWorldPositionOfEntityBone(FatNonce,
                    GetEntityBoneIndexByName(FatNonce, "taillight_r"))
                local taillight_l = GetWorldPositionOfEntityBone(FatNonce,
                    GetEntityBoneIndexByName(FatNonce, "taillight_l"))
                local newposx = (taillight_r.x - taillight_l.x) / 2
                local newposy = (taillight_r.y - taillight_l.y) / 2
                local plyCoords = GetEntityCoords(PlayerPedId(), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, taillight_r.x - newposx,
                    taillight_r.y - newposy, taillight_r.z)
                if dist < 2 and IsControlJustReleased(0, 38) then
                    ClearPedTasksImmediately(GetPlayerPed(-1))
                    TaskPlayAnim(PlayerPedId(-1), 'anim@heists@narcotics@trash', 'throw_b', 1.0, -1.0, -1, 2, 0, 0, 0, 0)
                    Citizen.Wait(1000)
                    if DoesEntityExist(bag) then
                        DeleteEntity(bag) -- Removes Bag Once finished
                    end
                    BagsProcessed = BagsProcessed - 1
                    if BagsProcessed == 0 then
                        if Unity.TotalDropOffs == Unity.MaxBaby then
                            GarbageLocation.task = 'Collection'
                            -- x = -338.00881958008, y = -1530.8947753906, z = 27.717378616333, h = 89.705879211426 [ Garbage Location (To Start) ]
                            SetNewWaypoint(-338.00881958008, -1530.8947753906)
                            TriggerEvent('DoLongHudText', 'Head To The Marker On Your GPS, You Have a Payslip Awaiting You.')
                        else
                            Unity.TotalDropOffs = Unity.TotalDropOffs + 1
                            ChooseLocation()
                        end
                    else
                        GarbageLocation.task = 'none'
                        TriggerEvent('DoLongHudText', 'You have: ' .. BagsProcessed .. ' Bag/s Left To Load!')
                    end
                    ClearPedTasks(PlayerPedId())
                end
            elseif GarbageLocation.task == 'Collection' then
                if #(GetEntityCoords(PlayerPedId()) - vector3(-338.00881958008, -1530.8947753906, 27.717378616333)) < 20 then
                    DrawMarker(43, -338.00881958008, -1530.8947753906, 27.717378616333 - 1, 0, 0, 0, 0, 0, 0, 3.5, 3.5,
                        1.0001, 0, 80, 255, 200, 0, 0, 0, 0)
                            if #(GetEntityCoords(PlayerPedId()) - vector3(-338.00881958008, -1530.8947753906, 27.717378616333)) < 4 then
                                if IsControlJustReleased(0, 38) then
                                    if Unity.TotalDropOffs < 3 then
                                        payout = math.random(200, 250)
                                        RPC.execute("server:givepayJob",payout)
                                    elseif Unity.TotalDropOffs >= 5 then
                                        payout = math.random(400, 550)
                                        RPC.execute("server:givepayJob",payout)
                                    else
                                        payout = math.random(300, 450)
                                        RPC.execute("server:givepayJob",payout)
                                    end
                                    -- TriggerEvent('ab-anticheat:item:obtainid', 'recyclablematerial', math.random(4, 8))
                                    NetworkFadeOutEntity(FatNonce, true, true)
                                    DeleteEntity(FatNonce)
                                    FinishGarbageMission()
                                    Citizen.Wait(300)
                                    Citizen.Wait(5000)
                                    TriggerEvent('DoLongHudText', 'Thanks for keeping the streets clean, you have received a reward as a thanks for helping!')
                                end
                            end
                end                -- print('URP Error - Report') -- This shouldnt even be possible; Modder??
                -- TriggerEvent('ab-anticheat:log', source, 'StartGarbageMission() Loop For Garbage')
            end
        end
    end)
end

function FinishGarbageMission()
    Unity.TotalDropOffs = 0
    isDoingMission = false
    GarbageLocation = nil
    GarbageShit = false
    lastMission = 'none'
    BagsProcessed = nil
    bag = nil
    FatNonce = nil
    TriggerServerEvent('ab-garbage:finished-mission', payout)
end

RegisterNetEvent('event:list:garbagejob')
AddEventHandler('event:list:garbagejob', function(data)
    if not isDoingMission then
        exports["ab-ui"]:showContextMenu(data)
    else
        TriggerEvent('DoLongHudText', 'Finish your first run and then come back !', 2)
    end
end)



RegisterUICallback("ab-ui:garbageruns", function(data, cb)
    local keyData = data.key
    local action = keyData[1]

    if action == "solo" then
        RPC.execute("ab-garage:ballagang", true)
    end

    cb({ data = {}, meta = { ok = true, message = "done" } })
end)


RegisterUICallback("ab-ui:garbagerunstext", function(data, cb)
    local keyData = data.key
    local action = keyData[1]
    Wait(1)
    if action == "join" then
        exports['ab-ui']:openApplication('textbox', {
            callbackUrl = 'ab-ui:garbage:system',
            header = "Join Job Group",
            key = data.key,
            items = {
                {
                    icon = "fas fa-lock-open",
                    label = "Pin",
                    name = "pinno",
                },
                {
                    icon = "fas fa-file-signature",
                    label = "Group Name",
                    name = "grpname1",
                },
            },
            show = true,
        })
    elseif action == "create" then
        exports['ab-ui']:openApplication('textbox', {
            callbackUrl = 'ab-ui:garbage:system:add',
            header = "Create Job Group",
            key = data.key,
            items = {
                {
                    icon = "fas fa-lock",
                    label = "Pin",
                    name = "pinno2",
                },
                {
                    icon = "fas fa-file-signature",
                    label = "Group Name",
                    name = "grpname2",
                },
            },
            show = true,
        })
    end

    cb({ data = {}, meta = { ok = true, message = 'done' } })
end)

RegisterUICallback("ab-ui:garbage:system", function(data, cb)
    local wapwap = data[1].value
    local namezzz = data[2].value
    if wapwap ~= nil then
        RPC.execute("ab-garbage:joicrew", wapwap, namezzz)
    end
    cb({ data = {}, meta = { ok = true, message = '' } })
end)

RegisterUICallback("ab-ui:garbage:system:add", function(data, cb)
    local wapwapp = data[1].value
    local namezzzz = data[2].value
    if wapwapp ~= nil then
        RPC.execute("ab-garbage:gencrew", wapwapp, namezzzz)
    end
    cb({ data = {}, meta = { ok = true, message = '' } })
end)


