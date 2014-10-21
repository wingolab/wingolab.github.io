---
layout: post
title: iterm2 shortcuts
date: 2014-04-07 10:35:41.000000000 -04:00
---
### how to added some needed shortcuts

Like, Option-Left Arrow and Option-Right Arrow to bounch around the commandline? Me too. Add them to iterm2 like this:

1. preferences -> profiles -> keys -> '+' (adjacent to 'Load Presets...'
2. in 'keyboard shortcut' press option-left arrow in dialog box
3. change 'action' to 'send escape seqeuence'
4. in the 'Esc+' dialog box enter 'b'
5. Repeat for option-right arrow but enter 'f' for the 'Esc+'
6. to make command-left arrow jump to the start of the line enter '[H' for the 'Esc+' sequence

This [post](http://elweb.co/making-iterm-2-work-with-normal-mac-osx-keyboard-shortcuts/) gives some more things that can be done but that would override crtl-a and other emacs bindings that I'm used to.
