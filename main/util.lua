local res ={}
res.sample_rate = 1
function res.sampler(x1,y1,x2,y2)
    local dX = x1-x2
    local dY = y1-y2
    local init = {x1,y1}
    local anti_alias ={}
     for i = 1, dX, res.sample_rate do
        for j = 1, dY, res.sample_rate do
            local sample ={}
            sample.x = init[1]+i
            sample.y = init[2]+j
            table.insert(anti_alias,sample)
        end
     end
     return anti_alias
end

return res