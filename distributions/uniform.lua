stats = require("common")
local uniform = {}
uniform.__index = uniform

function uniform.new(a, b)
    local self = setmetatable({}, uniform )
    self.a = a 
    self.b = b 
    return self
end

function uniform.fit(data)
    midrange = (math.max(data) + math.min(data))/2
    range = math.max(data) - math.min(data)
    return uniform.new(midrange - (range/2), midrange + (range/2))
end

function uniform.pdf(self, x)
    if (x > self.a) and (x < self.b) then
        return 1/(self.b-self.a)
    else
        return 0
    end
end

function uniform.cdf(self, x)
    if x < self.a then
        return 0
    elseif x < self.b then
        return (x - self.a)/(self.b - self.a)
    elseif x > self.b then
        return 1
    else
        return -1
    end
end

function uniform.quantile(self, p)
    return p*(self.b-self.a) + self.a 
end

function uniform.random(self)
    return stats.random(self)
end

return uniform
