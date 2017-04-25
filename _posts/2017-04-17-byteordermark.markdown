---
layout: post
title: "Byte Order Mark"
date: "2017-04-17 22:27:03 -0400"
---

If you are decoding a string, particularly in perl and see `\x{FEFF}` appended
to the first character you haven't decoded the UTF-8 text steam properly. This
happens in perl unless you set the `open` encoding to `:encoding(utf-8)`. The
`use utf8` pragma in perl is only for reading your perl code not decoding files. 

To remove it you can use one of the following (suggested [here](http://stackoverflow.com/questions/24390034))

```{perl}
s/^\x{FEFF}//;
s/^\N{U+FEFF}//;
s/^\N{ZERO WIDTH NO-BREAK SPACE}//;
s/^\N{BOM}//;   # Convenient alias
```
