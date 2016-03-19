# Clearance Gem
Clearance is a popular gem next to Devise gem for user management.
It contains only the simple username and password sign up.

## Assumption
I'm assuming you already done the following:

1. your rails app has the setup found in this guide:
[rspec-rails](https://github.com/hollowaykeanho/learning/tree/master/rails/gems/rspec-rails)
2. you have a ready app standing by.
3. you know your ruby on rails stuff quite well.
4. you know your git very well.

## Steps
1) Setup your Figaro.

<br>

----------
<br><br>

2) Setup your [ActionMailer](https://github.com/hollowaykeanho/learning/tree/master/rails/gems/action-mailer).

<br>

----------
<br><br>

3) Add the gem into your Gemfile then bundle install the app.

```
gem 'clearance'
```

<br>

----------
<br><br>

4) Do a Clearance installation into the app.

```
$ rails generate clearance:install
```

<br>

----------
<br><br>

5) Do a Clearance route generator.

```
$ rails generate clearance:routes
```

<br>

----------
<br><br>

6) Do a Clearance view generator. Amend the ```layout/application.html.erb```
not to overwrite the existing resources. Only allow sensible code inside that
file.

```
$ rails generate clearance:views
```

<br>

----------
<br><br>

7) Generate the necessary test cases.

```
$ rails generate clearance:specs
```

<br>

----------
<br><br>

8) Run the test. Debug when possible.

<br>

----------
<br><br>

9) Should all test are passing, you can proceed with git commit.

```
$ git add .
$ git commit -s
```

## References
1. https://github.com/thoughtbot/clearance