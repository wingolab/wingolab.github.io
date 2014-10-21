---
layout: post
title: git ignore
date: 2014-04-13 09:34:38.000000000 -04:00
---
### ignore stuff when using git

Tells you what's currently being used to ignore stuff:

	git config --get core.excludesfile

Configure git to ignore `~/.gitignore`

	git config --global core.excludesfile '~/.gitignore'

From github, here's a [suggestion](https://gist.github.com/octocat/9257657) of things to globally ignore:

	# Compiled source #
	###################
	*.com
	*.class
	*.dll
	*.exe
	*.o
	*.so
	 
	# Packages #
	############
	# it's better to unpack these files and commit the raw source
	# git has its own built in compression methods
	*.7z
	*.dmg
	*.gz
	*.iso
	*.jar
	*.rar
	*.tar
	*.zip
 
	# Logs and databases #
	######################
	*.log
	*.sql
	*.sqlite
 
	# OS generated files #
	######################
	.DS_Store
	.DS_Store?
	._*
	.Spotlight-V100
	.Trashes
	ehthumbs.db
	Thumbs.db

For project specific stuff to ignore try this [git repo](https://github.com/github/gitignore).
