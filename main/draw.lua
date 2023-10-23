local res = {}
local char ={}
local segment ={}
local point_count =0
local p={x=-1,y=-1}
res.brush_size =4
res.arc=12
res.brush_color ={255,255,255}
local util = require("util")
function res.test()
    return "working"
end

function res.build_char(x,y)
    local yes = love.mouse.isDown(1)

            if yes==true then
                local newSquare = { x = x - res.brush_size / 2, y = y - res.brush_size / 2 }
            table.insert(segment, newSquare)

        end
        Draw_temp(x,y)
        
    end
  
    function res.Mouse_released()
        table.insert(char,segment)
        util.print_table(segment)
        segment={}
        Clear_temp()
        
end



function Next_segment(i,j)
    local c,s =i, j+1
    -- p.x,p.y= char[c][s].x, char[c][s].y
end


function Draw_char()
    love.graphics.setLineWidth(res.brush_size)
    for i, segments in ipairs(char) do
        local int=1
        for j,square in ipairs(segments) do
            love.graphics.setColor(res.brush_color[1],res.brush_color[2],res.brush_color[3])
            Draw_line(square.x,square.y)
            int =j
        end
        -- clear
        Next_segment(i,int)
        
    end
end
function Check_points(x1,y1,x2,y2)
    
    if (x1==x2) and (y1==y2) then
        return false
    else
        return true
    end
end

function res.handle_right_click()
    util.print_matrix(char)
end

function Draw_line(Ix,Iy)
local x,y= Ix,Iy

    if point_count==0 then
        p.x,p.y=Ix,Iy
        point_count=1
    else
        
        if Check_points(x,y,p.x,p.y) == true then
            love.graphics.line(x,y,p.x,p.y)
            p.x,p.y=Ix,Iy
        end
        
    end
end

function Draw_temp(x,y)
end

function res.trace()

    Draw_char()
end
function Clear_temp()
    point_count=0
end
function res.clear()
    Clr = love.keyboard.isDown( "space" )
    if Clr==true then
        char= {}
        Clear_temp()
    end
end
return res
