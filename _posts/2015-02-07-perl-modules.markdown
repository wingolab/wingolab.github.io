---
layout: post
title: "perl modules"
date: "2015-02-07"
---

# find a module location

Basically, `@INC` gives you the locations of modules; `%INC` is a hash with the
keys as modules and values as locations of the module.

    perl -MXSLoader -lE 'map { print join(" ", $_, "=>", $INC{$_}); } keys %INC'

You can also achieve the same effect of figuring out where the module is located
using `perldoc`.

    perldoc -lm XSLoader
