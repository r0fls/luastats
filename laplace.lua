stats = require("common")
local laplace = {}
laplace.__index = laplace 

function laplace.new(m, b)
    local self = setmetatable({}, laplace )
    self.m = m 
    self.b = b
    return self
end

function laplace.fit(data)
    p = stats.median(data)
    total = 0
    for i = 1,#data do
        total = total + math.abs(data[i] - p)
    end
    return laplace.new(p, self.b/#data)
end

function laplace.pdf(self, x)
    return math.exp(-math.abs(x-self.m)/self.b)/(2*self.b)
end

function laplace.cdf(self, x)
    if x < self.m then
        return math.exp((x-self.m)/self.b)/2
    elseif x >= self.m then
        return 1-(math.exp((self.m-x)/self.b)/2)
    end
end

function laplace.quantile(self, x)
    if x>0 and x<=1/2 then
        return self.m + self.b*math.log(2*x);
    elseif x>=1/2 and x<1 then
        return self.m - self.b*math.log(2*(1-x)); 
    end 
end

function laplace.random(self)
    return stats.random(self)
end

return laplace
