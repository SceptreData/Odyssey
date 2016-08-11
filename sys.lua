fpsGraph = require('libs/FPSGraph')
lurker   = require('libs/lurker')
TICK     = require('libs/tick')
cargo    = require('libs/cargo')

local data_path = 'data/'
local lg = love.graphics

local Sys = {}
Sys.__index = Sys
Sys.data = nil
Sys.font = nil
Sys.tileset = nil

function Sys.init()
  Sys.openLibs()
  Sys:loadAssets(data_path)
  Sys:loadDefaults()
  Sys.start_fpsGraph()
end

function Sys.openLibs()
  TICK.framerate = 60
  TICK.sleep = 0.001
  lurker.preswap = function(f) print("File Swap: " .. f ) end
end

function Sys:loadAssets( folder )
  assert( type(folder) == 'string', 'Expected string. Received: '.. type(folder))
  self.data = cargo.init(folder)
  self.tileset = Sys.loadTileset( self.data.fonts.cp437_20 )
end

function Sys:loadDefaults()
  self.font = Sys.getFont(ConfigTable.default_font, 16)
  Sys:setFont(self.font)
end
 
function Sys.loadTileset( tile_img )
  assert( Sys.data ~= nil )
  local tileset = buildTilesetQuads( tile_img )
  tileset.id = get_tileIds( Sys.data.fonts.tile_id )
  tileset.img = tile_img
  return tileset
end

function buildTilesetQuads( img )
  assert(img ~= nil)
  local img_w = img:getWidth()
  local img_h = img:getHeight()
  local size = img_w / 16

  local idx = 1
  local q = {}
  for j = 1, 16 do
    for i = 1, 16 do
      local x, y = (i - 1) * size, (j - 1) * size
       q[idx] = love.graphics.newQuad(x, y, size, size, img_w, img_h)
       idx = idx + 1
    end
  end
  q.size = size
  return q
end

function get_tileIds( file )
  assert(type(file) ==  'table', 'expected table. Got: '.. type(file))
  local info = file.names
  local t = {}
  for i = 1, 256 do
    local name = info[i]
    t[name] = i
  end
  return t
end


-- FONT STUFF
function Sys.getFont(name, size)
  return Sys.data.fonts[name](size)
end

function Sys:setFont(font)
  love.graphics.setFont(font)
  Sys.font_set = true
end


-- FPS GRAPH STUFF
local graph = nil
function Sys.start_fpsGraph()
  graph = fpsGraph.createGraph(10,10, 100, 100)
end


function Sys.draw_fpsGraph()
  fpsGraph.drawGraphs({graph})
end

 
function Sys.updateGraph(dt)
  fpsGraph.updateFPS(graph, dt)
end
 
return Sys

-- function build_tilesets()
--   assert(Sys.data ~= nil)
--   local files_path = Sys.data.fonts.list437
--   local tile_ids = Sys.data.fonts.tile_id
--
--   local t = {}
--   t.ids = get_tileIds( tile_ids )
--   t.set = build_sets(files_path)
--   return t
-- end
--
-- function build_sets(files)
--   assert(type(files) == 'table', 'expected table, got '..type(files))
--   local t = {}
--   for i, entry in ipairs(files) do 
--     t[i] = {}
--     local size = entry[1]
--     local img = Sys.data.fonts[entry[2]]
--     local quads = build_sprite437( img, size )
--     t[i].size, t[i].img, t[i].quads = size, img, quads
--   end
--   return t
-- end
-- Load Tileset Info
-- function Sys:setTileset( tset_idx )
--  assert(tset_idx > 0)
--  self.cur_tileset = tileInfo.set[tset_idx]
--  -- refresh screen or something
-- end
--
