---
layout: post
title: git recover deleted file
date: 2014-04-05 17:53:25.000000000 -04:00
---
##recover deleted files

		git ls-files -d | xargs git checkout --

from [stack exchange](https://stackoverflow.com/questions/953481/restore-a-deleted-file-in-a-git-repo)
