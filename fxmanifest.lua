fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

name 'LB Tablet Dispatch Backwards Compatibility'
author 'Maximus7474'
repository 'https://github.com/Maximus7474/lb-tablet-dispatch-converter'
version '0.0.0'

files {
    'utils/*.lua'
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua'
}

provide 'qtarget'