stats = require("common")
local logistic = {}
logistic.__index = logistic

function logistic.new(m, s)
    local self = setmetatable({}, logistic)
    self.m = m
    if s <= 0 then
        error("scale must be greater than 0")
        return
    end
    self.s = s
    return self
end

function logistic.pdf(self, x)
    term = math.exp(-(x-self.m)/self.s)
    return term/(self.s*(math.pow(1+term,2)))
end

function logistic.cdf(self, x)
    return 1/(1+math.exp(-(x-self.m)/self.s))
end

function logistic.quantile(self, p)
    return self.m + self.s*math.log(p/(1-p))
end

function logistic.random(self)
    return stats.random(self)
end

return logistic
