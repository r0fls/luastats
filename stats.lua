local stats = {}
stats.__index = stats
stats['bernoulli']=require("distributions/bernoulli")
stats['laplace']=require("distributions/laplace")
stats['exponential']=require("distributions/exponential")
stats['uniform']=require("distributions/uniform")
stats['common']=require("common")
return stats
