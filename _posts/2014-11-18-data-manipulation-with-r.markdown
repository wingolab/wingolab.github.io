---
layout: post
title: "data manipulation with R"
date: "2014-11-18"
---

### use `factor` to recode variable

Here, APOE has 3 levels or doses, and we're arbitrarily naming those doses as A, B, or C.

    test <- factor(df$APOE, labels=c("A", "B", "C"))


### 
