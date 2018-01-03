---
layout: post
title: "gnu screen"
date: "2016-11-12 12:37:30 -0500"
---

# Examples

Run a single command and detach

    screen -d -m script.sh

Run *multiple* commands while detached:

    screen -dm bash -c "script01.sh; script02.sh"

Run commands and keep screen alive afterward

    screen -dm bash -c 'script01.sh; exec bash'

Naming screen sessions

    screen -S Script -dm script.sh

## Additional help & cheatsheet stuff.

Mostly copied from [here](http://neophob.com/2007/04/gnu-screen-cheat-sheet/) and [here](http://aperiodic.net/screen/quick_reference).

## Starting `screen`

```
screen -DR            -> list of detached screen
screen -r PID         -> attach detached screen session
screen -dmS MySession -> start a detached screen session
screen -r MySession   -> attach screen session with name MySession
```

## Default command key

```
command key -> ctrl + a
```

## Basic Commands

```
command key + c           -> create new window
command key + A           -> set window name
command key + w           -> show all window
command key + 1|2|3|...   -> switch to window n
command key + "           -> choose window
command key + ctrl a      -> switch between window
command key + d           -> detach window
command key + ?           -> help
```

## Clipboard

```
command key + [ or `esc`    -> toggle buffer navigation
`space`                     -> toggle selection to copy while navigating buffer
`enter`                     -> accept current selection
command key + ]             -> paste
ctrl + u                    -> move buffer half page up
ctrl + d                    -> move buffer half page down
ctrl + b                    -> move back
ctrl + f                    -> move forward
`h, j, l, l`                -> move in buffer
`arrow keys`                -> move in buffer
```

## Additional Commands

```
command key + S       -> create split screen
command key + TAB     -> switch between split screens
command key + Q       -> Kill all regions but the current one.
command key + X       -> remove active window from split screen
command key + O       -> logout active window (disable output)
command key + I       -> login active window (enable output)
```
