ConfigTable = {}

function love.conf(t)
  t.identity = "Odyssey v0.0.1"
  t.version = "0.10.1"
  t.window.title = "Odyssey"

  ConfigTable.default_font = 'PixelCarnageMono'

  t.window.width = 1200
  t.window.height = 720

  t.window.fsaa = 4
  t.window.vsync = true
  
  t.modules.joysticks = false
  t.modules.physics = false
  t.modules.touch = false
  t.modules.audio = false
end
