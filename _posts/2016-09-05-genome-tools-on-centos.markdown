---
layout: post
title: "install genometools on centos"
date: "2016-09-05 16:31:11 -0400"
---


```
sudo yum install cairo.x86_64 cairo-devel.x86_64 pango-devel.x86_64 pango.x86_64
git clone https://github.com/genometools/genometools.git
cd genometools
make -j4 install prefix=~/local/bin
```
