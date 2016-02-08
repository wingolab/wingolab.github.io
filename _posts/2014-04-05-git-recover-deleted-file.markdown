---
layout: post
title: git commands
date: 2014-04-05 17:53:25.000000000 -04:00
---
##recover deleted files

    git ls-files -d | xargs git checkout --

from [stack exchange](https://stackoverflow.com/questions/953481/restore-a-deleted-file-in-a-git-repo)

##remove a file and push those local changes to the remote repository

1.  First, you'll need to remove the file from the branches. You might want to
clone the repository first so you're working with a copy.

```
    git clone --bare repo.git repoCopy.git
    git filter-branch --tree-filter 'rm -f ACCIDENTALLY_COMMITTED_FILE.txt' HEAD
```

2. Second, force the new commits to the remote repository

```
    git push --force origin master
```
