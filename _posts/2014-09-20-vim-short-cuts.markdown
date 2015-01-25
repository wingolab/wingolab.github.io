---
layout: post
title: vim notes
date: 2014-09-20 16:57:08.000000000 -05:00
---


# windows

To change the window you want to either be at the far left or top after
changing the windows. Do this with `ctrl-W t` or `ctrl-arrow`.

Horizontal: `ctrl-W H`
Vertical: `ctrl-W K`

# file format conversion

This [link](http://vim.wikia.com/wiki/Change_end-of-line_format_for_dos-mac-unix)
from the vim wiki is pretty comprehensive.


# finding CR and newline

In the syntax, `s/search/replace/`, in the `search` context `\n` is newline and
`\r` is carriage return (ctrl-V + ctrl-M or ^M), but in the `replace` context
`\n` is the null byte and `\r` is a new line depending on what vim thinks your
new line character is, which is set like this `:set ffs=unix`.
