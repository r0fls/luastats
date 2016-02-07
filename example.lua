local bernoulli = require("distributions/bernoulli")
local stats = require("common")
local s = require("stats")
local laplace = require("distributions/laplace")
local i = s.bernoulli.new(.5)
print(i:pmf(1)) --> .5
local l = s.laplace.new(0,1)
print(l:pdf(0)) --> .5
print(l:random()) --> .5
--print(i:quantile(.4)) --> 0
print(i:random())
local array = {4,2,3,1}
print(stats.average(array)) --> 2.5
print(stats.median(array)) --> 2.5
print(stats.sum(array)) --> 10
local bernoulli_data = {1,1,1,0}
local b = bernoulli.fit(bernoulli_data)
print(b:pmf(1)) --> .75
