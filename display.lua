-- Display functions
local lume = require('libs/lume')
local Camera = require('libs/camera')
local Vector = require('libs/vector')

local Sys = require('sys')
local lg = love.graphics

local Display = {}
Display.__index = Display

Display.screen_width = 0
Display.screen_height = 0
Display.camera = 0

Display.render_queue = {}
-- change this function so it only checks for dimensions if they aren't in object

function Display:init()
  self.screen_width, self.screen_height = lg.getDimensions()
  Display.camera = Camera(0, 0)
  self.background = lg.newCanvas()
  self.buffer = lg.newCanvas()
  buildStarBackground(self.background)
  -- self.background = Sys.data.images.starfield
  lg.setDefaultFilter('linear')
end

function Display.drawRenderQueue()
  local q = Display.render_queue
  while #q > 0 do
    local job = table.remove(q)
    Display.drawTile( unpack( job ) )
  end
end

function Display.drawTile( char, color, back_color, origin_x, origin_y, angle, off_x, off_y )
  local size = Sys.tileset.size
  local img = Sys.tileset.img
  local tileset = Sys.tileset

  off_x, off_y = off_x or 0, off_y or 0
  lg.setColor( back_color ) 
  lg.draw( img, tileset[ 220 ], origin_x, origin_y, angle, 1, 1,
           -off_x * size, -off_y * size )

  lg.setColor( color )
  lg.draw( img, tileset[ char ], origin_x, origin_y, angle, 1, 1,
           -off_x * size, -off_y * size)
end

function Display:drawBackground()
  assert(self.background ~= nil)
  for i = 0, love.graphics.getWidth() / self.background:getWidth() do
    for j = 0, love.graphics.getHeight() / self.background:getHeight() do
      love.graphics.draw( self.background,
      i * self.background:getWidth(), j * self.background:getHeight()
      )
    end
  end
end

function Display.drawOffset( render, pos, off, rotation)
  local offset =  off * Sys.tileset.size 
  -- print(render.char, pos, off)
  --local char = Sys.tileInfo.ids[ render.char ]
  lg.setCanvas(Display.buffer)
  lg.clear()
  lg.setBlendMode('alpha')
  lg.setColor( render.back_color )
  lg.draw( Sys.tileset.img, Sys.tileset[220], 
           pos.x, pos.y, rotation, 1, 1, offset.x, offset.y )

  lg.setColor( render.fore_color )
  lg.draw( Sys.tileset.img, Sys.tileset[render.char], 
           pos.x, pos.y, rotation,1, 1, offset.x, offset.y )
  lg.setCanvas()
end
function Display.draw_o( o )
  --local cx, cy = Display.camera:cameraCoords( o.x, o.y )
  local cx, cy = o.x, o.y 
  local scale = Display.camera.scale
  local xtiles, ytiles = (Display.screen_width / 12) / scale, (Display.screen_height / 12) / scale
  Display.camera:attach()
  love.graphics.draw(o.img, o.quads[o.cur_quad], cx, cy)
  if o.cur_quad < 4 then
    o.cur_quad = o.cur_quad + 1
  else o.cur_quad = 1 end
  Display.camera:detach()
end

function buildStarBackground(canvas)
  local char = Sys.tileset.id['dot']
  lg.setCanvas(canvas)
    lg.clear()
    lg.setBlendMode('alpha')
    lg.setColor(255, 255, 255)
    for i = 1, 500 do
      local x, y = math.random() * Display.screen_width, math.random() * Display.screen_height
      lg.draw(Sys.tileset.img, Sys.tileset[char], x, y)
    end
    lg.setCanvas()
end 

return Display
