local coor = {}

function love.update(dt)
    coor.x, coor.y = love.mouse.getPosition()
    
end

function love.draw()
    love.graphics.print("x: ".. coor.x .. " y: " .. coor.y)
 end
