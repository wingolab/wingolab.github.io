---
layout: post
title: "sra toolkit and nih data"
date: "2015-01-27"
---

## download public data

    ascp -QT -l 640M -i ~/.aspera/connect/etc/asperaweb_id_dsa.openssh  \
    anonftp@ftp-trace.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByStudy/sra/SRP/SRP046/SRP046745 .

See documentation [here](http://www.ncbi.nlm.nih.gov/books/NBK242621/). The
only note I would add is that if you're asked to supply a password using their
public openssh key you're doing something wrong; it's probably a typo.
