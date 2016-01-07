# Setup
## Rails New with Rspec Porting
This guide is created to set up TTD gems when rails are created. The porting includes:

1. CoffeeScript removal
2. Guard gem inclusion
3. Rspec Guard gem inclusion
4. Guard-Rspec initialization
5. PUMA gem inclusion
6. Guard-Puma inclusion
7. Shoulda-matcher inclusion
8. Shoulda-callback-matcher inclusion
9. Factorygirl inclusion


### Steps
1) Create a rails new app.
```
$ rails new <app_name> --database=postgresql
```


<br><br>

2) Scrub the Gemfile comments.


<br><br>


3) Remove the CoffeeScript gem.


<br><br>


4) Add the following gems
```
gem 'puma'

group :development, :test do
	gem 'byebug'
	gem 'guard'
	gem 'guard-rspec'
	gem 'guard-puma'
	gem 'rspec'
	gem 'rspec-rails'
	gem 'shoulda-matchers'
	gem 'factory_girl_rails'
	gem 'shoulda-callback-matchers'
end
```


<br><br>

5) Bundle install to latest gem
```
$ bundle install
```


<br><br>

6) Initialize Guard and Rspec
```
$ rails generate rspec:install
$ guard init rspec
$ guard init puma
```


<br><br>

7) Setup shoulda-matchers by pasting the following codes into the spec/rails_helper.rb:
```
Shoulda::Matchers.configure do |config|
	config.integrate do |with|
		with.test_framework :rspec
		with.library :rails
	end
end
```


<br><br>

8) Commit your changes. Your TTD rails framework is ready.


<br><br>

9) For establishing the server, you can now use 'guard' instead of 'rails s'. Guard will handles the test execution and server restart from time to time.
```
$ guard
```


<br><br><br>

# Using Rspec Rails
## Automatic Creation
Once rspec rails setup is done, each rails generators will create a spec test script instead of the common unit test script.


<br><br>

## Manual Creation
1) To generate a rspec test script manually:
```
$ rails g rspec:TYPE

e.g:

$ rails g rspec:model
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
