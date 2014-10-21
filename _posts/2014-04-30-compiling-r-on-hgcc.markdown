---
layout: post
title: compiling R on hgcc
date: 2014-04-30 22:37:35.000000000 -04:00
---
Annoyed that the system R is old and some packages no longer support it? Just compile it, but remember:

1. **compile** on the **head node** since it has the include directories and shared libraries mounted (it's sometimes mirrored on the other nodes but don't count on it).
2. You might need to compile [GNU readline](http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html) package first.

Here's how I configured it last time

    ./configure --prefix=$HOME --includedir=$HOME/include --libdir=$HOME/lib --enable-R-shlib --with-blas --with-lapack
