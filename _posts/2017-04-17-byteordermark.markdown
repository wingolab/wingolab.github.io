---
layout: post
title: "Byte Order Mark"
date: "2017-04-17 22:27:03 -0400"
---

When decoding text, particularly when it came by way of Excel, you are likely
to encounter `\x{FEFF}` appended to the first piece of text or another escaped
character. This is a [Byte Order Mark](https://en.wikipedia.org/wiki/Byte_order_mark),
and its purpose is to indicate something about the encoding of the text 
stream, usually that it's UTF-8 or something like that. 

To remove it, try one of the following, originally from [here](http://stackoverflow.com/questions/24390034)).

```{perl}
s/^\x{FEFF}//;
s/^\N{U+FEFF}//;
s/^\N{ZERO WIDTH NO-BREAK SPACE}//;
s/^\N{BOM}//;   # Convenient alias
```

In vim, you can remove it when you are saving the file:
```{vim}
:setlocal nobomb
:w
```
To ask vim whether there is a BOM:
```{vim}
:setlocal bomb?
```
