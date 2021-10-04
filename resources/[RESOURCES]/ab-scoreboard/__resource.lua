resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

dependency "ab-base"

client_script "@warmenu/warmenu.lua"
client_script "@ab-errorlog/client/cl_errorlog.lua"

server_script "sv_scoreboard.lua"

client_script('cl_scoreboard.lua')
