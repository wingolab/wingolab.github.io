---
layout: post
title: "gnu screen"
date: "2016-11-12 12:37:30 -0500"
---

## Examples

Run a single command and detach

```sh
screen -d -m script.sh
```

Run _multiple_ commands while detached:

```sh
screen -dm bash -c "script01.sh; script02.sh"
```

Run commands and keep screen alive afterward

```sh
screen -dm bash -c 'script01.sh; exec bash'
```

Naming screen sessions

```sh
screen -S Script -dm script.sh
```

### Additional help

See [here](http://neophob.com/2007/04/gnu-screen-cheat-sheet/) and [here](http://aperiodic.net/screen/quick_reference).

### Starting screen

```sh
screen -DR MySession  # attach or start screen session with name MySession
screen -ls            # list of detached screen
screen -r PID         # attach detached screen session
screen -dmS MySession # start a detached screen session
```

### Default command key

```text
command key -> ctrl + a
```

### Basic Commands

```text
command key + c           -> create new window
command key + A           -> set window name
command key + w           -> show all window
command key + 1|2|3|...   -> switch to window n
command key + "           -> choose window
command key + ctrl a      -> switch between window
command key + d           -> detach window
command key + ?           -> help
```

### Clipboard

```text
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

### Additional Commands

```text
command key + S       -> create split screen
command key + TAB     -> switch between split screens
command key + Q       -> Kill all regions but the current one.
command key + X       -> remove active window from split screen
command key + O       -> logout active window (disable output)
command key + I       -> login active window (enable output)
```
