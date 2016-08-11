-- map creation functions
local Tile = require('components/tile')
local Map = {}
Map.__index = Map

function Map.build( map_data, parent )
  local m = setmetatable( { height = map_data.height, width = map_data.width }, Map)
  m.parent = parent or nil
  m.tiles = {}
  for i = 1, m.width * m.height do
    m.tiles[i] = Tile.new( map_data[i] )
  end
  assert(m.height)
  return m
end

function Map:getTile(x, y)
  return self.tiles[ (x-1) *  self.height + y ]
end

return Map
