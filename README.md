# luastats
Statistics for lua

###Installation
Clone the repo and put it in your project.

###Example
```lua
local s = require("stats")
local b = s.bernoulli.new(.3)
print(b:pmf(0)) --> .7
print(b:random()) --> 1 or 0
```
Or fit a random variable from data:
```lua
local s = require("stats")
local bernoulli_data = {1,1,1,0}
local b = s.bernoulli.fit(bernoulli_data)
print(b:pmf(1)) --> .75
```
###Features
#####General
- Compute the PMF/PDF, CDF, and Quantile of a distribution
- Fit data to a distribution using the MLE

#####Distributions
- uniform
- pareto 
- laplace
- exponential
- bernoulli
