resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'


client_script "@ab-errorlog/client/cl_errorlog.lua"

client_script "@ab-infinity/client/cl_lib.lua"
server_script "@ab-infinity/server/sv_lib.lua"

client_script 'carhud.lua'
server_script 'carhud_server.lua'
client_script 'cl_autoKick.lua'
server_script 'sr_autoKick.lua'
client_script 'newsStands.lua'

ui_page('html/index.html')
files({
	"html/index.html",
	"html/script.js",
	"html/styles.css",
	"html/img/*.svg",
	"html/img/*.png"
})

exports {
	"playerLocation",
	"playerZone"
}
