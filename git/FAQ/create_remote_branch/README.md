# Create a Remote Branch
Create a remote branch using git push. You can use git branch -a to list out all the branches, locally and remotely.
```
$ git branch -a
  bluemix
  heroku
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/bluemix
  remotes/origin/heroku
  remotes/origin/master

$ git push origin master:dev/feature/user
```

> NOTE:
>
> The actual command is:
> ```
> $ git push <alias> <local branch name>:<remote branch name>
> ```
>
> This command basically push a local branch to a remote repository with a designated branch name.
> We used git branch to see what are the available branches. Then we found a local master branch.
> Then we proceed to create a "dev/feature/user" remote branch based to our local master branch using git push.
> 
> alias - name of the repository
>
> local branch name - a local branch name. This name usually doesn't have any "remotes" tied to it. 
>
> remote branch name - the desired name for the remote branch. 
>
> <br><br>
> Some common name for remote branch:
>
> dev/**    - stands for development branch.
>
> rel/**    - stands for release branch.
>
> fixes/**  - stands for bug fixes branch.
>
> test/**   - stands for test branch.
>
> staging   - stands for staging branch (a mirror of master branch for continous integration)