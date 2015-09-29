# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Rbenv
brew install rbenv ruby-build
	# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile
	# Install Ruby
echo 'Installing Ruby 2.2.3'
version=2.2.3
rbenv install $version
rbenv global $version
ruby -v

# Install GIT
	# Install
echo "Go to GIT official webpage and install git manually."
echo "Press ENTER to continue after the installation."
read temp

	# Setup Git
echo -n "Your Name: "
read username
echo -n "Your Email: "
read email
git config --global color.ui true
git config --global user.name $username
git config --global user.email $email
ssh-keygen -t rsa -C $email


# Install Rails
	# Install rails
gem install rails

	# Have rbenv to learn rails
rbenv rehash

# Install Postgresql
	# Installation
brew install postgresql
	# To have launchd start postgresql at login:
ln -sfv /usr/local/opt/postgresql/*plist ~/Library/LaunchAgents
	# Then to load postgresql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Done
echo "Setup Completed. You should try generate a rails app to test out."
