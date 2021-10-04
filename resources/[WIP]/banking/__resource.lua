resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'


client_script "@ab-errorlog/client/cl_errorlog.lua"

server_script "@ab-fml/server/lib.lua"
client_script "@ab-infinity/client/cl_lib.lua"
server_script "@ab-infinity/server/sv_lib.lua"

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/pricedown.ttf',
	'html/bank-icon.png',
	'html/logo.png',
	'html/cursor.png',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js'
}

client_script "client.lua"
server_script "server.lua"
