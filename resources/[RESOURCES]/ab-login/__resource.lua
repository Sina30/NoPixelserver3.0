resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

dependency "ab-base"

ui_page "html/index.html"

files({
    "html/index.html",
    "html/script.js",
    "html/styles.css",
    "html/cursor.png",
    "html/header.png"
})

server_script "server/sv_login.lua"

--client_script "@ab-errorlog/client/cl_errorlog.lua"
client_script "client/cl_login.lua"
client_script "client/cl_cswitch.lua"
