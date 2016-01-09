# List All Authors
To list all authors in your current branch, simply use:
```
$ git shortlog -sen
```

> NOTE:
> -sn stands for author with number of his/her commits
> -e for email

<br><br>
If you wish to list down authors from all the branches, simply use:
```
$ git shortlog -sen --all
```

> NOTE:
> --all stands for across all branches in the local repo.