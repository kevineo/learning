# To Resolve Conflicts
If a git merge reported conflicted file(s), something looks like this:
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



1) Resolve all conflict by selecting the code. Select the code block without many modifications.
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
>
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



2) Use git add to add all conflict resolved files into staging
```
$ git add Gemfile Gemfile.lock README.md 
# OR 
$ git add .
```


<br><br>


3) Use git status to check for merge commit status. It looks something like this:
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


4) Use 'git commit' as instructed by git. Comply your merge messages and commit it.
```
$ git commit
```
