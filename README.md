# luastats
Statistics for lua

###Installation
Clone the repo and put it in your project.

###Example
    local s = require("stats")
    local b = s.bernoulli.new(.3)
    print(b:pmf(0)) --> .7
    print(b:random()) --> 1 or 0
    

###Features
#####General
- Compute the PMF/PDF, CDF, and Quantile of a distribution
- Fit data to a distribution using the MLE

#####Distributions
- uniform
- laplace
- exponential
- bernoulli
