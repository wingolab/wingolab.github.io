---
layout: post
title: ssh tips
date: 2014-01-20 21:02:08.000000000 -05:00
---

## Verify the host's ECDSA signature

On the host machine:

    ssh-keygen -l -f /etc/ssh/ssh_host_ecdsa_key.pub

That key should match the one you get when you attempt to login with ssh.

## Automatic login

Imagine you want to login automatically from computer `A` / user `a` to computer `B` / user `b`.  

First login to computer `A` as user `a` and generate authentication keys **without** entering a passphrase, i.e., just press enter when prompted for a passphrase. For example, on `a@A` do the following to setup automatic login to `b@B`:

    ssh-keygen -t rsa -b 4096
    ssh b@B mkdir -p .ssh
    cat ~/.ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'

Now, you will be able to login from `a@A` into `B` as  `b@B` without a passphrase using `ssh b@B`.
