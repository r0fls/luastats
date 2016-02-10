stats = require("common")
local pareto = {}
pareto.__index = pareto

function pareto.new(x,a)
    local self = setmetatable({}, pareto )
    self.x = x 
    self.a = a
    return self
end

function pareto.fit(data)
    local x = math.min(data)
    local total = 0
    for i=1,#data do
        total = total + math.log(data[i])-math.log(x)
    end
    local a = #data/total
    return pareto.new(x,a)
end

function pareto.pdf(self, x)
    return self.a*math.pow(self.x,self.a)/math.pow(x,self.a+1)
end

function pareto.cdf(self, x)
    if x<self.x then
        return -1
    end
    return 1 - math.pow(self.x/x,self.a)
end

function pareto.quantile(self, p)
    return 1/math.pow(1-p,1/self.a)
end

function pareto.random(self)
    return stats.random(self)
end

return pareto
