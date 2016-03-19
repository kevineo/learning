# Figaro
Figaro gem is recommended for local sensitive privacy data protection. For
remote system, it is advisable to use environment variables.

## Assumption
This guide assumes you know the following:

1. your rails app has the setup found in this guide:
[rspec-rails](https://github.com/hollowaykeanho/learning/tree/master/rails/gems/rspec-rails)
2. you have a ready app standing by.
3. you know your ruby on rails stuff quite well.
4. you know your git very well.

## Steps
1) Include the Figaro gem inside your Gemfile and then perform a bundle install.

```
gem 'figaro'
```

<br>

----------
<br><br>

2) Perform Figaro installation.

```
$ bundle exec figaro install
```

<br>

----------
<br><br>

3) Tidy up the ```config/application.yml``` with the following template.
This will organize the values in simple grouping.

```
default: &default

development:
  <<: *default

test:
  <<: *default

production:
  <<: *default
```

<br>

----------
<br><br>

4) Once done, perform the git commit.

<br>

----------
<br><br>

## References
1. https://github.com/laserlemon/figaro