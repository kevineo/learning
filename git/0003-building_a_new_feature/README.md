# Building A New Feature
This is a simple on how to use git to build progress over your own software development.
This guide is generally designed for education purposes. It is not a rule, enforcement or laws. Please apply through understanding.

It is not a mandatory to follow the steps shown below as it can be different across the organization.
Despite the differences, there are some converges along the process block.

A good practice is to learn the development process from your organization and adapt to it.

## When do you need this?
1. Start developing a new feature.
2. Starting a new development.
3. Starting to develop


## Assumption in this guide
1. You have a repository in a remote server like Github or Gitlab.
2. You should be familiar with the terminal command.
3. You have setup a local repository either through git init or git clone.


## Steps
1) Go to your local repository.
```
$ cd /PATH/TO/APP_NAME
```


<br><br>


2) Check the status of the current local repository using git status. Ensures you're on the master branch.
```
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.

nothing to commit, working directory clean

$ 
```


> NOTE:
>
> Git status is a life-saving command to check the status and health of a repository.
>
> It reports which branch you're in, what status you're at, changes in files and next action if any.


<br><br>


3) Git pull for getting the latest update from the master branch. Ensures you'll see up-to-date reporting.
```
$ git pull
Already up-to-date.

$
```


<br><br>


4) Create a remote branch using git push. You can use git branch -a to list out all the branches, locally and remotely.
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


<br><br>


5) Checkout your development branch using git checkout.
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


<br><br>


6) Begin your development. Once done, use git add to add all the files and changes into staging branch.
```
$ git add .
```

> Note:
>
> You may begin your development in your branch. Once done, git add command is being used.
>
> The actual command is:
>
> ```
> $ git add <filename>
> ```
>
> a '.' is used if you want to add all the changes inside the current directory.


<br><br>


7) Perform a git status to do a file changes. You should see the files listed in staging mode ready for commit.
```
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  new file:   0003-building_a_new_feature/README.md

$ 
```


If you want to reset the file. Follow the given instruction to reset a particular file:
```
$ git reset 0003-building_a_new_feature/README.md
```

> Note:
>
> The actual command is:
> ```
> $ git reset <FILENAME>
> ```

<br><br>

Otherwise, you can use git commit to create a change commit.
```
$ git commit -m "Added new files"
```

> Note:
>
> The actual command is:
> ```
> $ git commit <option> <data if any>
> ```
>
> <br>
> You can read more about option here: https://git-scm.com/docs/git-commit
>
> "-m" stands for short messages. For tutorial simplicity, we'll guide you use -m, even we encourage -s.
>
> "-s" stands for signature. This will append a signed-off with your name and contact for a commit.
>
> "-a" stands for all. This will add everything.
> <br><br>
> Both '-s' and '-a' doesn't need additional data.
> However, they'll bring up an editor interface, usually in vim editor for the user to write their messages.
> If you aren't familar with vim terminal, then use -m.
>
> ---------
> If you're experienced with source code management, it's best to use -s to hold responsibility for your
> code changes. Be proud of your code!
>
> ---------
> Try to commit small and commit often. By small, it means one commit for one purpose.
>
> If you happen to write a message like:
> ```
> "Added feature A and fixed bug #1231231"
> ```
>
> That means it is a large commit due to 2 purposes. By right it should be:
>
> Commit 1: Added feature A
>
> Commit 2: Fixed bug #1231231
>
> <br>
> Small commits allow easier recovery management and cleaner historical tracking.


<br><br>


8) If you have more commits, repeat step (6).


<br><br>


9) Once done, perform a git status to check the branch status. Ensure you're ahead of your remote branch.
```
$ git status
On branch dev/feature/user
Your branch is ahead of 'origin/dev/feature/user' by 2 commits.
  (use "git push" to publish your local commits)

nothing to commit, working directory clean

$
```


<br><br>



10) Perform the following for to merge the latest master branch into your local branch after step (9).
```
$ git pull origin master
```

> NOTE:
>
> By this command, you will be pulled into a terminal prompt saying "merge 'master' from URL."
> This means that there is no conflict. Commit that change.


<br><br>



11) If you are reported with merge conflict, skip to step (17) else follow the next step.


<br><br>



12) If step (10) reported conflicted file, something looks like this:
```
b-server$ git pull origin master
From github.com:hollowaykeanho/sinatra-web-server
 * branch            master     -> FETCH_HEAD
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Auto-merging Gemfile.lock
CONFLICT (content): Merge conflict in Gemfile.lock
Auto-merging Gemfile
CONFLICT (content): Merge conflict in Gemfile
Automatic merge failed; fix conflicts and then commit the result.
holloway@HOLLOWAY-SPECTRE:~/Documents/code_development/hollowaykeanho/sinatra-web-server$ 

```

you'll need to go through each of the files and resolve those conflict.

<br><br>

Use git status to find out all conflicted files:
```
$ git status

On branch bluemix
Your branch is up-to-date with 'origin/bluemix'.

You have unmerged paths.
  (fix conflicts and run "git commit")

Unmerged paths:
  (use "git add <file>..." to mark resolution)

  both modified:      Gemfile
  both modified:      Gemfile.lock
  both modified:      README.md

no changes added to commit (use "git add" and/or "git commit -a")

```


<br><br>



13) Following step (12), resolve all conflict by selecting the code. Select the code block without many modifications.
Please read **important note** for this section.
```
>>>>>>> 6c02f6fd67369d5233d7390bf5ec8a4cd46f540d

>**NOTE**:
>This guide assumes you are good with Ruby, Heroku, Bluemix and understands MVC architecture patterns.

# To go for platform specific code, please visit these pages:
1. Heroku - https://github.com/hollowaykeanho/sinatra-web-server/tree/heroku
2. Bluemix - https://github.com/hollowaykeanho/sinatra-web-server/tree/bluemix
3. Cloud9 - continue to read README.
<<<<<<< HEAD
=======
```

> NOTE:
>
> Conflict occurs when there is a drastic changes in certain line of code until git doesn't know how to select which block of codes.
>
> Your job is to help git to select and merge the code blocks without introducing new line of code.
>
> Your conflicted code block is presented as:
> ```
> >>>>>>> <commit id that is being merged from external>
>       <code block from the external branch>
> <<<<<<< <HEAD commit from your branch>
>       <code block from your branch>
> ======= <end of conflicted code merge>
> ```

<br><br>

> **Important Note**:
> As a good practice and a line of defense against copyright infringement among developers, you ***shouldn't*** introduce a new line of code when resolving a merge conflict.
>
> Merge process is only about selecting code block or merge 2 blocks of code without a new line of changes.
>
> <br>
> -----------
> Usually, there are 4 common cases:
>
> 1. Your local code block supposed to override remote code block
>
> 2. Remote code block supposed to override your local code block
>
> 3. Your local code block is mergable with remote code block without code removal from each side.
>
> 4. Either code blocks need to be altered in order to have a successful commit.
>
> <br><br>
> The common action for each cases are:
>
> 1. For case #1, select your local code block and delete remote code block.
>
> 2. For case #2, select remote code block and delete your local code block.
>
> 3. For case #3, merge them.
>
> 4. For case #4, select the remote code and discard your local code block. Then, after the merge conflict is commited, create a new commit that introduces your changes on top of it.
>
>
> For case #4, if you found a bug from the remote code block, raise it as a bug and should be tracked somewhere else.
>
> <br><br>
>
> Golden Rule: **NEVER** alter codes commited by someone else since git merge tracks you as an author for merging and solving conflicts.


<br><br>



14) Following Step (13), use git add to add all conflict resolved files into staging
```
$ git add Gemfile Gemfile.lock README.md 
# OR 
$ git add .
```


<br><br>


15) Following Step (14), Use git status to check for merge commit status. It looks something like this:
```
$ git status
On branch bluemix
Your branch is up-to-date with 'origin/bluemix'.

All conflicts fixed but you are still merging.
  (use "git commit" to conclude merge)

Changes to be committed:

  modified:   Gemfile
  modified:   Gemfile.lock
  modified:   README.md
```


<br><br>


16) Following step(15), use 'git commit' as instructed by git. Comply your merge messages and commit it.
```
$ git commit
```


<br><br>


17) Now git push to your remote branch.
```
$ git push
```

<br><br>


18) On your remote server, you can now raise a pull request for codes review.

<br><br>


19) If the review session requires you to do more changes, got to step (5). Pass this step if the review goes successful and the branch is merged.

<br><br>


20) Check out your master branch and perform a new pull. Congrats! Your codes have merged successfully. Restart from Step (1) for any new development.
```
$ git checkout master
$ git pull
```

