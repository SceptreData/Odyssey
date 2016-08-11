package.path = '../?.lua;' .. package.path

Tool = require('/tools/tools')
Actor = {}
Actor.__index = Actor

function Actor:new( type_name )
  local a = setmetatable({}, self)
  a:init(type_name)
  return a
end

function Actor:init(type_name)
  self.atype = type_name
end

function Actor:__tostring()
  return self.atype
end

function Actor:place(map, x, y)
  self.position = x
  grid[x] = self
end



Goblin = inherit(Actor)
Goblin.__index = Goblin

function Goblin:init(name)
  Actor.init(self,'Goblin')
  self.name = name
end

function Goblin:shout()
  print('The ' .. self.atype ..' Screeches!')
end

function Goblin:new(name)
  local g = setmetatable({}, self)
  Actor.init(g, 'Goblin')
  g.name = name
  return g 
end


z = Goblin:new('zeboz')

print(z)


