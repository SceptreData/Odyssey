-- Ship Object
package.path = '../?.lua;' .. package.path
local Vector = require('libs/vector')

local Map = require('components/map')
local MapGen = require('components/map_gen')
local Render = require('components/render')

local Ship = {}
Ship.__index = Ship

function Ship.new( ship_id, pos_vector, rotation )
  local s = setmetatable({id = ship_id}, Ship)
  local ship_data = getShipInfo( ship_id )
  assert( ship_data ~= nil, 'Trying to build invalid ship. Search Key: ' .. ship_id)

  s.name = ship_data.name

  s.location = 'space'
  s.position = pos_vector or nil
  s.velocity = Vector(0, 0)
  s.orientation = rotation or Vector(0, 0)

  s.dimensions = Vector(ship_data.width, ship_data.height)

  local map_data = ship_data.map_fn( unpack(ship_data.map_args) )
  s.map = Map.build(map_data, s)

  s.render = Render.setChild( s.map )

  return s
end

local test_ship = {
  name = 'Boxxy 0.1',
  width = 6,
  height = 6,
  map_fn = MapGen.boxMap,
  map_args = {6, 6}
}

function getShipInfo( ship )
  print(test_ship.name)
  return test_ship
end


return Ship
-- EXTRAS
  -- onboard ship
  -- contents
  -- fuelinfo energy etc.
