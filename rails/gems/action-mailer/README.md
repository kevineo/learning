# ActionMailer
This is about deploying ActionMailer into Rails.
You can send email both synchronously and asynchronously.


# Assumption
This guide assumes you know the following:

1. Setting Up Figaro gem
2. Using gmail with lesser password ability

<br><br>
# Mailer Setup
1) Include the following settings inside your
**config/environments/development.rb**:
```
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: ENV['mailer_domain'] }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    address:                  "smtp.gmail.com",
    port:                     587,
    domain:                   "gmail.com",
    user_name:                ENV['mailer_username'],
    password:                 ENV['mailer_password'],
    authentication:           :plain,
    enable_starttls_auto:     true
  }
```


<br><br>


2) Include the following settings inside your
**config/environments/test.rb**:
```
  config.action_mailer.delivery_method = :test
  config.action_mailer.default_url_options = { host: ENV['mailer_domain'] }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    address:                  "smtp.gmail.com",
    port:                     587,
    domain:                   "gmail.com",
    user_name:                ENV['mailer_username'],
    password:                 ENV['mailer_password'],
    authentication:           :plain,
    enable_starttls_auto:     true
  }
```


<br><br>


3) Include the following settings inside your
**config/environments/production.rb**:
```
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: ENV['mailer_domain'] }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    address:                  "smtp.gmail.com",
    port:                     587,
    domain:                   "gmail.com",
    user_name:                ENV['mailer_username'],
    password:                 ENV['mailer_password'],
    authentication:           :plain,
    enable_starttls_auto:     true
  }
```


<br><br>


4) Configure your Figaro **config/application.yml** to supply mailer_domain,
mailer_username and mailer_password. It looks something like this:
```
default: &default
  mailer_username: 'yours_truly@gmail.com'
  mailer_password: 'Some_password'

development:
  <<: *default
  mailer_domain: 'localhost:4000'

test:
  <<: *default
  mailer_domain: 'localhost:4000'

production:
  <<: *default
```


> NOTE:
>
> For production environment, you should set it as environment variables
> instead.



<br><br>


5) Run some test and your app is ready to send email!



<br><br>


6) Git commit your changes


# Read-Up Materials
1. http://www.gotealeaf.com/blog/handling-emails-in-rails
2. http://guides.rubyonrails.org/action_mailer_basics.html
3. http://guides.rubyonrails.org/configuring.html#configuring-action-mailer
4. http://stackoverflow.com/questions/21423779/rspec-actionmailerbase-deliveries-should-be-empty

# Steps
1. Refers to sample_app. Switch to commit related to that app.
2. Read up the commit log. It contains step-by-step code changes.
