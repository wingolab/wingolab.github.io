---
layout: post
title: "perl error handling"
date: "2015-04-01"
---

## Simple perl error handling.

Lots of people like `Try::Tiny`, which is fine. I have used the following approach
that I got from a book, somewhere in the back I think, but also has been written
about by others (see refs below). Basically, you just put the thing that might
fail in an eval block, as per usual, and inspect the return value (without
necessarily depend on `$@` to have the right error since it can be clobbered
sometimes).

    eval {

      # do something that fails
      1 / 0;

      # return true to indicate success
      1;
    }
    or do {

      # say something about it and have a default statement
      my $error = $@ || 'unknown failure';

      # notice you'll need the semi-colon unless you're at the end of a block
    };

See this [stackoverflow](http://stackoverflow.com/a/7599303) answer for more details.
Originally got information from [perltv.org](http://perltv.org/).
