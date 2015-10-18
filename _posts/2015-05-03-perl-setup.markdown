---
layout: post
title: "perl setup"
date: "2015-05-03"
---

# Setup your own perl binaries and package libraries

## preamble

I like putting all of the system-like directories into one directory, called
`local_sys`, when installing things that override the system default settings.
In my `.bashrc` or `.profile` file I setup the following:

    # set local system
    export LOC_SYS=${HOME}/local_sys

    # set path
    export PATH=${LOC_SYS}/bin:${LOC_SYS}/bin/x86_64:${LOC_SYS}/perl5/bin:${PATH}}

    # set local ld lib
    export LD_LIBRARY_PATH=${LOC_SYS}/lib:${LOC_SYS}/lib64:${LD_LIBRARY_PATH}
    export LD_RUN_PATH=${LOC_SYS}/lib:${LD_RUN_PATH}

To install perl(s) with perlbrew; this seems to work.

## install `perlbrew`:


    git clone https://github.com/gugod/App-perlbrew.git
    cd ./perlbrew
    ./perlbrew init

### At this point, add the following to `.bashrc`:

    export PERLBREW_HOME=~/local_sys/.perlbrew
    source ~/local_sys/perl5/perlbrew/etc/bashrc

### Build a local perl:

    ./perlbrew install-patchperl
    ./perlbrew available
    ./perlbrew install perl-5.20.2

## install `cpanm`:


    git clone https://github.com/miyagawa/cpanminus
    perl Makefile.PL
    make

## install `local::lib`:


    ./cpanm local::lib
    git clone https://github.com/Perl-Toolchain-Gang/local-lib.git
    perl Makefile.PL --bootstrap=${LOC_SYS}
    make test && make install

Now, add this to your `.bashrc` to export the environmental variables needed by
`local::lib`.

    eval $(perl -I${LOC_SYS}/perl5/lib/perl5 -Mlocal::lib=${LOC_SYS}/perl5)
