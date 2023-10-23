local coor = {}

function love.load()
--  track_origin = love.graphics.newFont('/assets/fonts/NotoSerifJP-SemiBold.otf', 240)
 Trail = require("draw")
end

function love.update(dt)
    coor.x, coor.y = love.mouse.getPosition()
        
        Trail.build_char(coor.x,coor.y)
         Trail.clear()


end

function love.mousereleased(x,y,button)
    if button == 1 then
            
        Trail.Mouse_released()
    end
    
end

function love.draw()
    
    Trail.trace()
    -- love.graphics.setFont(track_origin)

end
