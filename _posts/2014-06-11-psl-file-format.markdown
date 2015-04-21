---
layout: post
title: psl file format
date: 2014-06-11 09:43:27.000000000 -04:00
---
# psl format described by UCSC genome browswer website [here](http://www.genome.ucsc.edu/FAQ/FAQformat.html)

Here's my thumbnail sketch; it's used by Jim Kent's isPcr program.

Most psl files have no header. It's tab-delimited and defined as:

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

Description of fields:

    matches - Number of bases that match that aren't repeats
    misMatches - Number of bases that don't match
    repMatches - Number of bases that match but are part of repeats
    nCount - Number of 'N' bases
    qNumInsert - Number of inserts in query
    qBaseInsert - Number of bases inserted in query
    tNumInsert - Number of inserts in target
    tBaseInsert - Number of bases inserted in target
    strand - '+' or '-' for query strand. For translated alignments, second '+'or '-' is for genomic strand
    qName - Query sequence name
    qSize - Query sequence size
    qStart - Alignment start position in query
    qEnd - Alignment end position in query
    tName - Target sequence name
    tSize - Target sequence size
    tStart - Alignment start position in target
    tEnd - Alignment end position in target
    blockCount - Number of blocks in the alignment (a block contains no gaps)
    blockSizes - Comma-separated list of sizes of each block
    qStarts - Comma-separated list of starting positions of each block in query
    tStarts - Comma-separated list of starting positions of each block in target

For isPcr, to get the position of the amplicaion (0-indexed):

    split(/,/, blockSizes) <- size of the primers
    split(/,/, tStarts) <- start of the primer match to genome
    start = tStarts[0] + blockSizes[0];
    end = tStarts[1]; <- first site of the match is the last base of the amplicon
