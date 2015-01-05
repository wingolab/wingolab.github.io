---
layout: post
title: "perl mysql"
date: "2015-01-04"
---

# perl DBD::mysql

By default `DBD::mysql` does not compile in ssl. The simplest way to have it
compile with ssl is to set the environmental variable, `export DBD_MYSQL_SSL=1`.
If you install it with `cpanm`, for instance, it will install correctly if you
set the environmental variable.

There are other environmental variables, too, that can be set, mostly to assist
with testing. See `perldoc DBD::mysql`.
