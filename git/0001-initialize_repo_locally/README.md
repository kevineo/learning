# Initialize Repository from Scratch
This is assuming you're going to start a project from scratch, without any remote (Github etc.) server.


## When do you need this?
1. During a project start-up.
2. Creating a new code tracking.


## Assumption in this guide
1. You know how to create repository in remote server like Github or Gitlab.
2. All the guides below are using terminal command. You should be familar with terminal command.


## Steps
1) Sign up for any remote server like Github or Gitlab. Once you're in, create a repo and obtain the url.
> In this tutorial, assume the link is as follows:
> **https://github.com/hollowaykeanho/learning.git**


<br><br>


2) Now back to your local machine, create your app using the necessary app command. Example:
```
$ rails new APP_NAME # for Ruby on Rails
```

<br><br>


3) Get into the app folder.
```
$ cd APP_NAME
$ pwd               # Verify you're inside the APP_NAME app folder. You should see your app name inside the return value
/home/USERNAME/PATH_TO/APP_NAME
```

<br><br>


4) Initialize a git repository by using git init:
```
$ git init
```

<br><br>


5) Add all existing creation into stage by using git add:
```
$ git add .
```

> Note:
> '.' stands for everything inside the current existing folder.


<br><br>


6) Commit your first creation using git commit:
```
$ git commit -m "Your commit message here."
```

> Note:
> -m stands for short messaging option. You should supply your own message as a commit message.


<br><br>


7) Now it is the time to add the remote server, use the link you created from your remote server and git remote:
```
$ git remote add origin https://github.com/hollowaykeanho/learning.git
```

> *IMPORTANT NOTE*:
> The actual command line is:
> ```
> $ git remote add <alias> <url_link>
> ```
>
> You can use any alias for any given repository url. Just please change it to yours instead of my demo link. Thank you.


<br><br>


8) Once all done, you can push to remote server using git push.
```
$ git push -u origin master
```

> Note:
> The actual command line is:
> ```
> $ git push -u <alias> <branch>
> ```
>
> In this case, it's being pushed to origin repository, master branch.


<br><br>


9) Check your remote server. You should have your code ready for remote.