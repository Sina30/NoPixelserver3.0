-- local NewsEntries, SubMenu = MenuEntries['news'], {}

-- local News = {
--     {
--       id = "newsClearProps",
--       title = "Clear Props",
--       icon = "#news-job-news-microphone",
--       event = "ab-newsjob:clearTools"
--     },
-- }

-- Citizen.CreateThread(function()
--     for index, data in ipairs(News) do
--         SubMenu[index] = data.id
--         MenuItems[data.id] = {data = data}
--     end

--     NewsEntries[#NewsEntries+1] = {
--         data = {
--           id = "news",
--           icon = "#news",
--           title = "News",
--         },
--         subMenus = SubMenu,
--         isEnabled = function ()
--             return not isDead and isNews
--         end,
--     }
-- end)

