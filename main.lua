local lurker   = require('libs/lurker')
local TICK     = require('libs/tick')

local Sys = require('sys')
local Display = require('display')
local Build = require('build')

local Game = require('game')

local ship_path = 'data/tinyShip64x29'
local bg_img_path = 'data/starfield.png'


function love.load()
  Sys.init() 
  Display:init()
  Game:init()
end

function love.draw()
  --love.graphics.setBlendMode('alpha','premultiplied')
  --love.graphics.draw(Display.background)
  --Display.camera:attach()
  --love.graphics.draw(Display.buffer)
  --Display.camera:detach()
  --love.graphics.setBlendMode('alpha')
  Sys.draw_fpsGraph()
end


function love.update(dt)
  Sys.updateGraph(TICK.dt)
  Game:update(dt)
end


function love.keypressed(k)
  if love.keyboard.isDown('escape') then
    love.event.quit()
  end
  if k == 'right' then Display.camera:move(100, 0)end
  if k == 'left' then Display.camera:move(-100, 0) end
  if k == 'up' then Display.camera:zoom(1.5) end
  if k == 'down' then Display.camera:zoom(0.75) end

  -- If src file changes detected, HOT SWAP EM IN
  if love.keyboard.isDown('f9') then lurker.scan() end
end

--[[ 
  OLD CODE
  ship = Build.ship(Sys.data.ships.test_ship)
  ship.cur_quad = 1
  ship.x = 0
  ship.y = 0

  -- DRAW
  Display.draw_o(ship)
  for i = 1, 16 do
    for j = 1, 16 do
      love.graphics.draw(Sys.cur_tileset.img, Sys.cur_tileset.quads[(j-1) * 16 + i], -100 + (i*28), -150 + (j * 28 ))
    end
  end
]]--
