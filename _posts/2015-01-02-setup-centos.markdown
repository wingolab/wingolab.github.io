---
layout: post
title: "centos setup"
date: "2015-01-02"
---

# common setup tasks

0. local access (if a local VM)
1. ssh public key authorization setup
2. perl core packages setup

## ensuring access to your local machine

In either virtualbox or VMplayer or VMfusion this can be achieved by adding a new adapter to the VM. It's easiest if you do this **before** you install the OS since it will be automatically setup for you. You can do it afterwards and then setup the adapter with `sudo ifconfig eth1`, assuming you already were using eth0 for internet access before. [Here](http://wiredrevolution.com/virtualbox/setup-ssh-access-between-virtualbox-host-and-guest-vms) is a brief guide with more details.

## getting ssh working

Get your public key placed on the server.

    ssh b@B mkdir -p .ssh
    cat ~/.ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'

OpenSSH likes permissions a certain way (i.e., less open) change them on your directories

    chmod go-w ~/
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/authorized_keys

Ensure that `/etc/ssh/sshd_config` contains:

    PubkeyAuthentication yes
    RSAAuthentication yes

After making any edits to `/etc/ssh/sshd_config` re-start sshd with:

    sudo systemctl restart sshd

Now, you should be able to login with `ssh`. If not turn on verbose output i.e., `-v` or `-vv`. [Here](https://help.ubuntu.com/community/SSH/OpenSSH/Keys) is a good guide for debain-based ubuntu.

## setup Perl on a new VM with Centos

    sudo yum install perl-ExtUtils-*

clone cpanminus

    git clone https://github.com/miyagawa/cpanminus

run cpanm and install local::lib

    export LOC_SYS=${HOME}/local_sys
    git clone https://github.com/miyagawa/cpanminus
    cd cpanminus
    ./cpanm --local-lib=~${LOC_SYS}/perl5 local::lib && \
    eval $(perl -I ${LOC_SYS}/perl5/lib/perl5/ -Mlocal::lib=${LOC_SYS}/perl5)
    # now install cpanminus to the LOC_SYS folder
    ./cpanm App::cpanminus

add this to `.bashrc` for perl local::lib

    eval $(perl -I${LOC_SYS}/perl5/lib/perl5 -Mlocal::lib=${LOC_SYS}/perl5)
