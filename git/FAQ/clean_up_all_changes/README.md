# Clean Up All Changes
To clean up all changes in local repo back to HEAD commit,
use git checkout and git clean

```
$ git checkout .
$ git clean -d -f
```

> NOTE:
>
> git checkout remove all modified changes.
>
> git clean uses 3 flags:
>
> 1. -d = remove directory creation
> 3. -f = forcefully remove


References:
1. https://www.kernel.org/pub/software/scm/git/docs/git-clean.html