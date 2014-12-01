---
layout: post
title: "mysql macport setup"
date: "2014-11-30"
---

## installation

Installing mysql on OS X is a bit of a pain. I used macports to install mysql 5.6. Here's what I did:

    sudo port install mysql56 mysql56-server
    sudo /opt/local/lib/mysql56/bin/mysql_install_db --user=_mysql
    sudo port load mysql56-server
    sudo /opt/local/lib/mysql56/bin/mysql_secure_installation
    sudo port load mysql56-server

If you want mysql to always start when you boot:

    sudo launchctl load -w /Library/LaunchDaemons/org.macports.mysql56.plist

Here are som aliases to start and stop mysql you can add to your `.bashrc`:

    alias mysqlstart='sudo port load mysql56-server'
    alias mysqlstop='sudo port unload mysql56-server'

## setup user

Start the mysql server like so:

    sudo port load mysql56-server

Login as root using the password you setup earlier with the `/opt/local/lib/mysql56/bin/mysql_secure_installation` perl script.

    sudo /opt/local/lib/mysql56/bin/mysql -p

Add a user ('monty' with password 'some_pass') that can access the database from the localhost:

    CREATE USER 'monty'@'localhost' IDENTIFIED BY 'some_pass';
    GRANT ALL PRIVILEGES ON *.* TO 'monty'@'localhost' WITH GRANT OPTION;

If you want to allow that user to access the database from remote locations add this:

    CREATE USER 'monty'@'%' IDENTIFIED BY 'some_pass';
    GRANT ALL PRIVILEGES ON *.* TO 'monty'@'%' WITH GRANT OPTION;

## add mysql to path

You have some options; add the mysql/bin macports directory to your path:

    export PATH=$PATH:/opt/local/lib/mysql56/bin/

Or you could just link all of the commands from the same directory to the `/opt/bin` directory.
