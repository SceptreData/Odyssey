local Color = {}
Color.__index = Color

local color_table = {}

function Color.get( name )
  return { unpack(color_table[name]) }
end

color_table = {
  white = {255, 255, 255},
  black = {0, 0, 0},

  grey = {127, 127, 127},
  light_grey = {159, 159, 159},
  lighter_grey = {191, 191, 191},

  red = {255, 0, 0},
  green = {0, 255, 0},
  
  blue = {0, 0, 255}, 
  light_blue = {115, 115, 255},

  yellow = {255, 255, 0},
  orange = {255, 127, 0},
  gold = {229, 191, 0},

  purple = {191, 0, 255}
}

return Color
