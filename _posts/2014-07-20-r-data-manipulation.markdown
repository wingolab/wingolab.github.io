---
layout: post
title: R data manipulation
date: 2014-07-20 16:55:59.000000000 -04:00
---
## R data manipulation I often look up

- recoding variables

Recoding missing data, example:

```R
data_e$V6[is.na(data_e$V6)] <- 0
```


Recoding non-missing data, example:

```R
data_e$V6[data_e$V6==20] <- 21.2
```

- plotting

density plot example:

```R
test <- rnorm(100);
d <- density(test, from=0, to=0.5)
plot(d, xlim=c(0,0.5), xlab="x label", ylab ="y label", main="title")
```

saving PDF of a plot:

```R
pdf("maf_density.ps")
plot...
dev.off()
```
