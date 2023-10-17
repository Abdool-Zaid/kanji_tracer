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

function res.write(input)
    local inp= input
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",0,0,10000,10)
    love.graphics.setColor(res.brush_color[1],res.brush_color[2],res.brush_color[3])
    love.graphics.print(inp)
end

return res