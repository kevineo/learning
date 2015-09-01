# Install Dependency
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# Install Ruby
	# Install RVM
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

	# Install Ruby
echo -n "Ruby Version (default: 2.2.3):"
read version
version=${version:=2.2.3}
rvm install $version
rvm use $version --default
ruby -v

	# Setup Gemfile
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler


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
	# Install Node JS dependency
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

	# Install Rails
gem install rails
rbenv rehash

# Install Postgresql
sudo apt-get update
sudo apt-get install postgresql-common postgresql-contrib
sudo apt-get install postgresql libpq-dev
	# Setup user for Postgresql
sudo -u postgres createuser $USER -s
sudo -u postgres psql --command "\\password $USER"

# Done
echo "Setup Completed. You should try generate a rails app to test out."