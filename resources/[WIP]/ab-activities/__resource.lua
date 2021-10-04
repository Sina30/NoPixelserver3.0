fx_version 'bodacious'
games { 'rdr3', 'gta5' }

server_export 'AddJob' 

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/pricedown.ttf',
	'html/cursor.png',
	'html/background.png',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js'
}

client_script "@ab-lib/client/cl_ui.lua"

client_scripts {
	'@ab-lib/client/cl_rpc.lua',
	'config.lua',
    'client/cl_*.lua',
    "@ab-errorlog/client/cl_errorlog.lua"
	
}

server_scripts {
	'@ab-lib/server/sv_rpc.lua',
    '@ab-lib/server/sv_sql.lua',
    'server/sv_*.lua'
}

export "isNearClothing"
export "isNearImpound"