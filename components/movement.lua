-- Movement Components and System

package.path = '../?.lua;' .. package.path

local ecs = require('libs/tiny')
local Vector = require('libs/vector')

local Movement = {}
Movement.__index = Movement

Movement.system = ecs.processingSystem()
Movement.system = ecs.requireAll("position", "velocity")

function Movement:process(e, dt)
  e.position = e.position + (e.velocity * dt)
end
  
local Position = Vector

local Velocity = Vector.new
y = Velocity(1,2)
print(y)
-- local vel_mt = { __index = Velocity }

function Velocity.new(x, y)
  local v = Vector(x, y)
  setmetatable(v, vel_mt)
  return v
end

function Velocity:getSpeed()
  return self:len()
end 

setmetatable(Velocity, {__call = function(_, ... ) return Velocity.new(...) end })

t = Velocity(10,10)
print(t)
print(t:getSpeed())
-- a = Velocity(10, 10)
-- print(Velocity.getSpeed1(a))


