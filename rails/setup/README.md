# Rails Setup Bash Script
This folder is created for automating Ruby on Rails installation.

Version 0.5.1

# Current support:
| OS                                         | Version  |     Status     |
|:-------------------------------------------|:--------:|:--------------:|
| Mac OSX - El Capitan                       |  0.5.1   | tested working |
| Xubuntu 14.04 64-bit                       |  0.5.0   | tested working |
| Xubuntu 14.10 32-bit                       |  0.5.0   | tested working |
| Mac OSX - Yosmite                          |  0.5.0   | tested working |
| Ubuntu Mate 15.04 32-bit                   |  0.5.0   | tested working |
| Ubuntu Mate 15.04 64-bit                   |  0.5.0   | tested working |
| Raspberry Pi Ubuntu Mate 15.04 64-bit      |  0.5.0   | tested working |

# To start
1) Installation needs sudo or admin authority. Please request from your admin / owner if you do have sudo password.

<br><br>

2) Go to desktop folder.

```
$ cd ~/Desktop
```

<br><br>

3) Download the correct script. Right click and save the script.

Ubuntu or Xubuntu - [Here](https://raw.githubusercontent.com/hollowaykeanho/learning/master/rails/setup/ubuntu/rails_setup_deb.sh)

```
$ wget https://raw.githubusercontent.com/hollowaykeanho/learning/master/rails/setup/ubuntu/rails_setup_deb.sh
```

<br>
MAC OSX:

```
$ curl -# -O https://raw.githubusercontent.com/hollowaykeanho/learning/master/rails/setup/mac/rails_setup_osx.sh
```


<br><br>

4) Perform the following command:

```
$ chmod +x script_name.sh
$ sh script_name.sh
```

<br><br>

5) The follow the automation instruction. Please watch and stay tuned for the prompted inputs from time to time.

<br><br>

# Checking
The script is a straight forward installation without feedback control. Hence, should there is an error in installation (say rbenv was not installed properly), your rails is installed successfully / correctly.

<br>
There are 2 generals checking steps you need to do:

<br><br>
## 1) Check for successful installation
Within the terminal after your automated installation is completed:

Ubuntu / Linux: (you should see your ruby and rails is source from .rvm folder)

```
$ which ruby
/home/your_username/.rvm/rubies/ruby_version/bin/ruby
$ which rails
/home/your_username/.rvm/rubies/ruby_version/bin/rails
$
```

<br>
Mac User: (you should see your ruby and rails is source from .rbenv folder)

```
$ which ruby
/Users/your_username/.rbenv/shims/ruby
$ which rails
/Users/your_username/.rbenv/shims/rails
$
```

<br><br>

## 2) Ensure terminal always source the correct Ruby
Now close the terminal window and open a new one. Perform step #1 again.
You should expect the same result.

<br><br>
# Troubleshooting
If your installation has failed, you can perform the following instruction to remove the existing contents (if any).

<br>
Ubuntu / Linux:

```
$ rvm implode
```

<br><br>
MAC OSX:

```
$ rm -rf ~/.rbenv
```

<br>
Once done, you can restart the script again or you can do it manually where the steps are available in the reference section.


# References
## Mac
1. https://gorails.com/setup/osx/10.10-yosemite
2. http://railsapps.github.io/installrubyonrails-mac.html

## Ubuntu
1. https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm
2. https://gorails.com/setup/ubuntu/15.04
3. https://gorails.com/setup/ubuntu/14.10
4. https://help.ubuntu.com/lts/serverguide/ruby-on-rails.html
