---
layout: post
title: R data manipulation
date: 2014-07-20 16:55:59.000000000 -04:00
---

Some snippets to jog my memory.

### recode `missing` variables

Recoding missing data, example:

    data_e$V6[is.na(data_e$V6)] <- 0

### recode `non-missing` data

Recoding non-missing data, example:

    data_e$V6[data_e$V6==20] <- 21.2

### use `factor` to recode variables

Here, APOE has 3 levels or doses, and we're arbitrarily naming those doses as A, B, or C.

test <- factor(df$APOE, labels=c("A", "B", "C"))

### plotting

density plot example:

    test <- rnorm(100);
    d <- density(test, from=0, to=0.5)
    plot(d, xlim=c(0,0.5), xlab="x label", ylab ="y label", main="title")

saving PDF of a plot:

    pdf("maf_density.ps")
    plot...
    dev.off()

### ggplot

    ggplot(fig_two, aes(x=fig_two$male_prev, y=fig_two$fem_prev, fill = fig_two$round_fin_h2)) + geom_tile()
    xlab("Male Prevalence") + ylab("Female Prevalence")
    opts(title = "Figure 1: Mean Late-onset Alzheimer's Disease\n Heritability as a Function of Prevalence")
    scale_fill_gradient(limits = c(0.78, 0.51)
    ggsave("test.pdf", height=8, width=8, unit="cm") # default is in

### glm

    lm_r <- lm(formula = disease ~ AGE + SEX, family = binomial(), data = df1)
    summary(lm_r)
    plot(lm_r) # 4 diagnostic plots
