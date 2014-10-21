---
layout: post
title: cpan minus setup
date: 2014-07-13 21:55:18.000000000 -04:00
---
# unprivlidged cpan minus setup

    curl -L cpanmin.us | perl - -l $HOME/perl5 App::cpanminus local::lib

Taken from the [catalyst webframe work site](http://www.catalystframework.org/).
