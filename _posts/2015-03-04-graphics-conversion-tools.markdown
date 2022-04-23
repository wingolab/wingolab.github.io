---
layout: post
title: "Graphics Conversion Tools"
date: "2015-03-04"
---

Both ImageMagicK and GraphicsMagicK have command line tools and a Perl
interfaces. GraphicsMagicK is a little newer with all that implies.

## ImageMagick

Command line tools for converting images are found
[here](http://imagemagick.org/script/command-line-tools.php).

    convert -background transparent -density 300 -quality 100 test.pdf test.png

## GraphicsMagick

Does a lot of what ImageMagicK does. Command line tools for converting images
are found [here](http://www.graphicsmagick.org/utilities.html).

    gm convert -trim -transparent white -background transparent \
    -density 800x800 -resize 25% test.pdf test.png
