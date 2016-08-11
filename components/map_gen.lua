local MapGen = {}
MapGen.__index = MapGen

function MapGen.boxMap( width, height )
  local m = setmetatable({width = width, height = height}, MapGen)

  local tile = 0
  for j = 1, height do
    for i = 1, width do
      if i == 1 or j == 1 or i == width or j == width then
        tile = 3
      else
        tile = 2
      end
      table.insert(m, tile)
    end
  end
  return m
end

return MapGen
