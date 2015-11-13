installer="apt-get"

function update {
	sudo $installer update -y
	sudo $installer dist-upgrade -y
}

function gparted {
	sudo $installer gparted -y
}

function heroku-toolbelt {
	wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
}

# Run your driver code here
update