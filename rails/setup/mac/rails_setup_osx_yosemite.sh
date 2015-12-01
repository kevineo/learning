# NOTICE
# This script is meant for auto-run. If you want to learn, please learn BASH script. Thank you.


function install_homebrew {
	echo "== Installing Homebrew =="
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "[ COMPLETED ]"
}

function install_rbenv {
	echo "== Installing Rbenv =="
	brew install rbenv ruby-build

	# Add rbenv to bash so that it loads every time you open a terminal
	echo -n 'adding rbenv to bash_profile for autoloading... '
	echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
	source ~/.bash_profile
	echo '[ DONE ]'
	echo ''

	echo "[ COMPLETED ]"
}


function install_ruby {
	echo '== Installing Ruby =='
	# Process name
	echo -n "Processing input for setup... "
	local version=$1
	echo "[ DONE ]"

	# Install Ruby
	echo -n "Installing ruby $version... "
	rbenv install $version
	rbenv global $version
	echo '[ DONE ]'

	echo '[ COMPLETED ]'
}


function install_git {
	echo '== Installing GIT =='

	# Installation Notice
	echo "Go to GIT official webpage "
	echo "Press ENTER to continue after the installation"
	read temp
	echo ""

	# Process name
	echo -n "Processing input for setup... "
	local username=$1
	local email=$2
	echo "[ DONE ]"

	# Setup Git
	echo -n "Setting up Global Settings... "
	git config --global color.ui true
	git config --global user.name $username
	git config --global user.email $email
	echo "[ DONE ]"

	echo '[ COMPLETED ]'
}


function setup_ssh {
	echo '== Setting Up SSH =='
	# Process name
	echo -n "Processing input for setup... "
	local email=$1
	echo "[ DONE ]"

	ssh-keygen -t rsa -C $email
	echo '[ COMPLETED ]'
}


function setup_rails {
	echo '== Setup Rails =='
	gem install rails

	echo -n "Allows rbenv to learn rails existence... "
	rbenv rehash
	echo '[ DONE ]'

	echo '[ COMPLETED ]'
}


function setup_postgresql {
	echo '== Install Postgresql =='

	echo -n 'Install postgresql software... '
	# Installation
	brew install postgresql
	echo '[ DONE ]'

	echo -n 'Add a launchd to start postgresql at login... '
	# To have launchd start postgresql at login
	ln -sfv /usr/local/opt/postgresql/*plist ~/Library/LaunchAgents
	echo '[ DONE ]'

	echo -n 'Launch the postgresql now... '
	# Then to load postgresql now:
	launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
	echo '[ DONE ]'
	echo ''

	echo '[ COMPLETED ]'
}


################################
# Driver Code
################################
# Inquire input
echo -n "Your Name: "
read user_username
echo -n "Your Email: "
read user_email

# Inquire Ruby Version to be installed
OPTIONS="2.2.3"
echo "Please select your ruby version option. "
select opt in $OPTIONS; do
	case $opt in
		"2.2.3")
			ruby_version=2.2.3
			break
			;;
		*)
			echo "select option: invalid option"
			;;
	esac
done

# Installation Automation
install_homebrew
install_rbenv
install_ruby $ruby_version
install_git $user_username $user_email
setup_ssh $user_email
setup_rails
setup_postgresql

# Done
source ~/.bash_profile
echo "Setup Completed. You should try generating a rails app to it test out."
