function love.load()
  Object = require "classic"
  require "Character"
  character = Character()
  
  character:load()
end

function love.update(dt)
  character:update(dt)
end

function love.draw()
  character:draw()
end