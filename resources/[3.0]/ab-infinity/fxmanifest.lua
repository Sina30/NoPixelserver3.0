fx_version "cerulean"

games {"gta5"}

description "Infinity Helper"

version "1.0.0"

client_script '@ab-lib/client/cl_rpc.lua'
server_script '@ab-lib/server/sv_rpc.lua'

client_scripts {
    "client/classes/*.lua",
    "client/cl_*.lua"
}


server_scripts {
    "sv_config.lua",
    "server/scope/sv_*.lua",
    "server/sv_*.lua"
}
