-- Basic Tile for now
local Color = require('components/color')
local Sys = require('sys')

local Tile = {}
Tile.__index = Tile

function Tile.new(t_key)
  assert(t_key ~= nil)
  if type(t_key) == 'number' then
    t_key = Tile.index[t_key]
  end

  local t = setmetatable({ id = t_key or 'null' }, Tile)
  local info = Tile.library[t_key or 'null']
  t.char = Sys.tileset.id[info.char]
  if info.name == 'blank' then
    return t
  end

  t.hp = info.hp
  if info.blocked == true then
    t.blocked = true
  end
  if t_key ~= 'null' then do
    t.fore_color = Color.get(info.fore_color)
    t.back_color = Color.get(info.back_color)
  end
  return t
  end
end

function Tile.get( tile )
  assert(type(tile) == 'number' or type(tile) == 'string')
  if type(tile) == 'number' then 
    tile = Tile.index[tile]
  end
  return Tile.library[tile]
end

Tile.index = {
  'null',
  'floor',
  'hull'
}

Tile.library = {
  floor = {
    name = 'floor',
    char = 'period',
    description = 'A place to stand, much better than a hole in the ship',
    hp = 100,
    back_color = 'light_grey',
    fore_color = 'white',
  },

  hull = {
    name = 'hull',
    char = 'pound', -- #
    description = 'This metallic bulkhead helps keep the ship together.',
    hp = 100,
    blocked = true,
    back_color = 'light_blue',
    fore_color = 'light_grey',
  },

  null = {
    name = 'null',
    char = 'null',
  }
}

return Tile
