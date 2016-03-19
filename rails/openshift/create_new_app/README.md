# OpenShift Setup for Rails
This guide is based on sitepoint guide with some code corrections.
It is including rspec-rails setup for test-driven development.

<br><br>


# Assumptions
By the time you're reading this guide, I assume you know the followings:

1. Ruby 2.0.0
2. [Generating New Rails App](https://github.com/hollowaykeanho/learning/tree/master/rails/gems/rspec-rails)
3. Experience in setting up Rails into external services like Heroku
4. Familar with Secure SSH
5. Aren't afraid of reading too much documentations
6. Old style hashing
7. You're going to use PUMA as webserver
8. [Know your GIT well!](https://github.com/hollowaykeanho/learning/tree/master/git)

<br><br>


# Some changes from current coding method
OpenShift is currently using Ruby 2.0 as opposed to our latest and greatest.
Hence, you'll need to use  some old convention in order to make thing works.

<br>
These are the major changes:

1) Use old hash syntax instead of the new version:
```
# group: :doc
:group => :doc
```


<br><br>

# Setup
1) Install RedHat toolbelt using the following command:
```
$ gem install rhc
```

<br>
2) Setup your rhc account using the following command:
```
$ rhc setup -l name@email.com
```


<br><br>


# Procedures
> **NOTE**:
>
> Assume your local machine has rhc setup and logged in via terminal.

<br>
1) Go ahead and create a rails app using [rspec-rails guide](https://github.com/hollowaykeanho/learning/tree/master/rails/gems/rspec-rails).

<br><br>


2) After creation, apply the following Gemfile changes:

<br>
Change the modern hashes:
```
gem 'sdoc', '~> 0.4.0', group: :doc
```

Add:
```
group :doc do
  gem 'sdoc', '~> 0.4.0'
end
```

<br><br>


3) Change your config/database.yml production details as follows:
```
production:
  <<: *default
  database: <%= ENV['OPENSHIFT_APPNAME'] %>
  host: <%= ENV['OPENSHIFT_POSTGRESQL_DB_HOST'] %>
  port: <%= ENV['OPENSHIFT_POSTGRESQL_DB_PORT'] %>
  username: <%= ENV['OPENSHIFT_POSTGRESQL_DB_USERNAME'] %>
  password: <%= ENV['OPENSHIFT_POSTGRESQL_DB_PASSWORD'] %>
```

<br><br>


4) Setup the OpenShift app using rhc in terminal:
```
$ rhc app-create -s sniffy ruby-2.0 postgresql-9.2
```

> NOTE:
>
> The actual command is:
> ```
> $ rhc app-create <app_name> <cartiage> <database type>
> ```
>
> For more info, you can read up from this resource:
>
> https://developers.openshift.com/en/languages-overview.html

<br><br>


5) Obtain your app's git URL using the rhc show-app command:
```
$ rhc show-app sniffy
sniffy @ http://sniffy-parallax.rhcloud.com/ (uuid: 2345345345345346346345)
---------------------------------------------------------------------------
  Domain:         parallax
  Created:        Jan 16 05:22 PM
  Gears:          1 (defaults to small)
  Git URL:        gits://eethehaehaehaeh@sniffy-parallax.com/~/git/sniffy.git/
  SSH:            24524yehehserhserhesrh@sniffy-parallax.rhcloud.com
  Deployment:     auto (on git push)

  ruby-2.0 (Ruby 2.0)
  -------------------
    Gears: Located with postgresql-9.2

  postgresql-9.2 (PostgresSQL 9.2)
  --------------------------------
    Gears:          Located with ruby-2.0
    Connection URL: postgresql://$OPENSHIFT_POSTGRESQL_DB_HOST:$OPENSHIFT_POSTGRESQL_DB_PORT
    Database Name:  sniffy
    Password:       JustForThisGuideITypeItMyself=)
    Username:       Wulalala

$
```


> NOTE:
>
> Based on the output, the Git URL is:
>
> ```
> gits://eethehaehaehaeh@sniffy-parallax.com/~/git/sniffy.git/
> ```
>
> You should get your own app's URL.


<br><br>


6) Add the Git URL as a git remote server:
```
$ git remote add openshift gits://eethehaehaehaeh@sniffy-parallax.com/~/git/sniffy.git/
```

> NOTE:
>
> The actual command is:
> ```
> $ git remote add <alias> <url>
> ```


<br><br>


7) Merge the remote repo with the local version using git pull command.
You should expect a conflict for config.ru file.
```
$ git pull openshift master
```

> NOTE:
>
> The actual command is:
> ```
> $ git pull <alias> <branch name>
> ```


<br><br>


8) Resolve the conflict by selecting your config.ru, not remote. It should looks
something like this:
```
#This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
```


<br><br>



9) If a new folder named as the app name exist inside your rails app, delete it.
By right you should only be facing config.ru conflict only.


<br><br>


10) Add and complete the merge conflicts
```
$ git add config.ru
$ git commit
```

> NOTE:
> Save the merge conflict commit.


<br><br>


11) Create the file and corresponding folder(s) inside
**.openshift/action_hooks/override/restart** with the following contents:
```
#!/bin/bash -e

pushd "$OPENSHIFT_REPO_DIR/.openshift/action_hooks/override" >/dev/null
./stop
./start
popd >/dev/null

```


> NOTE:
>
> This is a Bash script openhook for restarting the app.


<br><br>


12) Create the file and corresponding folder(s) inside
**.openshift/action_hooks/override/start** with the following contents:
```
#!/bin/bash -e

source "${OPENSHIFT_RUBY_DIR}/lib/ruby_context"
PUMA_PID_FILE="$OPENSHIFT_RUBY_DIR/run/puma.pid"

echo "Starting Puma"
pushd "${OPENSHIFT_REPO_DIR}" > /dev/null
set -m
ruby_context "umask 002 &>/dev/null ; RAILS_ENV=${RAILS_ENV:-production} nohup /usr/bin/bundle exec ./vendor/bundle/ruby/bin/puma -C config/puma.rb -b tcp://${OPENSHIFT_RUBY_IP}:${OPENSHIFT_RUBY_PORT} --pidfile $PUMA_PID_FILE |& /usr/bin/logshifter -tag ruby &"
set +m
popd > /dev/null

```


> NOTE:
>
> This is a Bash script openhook for starting the app using puma.


<br><br>


13) Create the file and corresponding folder(s) inside
**.openshift/action_hooks/override/stop** with the following contents:
```
#!/bin/bash -e

PUMA_PID_FILE="$OPENSHIFT_RUBY_DIR/run/puma.pid"

echo "Stopping Puma"
if [ -s "$PUMA_PID_FILE" ]; then
  pgrep -f puma -u $UID | grep -q $(<"$PUMA_PID_FILE") && kill $(<"$PUMA_PID_FILE") || rm -f "$PUMA_PID_FILE"
fi
```


> NOTE:
>
> This is a Bash script openhook for stopping puma on the app.


<br><br>


14) Create the file and corresponding folder(s) inside
**.openshift/action_hooks/deploy** with the following contents:
```
#!/bin/bash -e

cat > "${OPENSHIFT_RUBY_DIR}/lib/_override.sh" <<-'EOF'
  # Overridde!
  if [ "$_OVERRIDE" != "69" ]; then
    _OVERRIDE=69
    if [ -n "$1" ] && [ -x "$OPENSHIFT_REPO_DIR/.openshift/action_hooks/override/$1" ]; then
      eval "function $1() { \"$OPENSHIFT_REPO_DIR/.openshift/action_hooks/override/$1\"; }"
      eval "`sed -e '/^source/d' -e "s/^[[:space:]]*function $1/ function _old_$1/" "$0"`"
      exit 0
    fi
  fi
EOF

fgrep -qx 'source "${OPENSHIFT_RUBY_DIR}/lib/_override.sh"' "${OPENSHIFT_RUBY_DIR}/lib/ruby_context" || \
  echo 'source "${OPENSHIFT_RUBY_DIR}/lib/_override.sh"' >> "${OPENSHIFT_RUBY_DIR}/lib/ruby_context"

```


> NOTE:
>
> This is a Bash script openhook for auto-deployment.
> It is used when source code repo is updated to git push.


<br><br>


15) Commit the .openshift changes with git commit
```
$ git add .
$ git commit -m "updated .openshift to control puma"
```


<br><br>


16) Setup your puma configurations in **config/puma.rb**:
```
workers Integer(ENV['WEBCONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
environment ENV['RACK_ENV'] || 'development'
```


<br><br>


17) Commit the puma configurations with git commit
```
$ git add .
$ git commit -m "added puma configuratons"
```


<br><br>


18) Deploy your app using git push:
```
$ git push openshift master
```


<br><br>


19) Migrate your database using the following commands:
```
$ rhc ssh sniffy
RSA 1024 bit CA certificates are loaded due to old openssl compatibility
Connecting to 24524yehehserhserhesrh@sniffy-parallax.rhcloud.com ...

    *********************************************************************

    You are accessing a service that is for use only by authorized users.
    If you do not have authorization, discontinue use at once.
    Any use of the services is subject to the applicable terms of the
    agreement which can be found at:
    https://www.openshift.com/legal

    *********************************************************************

    Welcome to OpenShift shell

    This shell will assist you in managing OpenShift applications.

    !!! IMPORTANT !!! IMPORTANT !!! IMPORTANT !!!
    Shell access is quite powerful and it is possible for you to
    accidentally damage your application.  Proceed with care!
    If worse comes to worst, destroy your application with "rhc app delete"
    and recreate it
    !!! IMPORTANT !!! IMPORTANT !!! IMPORTANT !!!

    Type "help" for more info.

[sniffy-parallax.rhcloud.com 24524yehehserhserhesrh]\> cd app-root/repo
[sniffy-parallax.rhcloud.com 24524yehehserhserhesrh]\> bundle exec rake db:setup RAILS_ENV=production
[sniffy-parallax.rhcloud.com 24524yehehserhserhesrh]\> exit
$
```


<br><br>


21) Set the app to use puma as primary server using rhc environment variable settings:
```
$ rhc env set OPENSHIFT_RUBY_SERVER=puma -a sniffy
RSA 1024 bit CA certificates are loaded due to old openssl compatibility
Setting environment variable(s) ... done
$
```

> Note:
>
> The actual command is:
> ```
> rhc env set OPENSHIFT_RUBY_SERVER=puma -a <app_name>
> ```


<br><br>



22) Restart your app using rhc restart.
```
$ rhc app restart sniffy
RSA 1024 bit CA certificates are loaded due to old openssl compatibility
RESULT:
sniffy restarted
$
```

> Note:
>
> The actual command is:
> ```
> rhc app restart <app_name>
> ```



<br><br>




23) Visit your app website. The app is ready for further development.



<br><br>



24) **Optional**: For better ruby version compatibility, you're advisable to add
the following into your Gemfile:
```
ruby '2.0.0'
```

# References
1. http://www.sitepoint.com/deploy-your-rails-to-openshift/
2. https://github.com/kinsomicrote/puma-openshift
3. https://github.com/puma/puma/blob/master/examples/config.rb
