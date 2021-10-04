fx_version 'cerulean'

games {
    'gta5',
    'rdr3'
}

client_scripts {
  '@ab-lib/client/cl_rpc.lua',
  '@ab-lib/client/cl_ui.lua',
  '@ab-lib/client/cl_polyhooks.lua',
	'client/cl_*.lua'
}

shared_scripts {
  '@ab-lib/shared/sh_util.lua',
	"shared/*.lua"
}

server_scripts {
  '@ab-lib/server/sv_rpc.lua',
  '@ab-lib/server/sv_sql.lua',
	'server/*.lua'
}