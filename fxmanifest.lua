fx_version 'cerulean'

game 'gta5'

author "Pa1nlessz#2021"

description "A simple starterpack for esx"


client_scripts {
  'Client/Modules/*.lua',
  'Client/*.lua',

}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'Server/Modules/Functions.lua',
  'Server/*.lua',
}

shared_scripts {
  'Config.lua'
}

