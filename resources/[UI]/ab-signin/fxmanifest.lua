fx_version 'cerulean'
games { 'gta5' }

client_script "@ab-errorlog/client/cl_errorlog.lua"
client_script "@ab-lib/client/cl_ui.lua"
client_script "config.lua"

client_scripts {
  "client/cl_*.lua"
}
server_scripts {
  "server/sv_*.lua"
}