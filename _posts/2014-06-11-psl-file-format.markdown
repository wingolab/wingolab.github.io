---
layout: post
title: psl file format
date: 2014-06-11 09:43:27.000000000 -04:00
---
# psl format described by UCSC genome browswer website [here](http://www.genome.ucsc.edu/FAQ/FAQformat.html)

Here's my thumbnail sketch; it's used by Jim Kent's isPcr program.

    0 => matches
    1 => misMatches
    2 => repMatches
    3 => nCount
    4 => qNumInsert
    5 => qBaseInsert
    6 => tNumInsert
    7 => tBaseInsert
    8 => strand
    9 => qName
    10 => qSize
    11 => qStart
    12 => qEnd
    13 => tName
    14 => tSize
    15 => tStart
    16 => tEnd
    17 => blockCount
    18 => blockSizes
    19 => qStarts
    20 => tStarts
