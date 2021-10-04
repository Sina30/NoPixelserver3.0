RegisterServerEvent("ab-npcs:location:fetch")
AddEventHandler("ab-npcs:location:fetch",function()
    local src = source
    for k,v in pairs(Generic.ShopKeeperLocations) do
        table.insert( Generic.NPCS, #Generic.NPCS + 1, {
            id = "shopkeeper_"..k,
            name = "Shop Keeper "..k,
            pedType = 4,
            model = "mp_m_shopkeep_01",
            networked = false,
            distance = 35.0,
            position = {
                coords = vector3(v[1], v[2], v[3]),
                heading = v[4],
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isShopKeeper'] = true
            }
        } )
    end
    
    for k,v in pairs(Generic.WeaponShopLocations) do
        table.insert( Generic.NPCS, #Generic.NPCS + 1, {
            id = "weaponShopKeeper_"..k,
            name = "Weapon Shop Keeper "..k,
            pedType = 4,
            model = "mp_m_weapexp_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = vector3(v[1], v[2], v[3]),
                heading = v[4],
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isWeaponShopKeeper'] = true
            }
        })
    end

    for k,v in pairs(Generic.ToolShopLocations) do
        table.insert( Generic.NPCS, #Generic.NPCS + 1, {
            id = "toolsShopKeeper_"..k,
            name = "Tools Shop Keeper "..k,
            pedType = 4,
            model = "s_m_m_lathandy_01",
            networked = false,
            distance = 25.0,
            position = {
                coords = vector3(v[1], v[2], v[3]),
                heading = v[4],
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isToolShopKeeper'] = true
            }
        })
    end

    -- for k,v in pairs(Generic.ApartmentUpgrade) do
    --     table.insert( Generic.NPCS, #Generic.NPCS + 1, {
    --         id = "apartupgradeKeeper_"..k,
    --         name = "Apart Upgrade Keeper "..k,
    --         pedType = 4,
    --         model = "a_f_y_business_01",
    --         networked = false,
    --         distance = 25.0,
    --         position = {
    --             coords = vector3(v[1], v[2], v[3]),
    --             heading = v[4],
    --             random = false
    --         },
    --         appearance = nil,
    --         settings = {
    --             { mode = "invincible", active = true },
    --             { mode = "ignore", active = true },
    --             { mode = "freeze", active = true },
    --         },
    --         flags = {
    --             ['isNPC'] = true,
    --             ['isApartmentUpgradeKeeper'] = true
    --         }
    --     })
    -- end

    for k,v in pairs(Generic.SportShopLocations) do
        table.insert( Generic.NPCS, #Generic.NPCS + 1, {
            id = "sportshopKeeper_"..k,
            name = "Sport Shop Keeper "..k,
            pedType = 4,
            model = "csb_cletus",
            networked = false,
            distance = 25.0,
            position = {
                coords = vector3(v[1], v[2], v[3]),
                heading = v[4],
                random = false
            },
            appearance = nil,
            settings = {
                { mode = "invincible", active = true },
                { mode = "ignore", active = true },
                { mode = "freeze", active = true },
            },
            flags = {
                ['isNPC'] = true,
                ['isSportShopKeeper'] = true
            }
        })
    end
    TriggerClientEvent("ab-npcs:set:ped", src, Generic.NPCS)
end)