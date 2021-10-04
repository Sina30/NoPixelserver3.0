resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

client_script 'client.lua'
server_script 'server.lua'


client_script "@ab-errorlog/client/cl_errorlog.lua"

client_script "@ab-infinity/client/cl_lib.lua"
server_script "@ab-infinity/server/sv_lib.lua"

server_export 'getWeaponMetaData'
server_export "updateWeaponMetaData"

exports{
	'toName',
	'findModel'
}
