Actor = {}
Actor.__index = Actor

function Actor:new(type_name)
	local obj = setmetatable({}, self)
	obj:initialize(type_name)
	return obj
end

function Actor:initialize(type_name)
	self.a_type = type_name
end

function Actor:__tostring()
  return self.a_type
end

Goblin = {}
for k, v in pairs(Actor) do
	Goblin[k] = v
end
Goblin.__index = Goblin

function Goblin:initialize(name)
	Actor.initialize(self, 'Goblin')
    self.name = name
end

function Goblin:new(name)
	local obj = setmetatable({}, self)
	obj:initialize(name)
	return obj
end

local z = Goblin:new('Zeboz')

print(z)
