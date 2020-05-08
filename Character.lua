require "socket"

local yoshiAssetsPath = "assets//yoshi//yoshi.png"
Character = Object:extend()

function Character:new(name, hp, alive)
  love.graphics.setDefaultFilter('nearest', 'nearest')
  self.image = love.graphics.newImage(yoshiAssetsPath)
  self.imageSprite = love.graphics.newQuad(4, 4, 32, 32, self.image:getWidth(), self.image:getHeight())
	self.name = name
	self.hp = hp
	self.alive = alive
	self.hasItem = true
  self.x = 320
  self.y = 180
  self.speed = 200
  self.width = self.image:getWidth()
  end

function Character:new()
  love.graphics.setBackgroundColor(0, 0 , 0)
  love.graphics.setDefaultFilter('nearest', 'nearest')
  self.image = love.graphics.newImage(yoshiAssetsPath)
  self.imageSprite = love.graphics.newQuad(5, 5, 27, 33, self.image:getWidth(), self.image:getHeight())
  self.walkAnimsNum = 10
  self.standAnimsNum = 3
  self.x = 320
  self.y = 180
  self.speed = 200
  self.width = self.image:getWidth()
end

function Character:damaged(damage)

end

function Character:die()
end

function Character:throwItem(item)
end

function Character:tookItem()
end

function Character:eat()
end

function Character:loadAnimations(animsRepo, numAnims)
  animTab = {}
  for i = 1, numAnims do
    table.insert(animTab, i, love.graphics.newImage(animsRepo .. i .. ".png"))
  end
  return animTab
end

function Character:animate(animTab)
  for i,anim in ipairs(animTab) do
    self.image = anim
    socket.select(nil, nil, 0.01)
  end
end

function Character:animate_classic(animTab, i)
    self.image = animTab[i]
end

function Character:draw()
  love.graphics.draw(self.image, self.imageSprite, self.x, self.y, math.rad(0), 2, 2, 27/2, 33/2)
end

function Character:getWalkAnimsNum()
  return self.walkAnimsNum
end

function Character:update(dt)
  if love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt
  end
end

function Character:load()
end


