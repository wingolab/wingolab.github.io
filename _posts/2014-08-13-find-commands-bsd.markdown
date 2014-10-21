---
layout: post
title: find commands - bsd
date: 2014-08-13 10:12:49.000000000 -04:00
---
At times, I cannot recall the time commands for `find` for BSD unix.

```bash
find ./ -Btime -1d # find files modified within the last day
find ./ -atime -1d # find files accessed within the last day
find ./ -ctime -1d # find files created within the last day
find ./ -Btime +50d -Btime -100d # find files modified between 50 and 100 days ago
```
