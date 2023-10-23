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
    love.graphics.rectangle("fill",0,0,10000,20)
    love.graphics.setColor(1,1,1)
    love.graphics.print(inp)
end

function  res.print_table(table)
    local arr = table
    for key, value in pairs(arr) do
        print("key: "..key.." value: " ..value.x .." , ".. value.y)
    end
end

function res.print_matrix(table)
    for key, arr in pairs(table) do
        for index, value in pairs(arr) do
            print("key: "..key.." index: "..index.. " value: " ..value.x .." , ".. value.y)
            
        end
    end
end
return res