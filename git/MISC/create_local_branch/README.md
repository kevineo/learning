# Create a Branch
To branch out from original branch.

## Locally without tracking
To branch out without tracking
```
$ git checkout -b <branch name>
```

> NOTE:
>
> -b stands for opening a local branch

## Locally with tracking
```
$ git checkout -b <branch name> -t <tracking branch name>
```

> NOTE:
>
> -t stands for tracking

## Locally with an existing remote branch
```
$ git checkout <remote branch name>
```

> NOTE:
> 
> This creates a local branch automatically.