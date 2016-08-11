-- Render Information Component
package.path = '../?.lua;' .. package.path
local lume = require('libs/lume')
local tiny = require('libs/tiny')
local Vector = require('libs/vector')

local Display = require('display')
local Sys = require('sys')
local Color = require('components/color')

local Render = {}
Render.__index = Render

local render_queue = Display.render_queue
local tileset = Sys.tileset

function Render.set( char, fore_color, back_color, alpha )
  local r = setmetatable({}, Render)
  r.char = tileset.id['char']

  if type(fore_color) == 'string' then
    r.fore_color = Color.get( fore_color )
  elseif type(fore_color) == 'table' then
    assert( type( fore_color[1] ) == 'number' and #fore_color == 3)
    r.fore_color = fore_color
  else
    r.fore_color = {255, 255, 255}
  end

  if type( back_color ) == 'string' then
    r.back_color = Color.get( back_color )
  elseif type(back_color) == 'table' then
    assert( type( back_color[1] ) == 'number' and #back_color == 3)
    r.back_color = back_color
  else
    r.back_color = {0, 0, 0}
  end
  
  r.alpha = alpha or nil
  return r
end

function Render.setChild( map )
  return { parent = true, map = map }
end

local drawMap = function(map, position, orientation)
  local x_center = math.floor( map.width / 2 ) + 1
  local y_center = math.floor( map.height / 2 ) + 1
  for j = 1, map.height do
    for i = 1, map.width do
      local offset = Vector( i - x_center, j - y_center )
      local tile = map:getTile(i, j)
      Display.drawOffset(tile, position, offset, orientation)
    end
  end
end

-- Consider switching to sorted system ie { Maps, Items, Actors }
local renderSystem = tiny.processingSystem()
renderSystem.filter = tiny.requireAll('position', 'render', 'location')

function renderSystem:process(e, dt)
  --if not Display:onScreen( e.pos, e.orientation, e.map.dimensions) then return end
  --local screen_limit = Display:getDrawLimits()
  --local draw_list = {e.map, e.objects, e.actors}
  local r = e.orientation or 0
  if e.render.parent == true then
    drawMap(e.map, e.position, r)
  else
    local parent_pos = e.location.position
    drawEntity( e.render, parent_pos )
  end
end

Render.system = renderSystem

return Render
