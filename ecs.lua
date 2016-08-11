-- World Related functions
tiny = require('libs/tiny')

local ECS = {}
ECS.__index = ECS

ECS.state = 'inactive'

local world = nil
local contents = {}

function ECS:init()
  world = tiny.world()
  self.state = 'active'
end

function ECS:update( dt )
  world.update(dt)
end

function ECS:addEnt( e )
  world.addEntity( e )
  local category = e.e_type
  if contents[category] == nil then
    contents[category] = {}
  end
  table.insert(contents[category], e)
end

function ECS:addSys( s )
  world:addSystem( s )
end
  
return ECS 
