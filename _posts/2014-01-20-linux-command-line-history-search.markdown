---
layout: post
title: linux command line history search
date: 2014-01-20 21:10:06.000000000 -05:00
---
How to implement autocompletion on a unix commandline. Edit `.inputrc` and add the following:

```
"\e[B": history-search-forward
"\e[A": history-search-backward
"\e[5~": previous-history
"\e[6~": next-history
```

These changes rebind the up and down arrows to search the history for commands that begin with the whatever happens to be on the command line. Page-up and page-down are rebound to search through the history forwards and backwards, respectively.
