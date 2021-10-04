ABX.SettingsData = ABX.SettingsData or {}
ABX.Settings = ABX.Settings or {}

ABX.Settings.Current = {}
-- Current bind name and keys
ABX.Settings.Default = {
  ["tokovoip"] = {
    ["stereoAudio"] = true,
    ["localClickOn"] = true,
    ["localClickOff"] = true,
    ["remoteClickOn"] = true,
    ["remoteClickOff"] = true,
    ["mainVolume"] = 6.0,
    ["clickVolume"] = 10.0,
    ["radioVolume"] = 5.0,
  },
  ["hud"] = {

  }

}


function ABX.SettingsData.setSettingsTable(settingsTable,shouldSend)
  if settingsTable == nil then
    ABX.Settings.Current = ABX.Settings.Default
    TriggerServerEvent('ab-base:sv:player_settings_set',ABX.Settings.Current)
    ABX.SettingsData.checkForMissing()
  else
    if shouldSend then
      ABX.Settings.Current = settingsTable
      TriggerServerEvent('ab-base:sv:player_settings_set',ABX.Settings.Current)
      ABX.SettingsData.checkForMissing()
    else
       ABX.Settings.Current = settingsTable
       ABX.SettingsData.checkForMissing()
    end
  end

  TriggerEvent("event:settings:update",ABX.Settings.Current)

end

function ABX.SettingsData.setSettingsTableGlobal(self,settingsTable)
  ABX.SettingsData.setSettingsTable(settingsTable,true);
end

function ABX.SettingsData.getSettingsTable()
    return ABX.Settings.Current
end

function ABX.SettingsData.setVarible(self,tablename,atrr,val)
  ABX.Settings.Current[tablename][atrr] = val
  TriggerServerEvent('ab-base:sv:player_settings_set',ABX.Settings.Current)
end

function ABX.SettingsData.getVarible(self,tablename,atrr)
  return ABX.Settings.Current[tablename][atrr]
end

function ABX.SettingsData.checkForMissing()
  local isMissing = false

  for j,h in pairs(ABX.Settings.Default) do
    if ABX.Settings.Current[j] == nil then
      isMissing = true
      ABX.Settings.Current[j] = h
    else
      for k,v in pairs(h) do
        if  ABX.Settings.Current[j][k] == nil then
           ABX.Settings.Current[j][k] = v
           isMissing = true
        end
      end
    end
  end
  

  if isMissing then
    TriggerServerEvent('ab-base:sv:player_settings_set',ABX.Settings.Current)
  end


end

RegisterNetEvent("ab-base:cl:player_settings")
AddEventHandler("ab-base:cl:player_settings", function(settingsTable)
  ABX.SettingsData.setSettingsTable(settingsTable,false)
end)


RegisterNetEvent("ab-base:cl:player_reset")
AddEventHandler("ab-base:cl:player_reset", function(tableName)
  if ABX.Settings.Default[tableName] then
      if ABX.Settings.Current[tableName] then
        ABX.Settings.Current[tableName] = ABX.Settings.Default[tableName]
        ABX.SettingsData.setSettingsTable(ABX.Settings.Current,true)
      end
  end
end)