stats = require("common")
local exponential = {}
exponential.__index = laplace 

function exponential.new(l)
    local self = setmetatable({}, exponential )
    self.l = l
    return self
end

function exponential.fit(data)
    return exponential.new(1/stats.average(data))
end

function exponential.pdf(self, x)
    return self.l*math.exp(-self.l*x)
end

function exponential.cdf(self, x)
    return 1 - math.exp(-self.l*x)
end

function exponential.quantile(self, p)
    return -math.log(1-p)/self.l
end

function exponential.random(self)
    return stats.random(self)
end

return exponential
