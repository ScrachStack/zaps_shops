fx_version 'cerulean'
games { 'gta5' }
author 'zaps6000'
lua54 'yes'
client_scripts {
'client/*'
}

server_scripts {
'server/*'
}
shared_scripts {
    '@ox_lib/init.lua',
    "edit.lua"
}


shared_script '@es_extended/imports.lua'
