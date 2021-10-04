fx_version 'bodacious'
game 'gta5'

author 'Glimps And Leaftoast'
version '1.0.0'

dependencies {
    "PolyZone"
}

client_script {
    'client/client.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',

}
server_script 'server/server.lua'
shared_script 'shared/shared.lua'