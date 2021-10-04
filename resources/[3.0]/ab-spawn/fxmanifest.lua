fx_version 'cerulean'
games {'gta5'}

-- dependency "ab-base"
-- dependency "raid_clothes"

ui_page "html/index.html"
files({
	"html/*",
	"html/images/*",
	"html/css/*",
	"html/webfonts/*",
	"html/js/*"
})

client_script "@ab-errorlog/client/cl_errorlog.lua"
client_script "client/*"

shared_script "shared/sh_spawn.lua" 
server_script "server/*"