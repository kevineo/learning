# Rails New with Rspec Porting
This guide is created to set up TTD gems when rails are created. The porting includes:

1. CoffeeScript removal
2. Guard gem inclusion
3. Rspec Guard gem inclusion
4. Guard-Rspec initialization
5. PUMA gem inclusion
6. Guard-Puma inclusion


# Steps
1) Create a rails new app.
```
$ rails new <app_name> --database=postgresql
```

2) Scrub the Gemfile comments.

3) Remove the CoffeeScript gem.

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
end
```


5) Bundle install to latest gem
```
$ bundle install
```


6) Initialize Guard and Rspec
```
$ rails generate rspec:install
$ guard init rspec
$ guard init puma
```


7) Commit your changes. Your TTD rails framework is ready.


8) For establishing the server, you can now use 'guard' instead of 'rails s'. Guard will handles the test execution and server restart from time to time.
```
$ guard
```


# References
1. https://github.com/jc00ke/guard-puma
2. https://github.com/rspec/rspec-rails
3. https://github.com/guard/guard-rspec
