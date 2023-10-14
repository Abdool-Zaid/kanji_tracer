local res = {}
local char ={}
local segment ={}
res.brush_size =4
res.arc=12
res.brush_color ={255,255,255}
local util = require("util")
function res.test()
    return "working"
end


function res.build_char(x,y)
    local yes = love.mouse.isDown(1)
            if yes then
                add_missed_space(x,y)
                local newSquare = { x = x - res.brush_size / 2, y = y - res.brush_size / 2 }
            table.insert(segment, newSquare)   
            mouse_released()
    end

end

function mouse_released()
    table.insert(char,segment)
    segment={}
end

function add_missed_space(x,y)
    if #segment==0 then
        
    else
        local last= char[#char]
        local missed = util.sampler(last.x,last.y,x,y)
            for _, value in ipairs(missed) do
                table.insert(segment,value)
            end
    end
end

function draw_char()
    love.graphics.setLineWidth(res.brush_size)
    for i, segments in ipairs(char) do
        for j,square in ipairs(segments) do
            love.graphics.setColor(res.brush_color[1],res.brush_color[2],res.brush_color[3]) 
            local x,y = Get_prior(i,j)
            love.graphics.line(x,y,square.x,square.y)
        end
    end
end

function Get_prior(i,j)
    local x, y =10, 10
    local seg,blt=i,j 
    if j==1 then
        
    else
        seg= seg-1
        blt=blt-1

    end
    -- x = char[seg][blt].x
    -- y = char[seg][blt].y
    return x,y
end

function res.trace()
    draw_char()
end

function res.clear()
    clr = love.keyboard.isDown( "space" )
    if clr==true then
        char= {}
        
    end
end
return res
