# Git Workflow

> **NOTE**:
> This is not a mandatory workflow. It is a simple and basic software control management that I find managable and practical across different team.


## Start From Scratch
### To initiate a repo
Starting a repo without any remote server.
```
$ git init
```


### To add remote server
To link up with remote server
```
$ git remote add origin <link>
```


### To add new changes into stage
```
$ git add <filename or path> --all
```


### To commit a change
```
$ git commit -s
OR
$ git commit -m
OR
$ git commit -a
```


### To push to remote server after your init
```
$ git push -u origin master
```




## Use an Existing Repo
### To clone a remote server
```
$ git clone <link>
```


## Workflow
### To create a remote branch
```
$ git push origin master:<branch_name>
```


### Change local branch
```
$ git checkout <branch name>
```


### To add new changes
See Above.


### To commit new changes
See Above.


## To push to remote server
```
$ git push
```