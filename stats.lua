local stats = {}
stats.__index = stats
stats['bernoulli']=require("distributions/bernoulli")
stats['laplace']=require("distributions/laplace")
stats['exponential']=require("distributions/exponential")
return stats
