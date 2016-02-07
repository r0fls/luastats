local stats = {}
stats.__index = stats
--
--seed random
math.randomseed(os.clock()*10^20/729351)
-- on some OSs the first number may not be random
math.random()


function stats.average(data)
    return stats.sum(data)/#data
end

function stats.sum(data)
    total = 0
    for i = 1, #data do 
        total = total + data[i] 
    end
    return total
end

function stats.random(dist)
    return dist.quantile(dist, math.random())
end

return stats
