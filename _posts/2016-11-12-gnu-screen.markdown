---
layout: post
title: "gnu screen"
date: "2016-11-12 12:37:30 -0500"
---

Run a single command and detach

    screen -d -m script.sh

Run *multiple* commands while detached:

    screen -dm bash -c "script01.sh; script02.sh"

Run commands and keep screen alive afterward

    screen -dm bash -c 'script01.sh; exec bash'

Naming screen sessions

    screen -S Script -dm script.sh
