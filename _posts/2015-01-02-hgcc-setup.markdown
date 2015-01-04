---
layout: post
title: "hgcc setup"
date: "2015-01-02"
---

# setup local env on hgcc

I use a directory called `~/software` and `git` (mostly) to clone repositories
and build them. I have a "local system" directory, called `local` that I store
all my build stuff and other things that can be lost without loosing any sleep.

## bashrc

Ensure you have the following in your paths.

    # local system dir
    export LOC_SYS=${HOME}/local

    # Path
    export PATH=${LOC_SYS}/bin:${PATH}

    # local library
    export LD_LIBRARY_PATH=${LOC_SYS}/lib:${LOC_SYS}/lib64:${LD_LIBRARY_PATH}
    export LD_RUN_PATH=${LOC_SYS}/lib:${LD_RUN_PATH}
    export NGS_LIBDIR=${LOC_SYS}/lib64

    # perl local::lib
    eval $(perl -I${LOC_SYS}/perl5/lib/perl5 -Mlocal::lib=${LOC_SYS}/perl5)

    # for perlbrew
    #source ${LOC_SYS}/perl5/perlbrew/etc/bashrc
    #export PERL5LIB=${LOC_SYS}/perl5/lib/perl5

    # local R lib
    export R_LIBS=${HOME}/local/lib/R


### curl

    git clone git://github.com/bagder/curl.git
    cd curl
    ./configure --prefix=${HOME}/local
    make
    make test # fails at ~700.. not sure why
    make install

### git

    git clone https://github.com/git/git.git
    cd git
    make configure
    ./configure --prefix=${HOME}/local --with-curl=${HOME}/local
    make all doc
    make install install-doc install-html

### perl stuff

    git clone https://github.com/miyagawa/cpanminus
    cd cpanminus
    ./cpanm --local-lib=~/local/perl5 local::lib && \
     eval $(perl -I ~/local/perl5/lib/perl5/ -Mlocal::lib)

    cpanm Cpanel::JSON::XS Excel::Writer::XLSX Getopt::Long IO::Compress::Gzip \
     IO::Uncompress::Gunzip Math::GSL Modern::Perl MongoDB MongoDB::OID \
     Spreadsheet::ParseExcel Spreadsheet::XLSX Text::CSV_XS Text::Iconv \
     Time::localtime MooseX::Role::MongoDB Path::Class IO::All Task::Kensho

### gcc

    git clone git://gcc.gnu.org/git/gcc.git
    cd gcc

### gcc dependency, gmp

    wget http://ftp.gnu.org/gnu/gmp/gmp-5.1.3.tar.gz
    wget http://ftp.gnu.org/gnu/gmp/gmp-5.1.3.tar.gz.sig
    gpg --keyserver keyserver.ubuntu.com --recv-keys 28C67298
    gpg --verify gmp-5.1.3.tar.gz.sig
    cd gmp-5.1.3
    ./configure --prefix=${HOME}/local
    make
    make install
    cd ..

### gcc dependency, **isl**

    wget ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.14.tar.bz2
    tar xjf isl-0.14.tar.bz2
    ./configure --prefix=${HOME}/local --with-gmp-prefix=${HOME}/local

### gcc dependency, **mpfr**

    wget http://ftp.gnu.org/gnu/mpfr/mpfr-3.1.2.tar.gz
    wget http://ftp.gnu.org/gnu/mpfr/mpfr-3.1.2.tar.gz.sig
    gpg --keyserver keyserver.ubuntu.com --recv-keys 98C3739D
    gpg --verify mpfr-3.1.2.tar.gz.sig
    tar xvf mpfr-3.1.2.tar.gz
    make
    ./configure --prefix=${HOME}/local --with-gmp=${HOME}/local/
    make
    make install
    cd ..

### gcc dependency, **mpc**

    wget http://ftp.gnu.org/gnu/mpc/mpc-1.0.2.tar.gz
    wget http://ftp.gnu.org/gnu/mpc/mpc-1.0.2.tar.gz.sig
    gpg --keyserver keyserver.ubuntu.com --recv-keys 765C61E3
    gpg --verify mpc-1.0.2.tar.gz.sig
    tar xvf mpc-1.0.2.tar.gz
    ./configure --prefix=${HOME}/local --with-gmp=${HOME}/local/ \
     --with-mpfr=${HOME}/local/
    make
    make install
    cd ..

    # now, we're ready to make gcc
    ./configure --prefix=${HOME}/local --with-gmp=${HOME}/local/ \
     --with-mpfr=${HOME}/local/ --with-mpc=${HOME}/local/ --disable-multilib \
     --enable-threads=posix --enable-plugin --enable-initfini-array \
     --with-isl=${HOME}/local/

### boost

Browse [here](http://sourceforge.net/projects/boost/) to get the latest binary package.

## Linear Algebra PACKage (lapack), which includes BLAS

Get it [here](http://www.netlib.org/lapack/).

    wget http://www.netlib.org/lapack/lapack-3.5.0.tgz
    tar xzf lapack-3.5.0.tgz


## GNU Scientific Library [GSL](http://ftp.gnu.org/gnu/gsl/)

    wget http://ftp.gnu.org/gnu/gsl/gsl-1.16.tar.gz
    wget http://ftp.gnu.org/gnu/gsl/gsl-1.16.tar.gz.sig
    gpg --keyserver keyserver.ubuntu.com --recv-keys AE05B3E9
    gpg --verify gsl-1.16.tar.gz.sig
