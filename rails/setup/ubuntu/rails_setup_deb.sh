echo -n "Your Name: "
read username
echo -n "Your Email: "
read email

# Install Postgresql
sudo apt-get update -y
sudo apt-get install -y postgresql-common postgresql-contrib
sudo apt-get install -y postgresql libpq-dev
	# Setup user for Postgresql
sudo -u postgres createuser $USER -s
sudo -u postgres psql --command "\\password $USER"

# Setup ssh
ssh-keygen -t rsa -C $email << EOF



EOF
ssh-add ~/.ssh/id_rsa

# Install Dependency
sudo apt-get update -y
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# Install Ruby
	# Install RVM
sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo 'source ~/.rvm/scripts/rvm' >> ~/.bashrc

	# Install Ruby
echo 'Installing Ruby version with 2.2.3'
version=2.2.3
rvm install $version
rvm use $version --default

	# Setup Gemfile
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler


# Setup Git
git config --global color.ui true
git config --global user.name $username
git config --global user.email $email


# Install Rails
	# Install Node JS dependency
sudo apt-get update -y
sudo apt-get install -y nodejs

	# Install Rails
gem install rails

# Done
source ~/.bashrc
echo "Setup Completed. You should try generate a rails app to test out."
