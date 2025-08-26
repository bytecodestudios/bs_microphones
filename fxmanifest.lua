fx_version 'cerulean'
game 'gta5'

author 'Cadburry (Bytecode Studios)'
description 'Microphones for your court cases, events, etc (FiveM)'

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua',
}

client_scripts {
  'client.lua',
  'locations.lua',
}

dependencies {
  'ox_lib',
  'pma-voice',
}