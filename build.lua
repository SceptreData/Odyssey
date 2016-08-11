-- Build Objects/Actors... 
local Sys = require('sys')

local Build = {}
Build.__index = Build

local constructor_table = {}


function Build.ship( info )
  local ship = {}
  ship.name = info.name
  ship.img = Sys.data.images[info.img_file]
  ship.quads = Build.spriteQuads(ship.img, 64, 29, info.quads)
  return ship
end

function Build.spriteQuads( img, w, h, quads )
  assert(img ~= nil and quads ~= nil)
  local img_h = img:getHeight()
  local img_w = img:getWidth()
  local quad_t = {}
  for i, quad in ipairs(quads) do
    local x, y = quad[2], quad[3]
    quad_t[i] = love.graphics.newQuad(x, y, w, h, img_w, img_h)
  end
  return quad_t
end


function Build.object( components )
  local obj = {}
  obj.base = 'object'
  for key, info in pairs(components) do
    local ctor = Build.constructor_table[key]
    if ctor ~= nil then
      obj[key] = ctor(info)
    else
      obj[key] = info
    end
  end
  assert(obj)
  return obj
end

function Build.addConstructor(name, fn)
  assert(type(fn) == 'function')
  Build.constructor_table[name] = fn
end

return Build
