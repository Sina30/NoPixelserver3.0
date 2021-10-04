fx_version 'adamant'
games { 'gta5' }

client_script 'config.lua'
client_script 'blips_client.lua'

server_script 'config.lua'
server_script 'blips_server.lua'


client_script "@ab-infinity/client/cl_lib.lua"
server_script "@ab-infinity/server/sv_lib.lua"