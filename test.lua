local bernoulli = require("bernoulli")
local i = bernoulli.new(.5)
print(i:pmf(1)) --> .5
print(i:quantile(.4)) --> 0
print(i:random()) --> 0 or 1
