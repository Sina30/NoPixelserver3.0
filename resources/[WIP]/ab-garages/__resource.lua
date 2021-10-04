resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

server_scripts {
	'@ab-lib/server/sv_rpc.lua',
    '@ab-lib/server/sv_sql.lua',
	'server/sv_*.lua'
}

client_script "@ab-lib/client/cl_ui.lua"
client_scripts {
	'@ab-errorlog/client/cl_errorlog.lua',
	'@ab-lib/client/cl_rpc.lua',
	'client/cl_*.lua'
}

shared_scripts {
	'shared/sh_*.lua'
}