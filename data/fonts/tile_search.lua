local TileInfo = require('tile_id')

local query = arg[1]

for i, v in ipairs(TileInfo.names) do
  if v == query then
    print('Success!')
    print(i, v)
  end
end
