local bernoulli = {}
bernoulli.__index = bernoulli
math.randomseed(os.time())
-- on some OSs the first number may not be random
math.random()

function bernoulli.new(p)
    local self = setmetatable({}, bernoulli )
    self.p = p
    return self
end

function bernoulli.pmf(self, k)
    if k == 0 then
        return 1 - self.p
    elseif k == 1 then
        return self.p
    else
        return -1
    end
end

function bernoulli.cdf(self, k)
    if k < 0 then
        return 0
    elseif k < 1 then
        return 1 - self.p
    elseif k >= 1 then
        return 1
    else
        return -1
    end
end

function bernoulli.quantile(self, x)
    if x >= 0 and x <= 1 then
        if x < 1 - self.p then
            return 0
        elseif x >= 1 - self.p then
            return 1
        end
    else
        return -1
    end
end

function bernoulli.random(self)
    return self.quantile(self, math.random())
end

return bernoulli
