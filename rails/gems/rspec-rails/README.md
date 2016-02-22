# Setup
## Rails New with Rspec Porting
This guide is created to set up TTD gems when rails are created.
The porting includes:

1. CoffeeScript removal
2. Guard gem inclusion
3. Rspec Guard gem inclusion
4. Guard-Rspec initialization
5. PUMA gem inclusion
6. Guard-Puma inclusion
7. Shoulda-matcher inclusion
8. Shoulda-callback-matcher inclusion
9. Factorygirl inclusion
10. Capybara inclusion
11. Selenium inclusion


<br><br>

### Local Setup
If you're on Linux, you'll need to install these packages for Selenium driver.
```
$ sudo apt-get install firefox xvfb libqtwebkit-dev x11-xkb-utils -y
$ sudo apt-get install xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic -y
```

<br>
If you're on Mac, you'll need to install these packages, assuming you're using
Brew:
```
$ brew install qt5
$ brew link --force qt5
```

<br><br>

### Steps
1) Create a rails new app.
```
$ rails new <app_name> --database=postgresql
```


<br><br>

2) ***Optional***: Scrub the Gemfile comments.


<br><br>


3) ***Optional***: Remove the CoffeeScript gem if you prefer javascript.


<br><br>


4) Add the following gems
```
gem 'puma'

group :development do
  gem 'byebug'
end

group :development, :test do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-puma'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'shoulda-callback-matchers'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'capybara-webkit'

  # For developer's code improvements
  gem 'bullet'
end
```


<br><br>

5) Bundle install to latest gem
```
$ bundle install
```


<br><br>

6) Initialize Bullet by adding the following inside
***config/environments/development.rb***:
```
config.after_initialize do
  Bullet.enable = true
  Bullet.alert = true
end
```


<br><br>

7) Initialize Guard and Rspec:
```
$ rails generate rspec:install
$ guard init rspec
$ guard init puma
```


<br><br>

8) Setup shoulda-matchers by pasting the following codes into the
spec/rails_helper.rb, after the last config 'end' syntax:
```
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```


<br><br>

9) Initialize Capybara by adding the following codes into the
**spec/rails_helper.rb**, at the top with the group of gems 'requires':
```
require 'capybara/rails'
```


<br><br>


10) Commit your changes. Your TTD rails framework is ready.


<br><br>

11) For establishing the server, you can now use 'guard' instead of 'rails s'.
Guard will handles the test execution and server restart from time to time.
```
$ guard
```


<br><br><br>

# Using Rspec Rails
## Automatic Creation
Once rspec rails setup is done, each rails generators will create a spec test
script instead of the common unit test script.


<br><br>

## Manual Creation
1) To generate a rspec test script manually:
```
$ rails g rspec:TYPE

e.g:

$ rails g rspec:model
```

<br><br>
# Other optimization gems:
You can install the following gems separately for optimization purposes.
You don't have to include them inside your gemfile.
Example:
```
gem 'colored'
gem 'traceroute'        # trace unused routes
gem 'rails_best_practices'      # scan codes for best practices
gem 'rubocop'         # scan codes for best practices
gem 'rubycritic'        # scan codes for best practices
gem 'brakeman'          # scan app for security
gem 'rack-mini-profiler'      # profile and benchmark app
```

# References
1. https://github.com/jc00ke/guard-puma
2. https://github.com/rspec/rspec-rails
3. https://github.com/guard/guard-rspec
4. https://github.com/thoughtbot/shoulda-matchers#configuration
5. https://github.com/thoughtbot/factory_girl_rails
6. https://github.com/beatrichartz/shoulda-callback-matchers
7. https://gist.github.com/kyletcarlson/6234923
8. https://gist.github.com/eliotsykes/5b71277b0813fbc0df56
9. http://ricostacruz.com/cheatsheets/rspec-rails.html
10. https://github.com/flyerhzm/bullet
11. https://github.com/whitesmith/rubycritic
12. https://github.com/amatsuda/traceroute
13. https://github.com/presidentbeef/brakeman
14. https://github.com/railsbp/rails_best_practices
15. https://github.com/bbatsov/rubocop#cops
16. https://github.com/MiniProfiler/rack-mini-profiler
17. http://joanswork.com/rubocop-rails-getting-started/
18. https://houndci.com/configuration
