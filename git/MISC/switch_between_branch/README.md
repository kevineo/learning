# Switch Between Branches
To switch between branches, use git branch to list all the branches then use git checkout.

## List all the branches
```
$ git branch -a
```

> NOTE:
>
> '-a' stands for all branches, locally and remotely

## Switch branch
Switch between branches using git checkout.
```
$ git checkout dev/feature/user
```

> NOTE:
>
> The actual command is:
> ```
> $ git checkout <branch name>
> ```
>
> The command uses the given branch name to scan for any local branch and switch to it.
> If no such local branch exists, it will look for remote branch and create one for you.
>
> A golden rule for a good software development is never development things on the master branch.
>
> Master branch is the soul for your software and customer is using it. You wouldn't want customers
> to complain about your software if you made one wrong mistake when you develop on your master branch.
