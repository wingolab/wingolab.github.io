---
layout: post
title: finding files with `find` and perl
date: 2014-08-13 10:12:49.000000000 -04:00
---

At times, I cannot recall the time commands for `find` for BSD unix.

### find files modified within the last day

    find ./ -Btime -1d

### find files accessed within the last day

    find ./ -atime -1d

### find files created within the last day

    find ./ -ctime -1d

### find files modified between 50 and 100 days ago

    find ./ -Btime +50d -Btime -100d

## Perl

Try the handy `find2perl` utility that comes with perl and uses the File::Find
package. It writes a little script for you that you can adapt. See the
[perldoc site](http://perldoc.perl.org/File/Find.html) for further details.

An example from the documentation

    find2perl / -name .nfs\* -mtime +7 \
    -exec rm -f {} \; -o -fstype nfs -prune

Gives you a `wanted` subroutine like so:

    sub wanted {
      /^\.nfs.*\z/s &&
      (($dev, $ino, $mode, $nlink, $uid, $gid) = lstat($_)) &&
      int(-M _) > 7 &&
      unlink($_)
      ||
      ($nlink || (($dev, $ino, $mode, $nlink, $uid, $gid) = lstat($_))) &&
      $dev < 0 &&
      ($File::Find::prune = 1);
    }

Here's a modification that gives you files ending in txt modified between
50 and 20 days ago.

    sub wanted {
      my ($dev,$ino,$mode,$nlink,$uid,$gid);

      /\.txt\z/s &&
      (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) &&
      (int(-M _) < 50) && (int(-M _) > 20)
      && print("$name\n");
    }
