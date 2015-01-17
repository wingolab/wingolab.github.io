---
layout: post
title: "perl here documents"
date: "2015-01-17"
---

## here documents are helpful when writing a bash script

[Here](http://perlmaven.com/here-documents) os a good link describing how to use them.

### non-interpreted

    my $cmd = <<'EOF';
    #!/bin/sh
    touch file.tmp
    EOF

    print $cmd;

### interpreted

    my $cmd = <<"EOF";
    #!/bin/sh
    touch $this_file
    EOF

    print $cmd;

### white space

If you have indented things and you want the here document to be alignged just
tell perl to get rid of the leading whitespace like so.

    (my $cmd = <<"EOF") =~ s/\A\s+//gm;
    ...
    EOF

### perl's q{} or qq{} commands

Another option is just to use qq or q (depending on whether you want to interpolate
  things).

    (my $cmd = qq{
    #!/bin/sh
    touch $this_file
    }) =~ s/\A\s+//mg;
