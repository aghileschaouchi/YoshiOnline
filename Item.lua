Item = {name = "", throwable = false, damage = 0}

function Item:new(o, name, throwable, damage)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.name = name
	if throwable then
		self.throwable = true
		self.damage = damage
	else
		self.throwable = false
	end
	return o
end

function Item:throw()
end

function Item:hit()
end
