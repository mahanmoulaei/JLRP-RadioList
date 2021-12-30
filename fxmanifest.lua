fx_version 'cerulean'
game 'gta5'

name 'JL-RadioList'
description 'List of players in each radio for pma-voice'
author 'Mahan#8183'

shared_scripts {
	'@es_extended/imports.lua',
	'Config.lua',
}

ui_page "UI/index.html"

files {
	"UI/index.html"
}

server_script {
	"Server/*.lua"
}

client_script {
	"Client/*.lua"
}


