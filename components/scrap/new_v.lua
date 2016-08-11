Vector = require('vector')
Tool = require('tools')

Pos = {}
Pos.__index = Pos 
vector_mt = getmetatable(Vector())

function new_pos(x, y)
  local p_mt = Tool.combine(vector_mt, Pos)
  assert(p_mt['woh'] ~= nil)
  p_mt.__index = Pos
  return setmetatable({x = x or 0, y = y or 0}, p_mt )
end

function Pos.woh()
  print("woh!")
end

Jim = new_pos(3, 3)
print(Jim)
Jim.woh()

Ted = Vector(6, 6)
print(Jim + Ted)

a, b = Jim:unpack()
-- print(Jim.woh)
-- Jim.woh()
--
-- print(Tool.checkMeta(Jim, unpack))
