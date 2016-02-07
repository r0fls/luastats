local stats = {}
stats.__index = stats
--
--seed random
math.randomseed(os.clock()*10^20/729351)
-- on some OSs the first number may not be random
math.random()

-- each distribution implements this
function stats.random(dist)
    return dist.quantile(dist, math.random())
end

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

function stats.median(data)
    table.sort(data)
    if #data % 2 == 1 then
        return data[math.ceil(#data/2)] 
    else
        return (data[#data/2]+data[1+(#data/2)])/2
    end
end

return stats
