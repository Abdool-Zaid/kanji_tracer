local res = {}
local char ={}
local segment ={}
res.brush_size =20
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
        util.sampler(last.x,last.y,x,y)
    end
end

function draw_char()
    for _, segments in ipairs(char) do
        for _,square in ipairs(segments) do
            love.graphics.setColor(res.brush_color[1],res.brush_color[2],res.brush_color[3]) 
            love.graphics.rectangle("fill", square.x, square.y, res.brush_size, res.brush_size)
        end
    end
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
