resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

--resource_type 'gametype' { name = 'Hot Putsuit' }
client_script "@ab-errorlog/client/cl_errorlog.lua"

client_script "@ab-infinity/client/cl_lib.lua"
server_script "@ab-infinity/server/sv_lib.lua"

server_script "server.lua"
client_script "client.lua"
