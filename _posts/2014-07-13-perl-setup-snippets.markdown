---
layout: post
title: perl setup snippets
date: 2014-07-13 21:55:18.000000000 -04:00
---
# local perl setup

### install perlbrew

    curl -L http://install.perlbrew.pl | bash

### install cpan minus & local lib

    curl -L cpanmin.us | perl - -l $HOME/perl5 App::cpanminus local::lib

### bash startup script edits for default locations

    # perlbrew
    source ~/perl5/perlbrew/etc/bashrc

    # local lib
    eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)

# install common perl packages

    cpanm Task::Kensho Cpanel::JSON::XSExcel::Writer::XLSX Getopt::LongIO::Compress::Gzip IO::Uncompress::Gunzip Math::GSL Modern::Perl MongoDB MongoDB::OID Spreadsheet::ParseExcel Spreadsheet::XLSX Text::CSV_XS Text::Iconv Time::localtime

# dbi, mysql stuff

1. install mysql (or other binary driver) with the header files
  - you should have `mysql_config` installed so it correctly gives the appropriate flags for compiling
2. install the DBD::<database> module


e.g., For mac, using mac ports and mysql 5.6 try this:

    # install the client
    sudo port install mysql56

    # install the server
    mysql56-server

    cpanm DBD::mysql
