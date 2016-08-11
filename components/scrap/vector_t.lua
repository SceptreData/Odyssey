Position = {}
Position.__index = Position

function Position.new(x, y)
  local p = {x or -1, y or -1}
  setmetatable(p, Position)
  return p
end

x = Position.new(10, 15)
