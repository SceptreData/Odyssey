local Vector = require('libs/vector')
local ECS = require('libs/tiny')

local Sys = require('sys')

local Render = require('components/render')
local Ship = require('components/ship')
local Map  = require('components/map')
--local Movement = require('components/movement')

local Game = {}
Game.__index = {}

Game.state = 'boot'
Game.num_ticks = 0

local world = nil

function Game:init()
  world = ECS.world()
  world:addSystem(Render.system)

  -- Load stuff here that you want to do. 
  local box_ship = Ship.new( 'test', Vector(0, 0), 0 )
  world:addEntity(box_ship)

end

function Game:update( dt )
  world:update( dt )
  self.num_ticks = self.num_ticks + 1
end

return Game
