---
layout: post
title: Regression, extrapolating, and R functions
date: 2014-08-22 10:39:40.000000000 -04:00
---
### Variance-covariance matrix

`vcov()` gives the variance-covariance matrix for a regression model. Confusingly (to me) there is a seemingly similar matrix if you use `summary()$cov`, I'm not exactly sure what this matrix is. It's very easy to verify the `vcov()` matrix is right since you just need to square the standard errors for the estimates of b0 and b1. 

### extrapolating values in R from a standard curve

`perdict` can be used. 

### extrapolating values, in general, from a standard curve

The following works provided `X` is known without error: 

	Var{Y} = Var{mX + b} = Var{mX} + Var{b} + 2 Cov{Xm,b}
    Var{Y} = X^2 * Var{m} + Var{b} + 2 * X * Cov{m,b}
    
If `X` is a random varible with it's own mean `E{X}` and variance `Var{X}` then the the `Var{Y}` is given by:

	Var{Y} = Var{mX + b}  
    Var{Y} = Var{b} + 2 * E{X} * Cov{m,b} + Var{X} * (E{m})^2 + Var{m} * (E{X})^2 + Var{m} * Var{x}
