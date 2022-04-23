---
layout: post
title: vim notes
date: 2014-09-20 16:57:08.000000000 -05:00
---

# Vim note and shortcuts

## windows in Vim

To change the window you want to either be at the far left or top after
changing the windows. Do this with `ctrl-W t` or `ctrl-arrow`.

Horizontal: `ctrl-W H`
Vertical: `ctrl-W K`

## file format conversion

This [link](http://vim.wikia.com/wiki/Change_end-of-line_format_for_dos-mac-unix)
from the vim wiki is pretty comprehensive.

## finding CR and newline

In the syntax, `s/search/replace/`, in the `search` context `\n` is newline and
`\r` is carriage return (`ctrl-V M`, which produces `^M`), but in the `replace`
context `\n` is the null byte and `\r` is a new line depending on what vim
thinks your new line character is, which is set like this `:set ffs=unix`.

## Replace `^M`

See this [link](https://stackoverflow.com/questions/5843495/what-does-m-character-mean-in-vim#5843561) for an explaination.

Press and hold `ctrl` then `v` then `m` to get the `^M`. Here, the `ctrl-v` is
a special key to write special characters or digraphs. See [vim manual](http://vimdoc.sourceforge.net/htmldoc/digraph.html#digraph-table).

## do things on multiple files

Commands to use with multiple buffers:

    arg
    argadd
    argdel
    arglist
    argdo
    bufdo
    windo

Scenario 1 - here you'd get all of the errors for files without matches:

    argdo %s/search/replace/gc

Scenario 2 - use `e` to ignore errors and `update` to write any buffers that
were changes:

    argdo %s/search/replace/ge | update

If you're using split windows, then use `windo` to run the commands in both
windows that are open. To cycle through all of the open buffers then use
`bufdo`.
