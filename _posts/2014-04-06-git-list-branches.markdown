---
layout: post
title: git list branches
date: 2014-04-06 16:58:31.000000000 -04:00
---
---
### just list some branches

		git branch
    
### list sorted branches with the one with the most recent commit on top

		git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'

### list sorted branches with the hash

		git for-each-ref --sort=-committerdate refs/heads/


from [stackexchange](https://stackoverflow.com/questions/5188320/how-can-i-get-a-list-of-git-branches-ordered-by-most-recent-commit)
