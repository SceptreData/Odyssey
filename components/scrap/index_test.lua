Vector = require('vector')

-- pos_mt = { __index = Vector, __call = Vector.new }
-- pos = setmetatable({}, pos_mt)
--
-- pos = {}
-- pos.__index = pos
-- pos.a = true
-- print(pos['a'])
--
-- p_vec = Vector(1,2)
-- p_mt = getmetatable(p_vec)
--
-- p1 = Vector(1,1)
-- p2 = Vector(2,2)
-- print(p_vec)
-- function nested_index(t, key, val)
--   if t[key] == nil and Vector[key] == nil then
--     return nil
--   else
--     if t[key] then
--       if type(t[key]) == 'function' then
--         return t.key(val or nil)
--       else
--         return
--
-- end
-- end

t = {1, 2, 3, a = 'apple', b = 'banana'}
s = {}

v1 = Vector(1, 1)
v2 = Vector(2, 2)

Pos = {}

function Pos.add(a,b)
  print(a + b)
end

function Pos.sub(a,b)
  print(a - b)
end

vmt = getmetatable(v1)

foo = {}
duplicate = {}

vmt_names = {}
v_names = {}
for k, v in pairs(vmt) do
  table.insert(vmt_names, k)
end

for k, v in pairs(Vector) do
  table.insert(v_names, k)
end

function checkForDouble(main, d, inList)
  for _, v in ipairs(inList) do
    if main[v] ~= nil then
      d[v] = true
    else
      main[v] = true
    end
  end
end

function lenKeyTable(t)
  local total = 0
  for k in pairs(t) do total= total + 1 end
  return total
end

function biggestTable(t1, t2)
  s1, s2 = lenKeyTable(t1), lenKeyTable(t1)
  local big= {}
  if s1 >= s2 then return t1, t2 else return t2, t1 end
end

function listDoubles(t1, t2)
  local larger, smaller = biggestTable(t1, t2)
  for k in pairs(larger) do
    if smaller[k] ~= nil then
      print(k)
    else
      print('UNIQUE:  ' .. k)
    end
  end
end

print(lenKeyTable(Vector), lenKeyTable(vmt))
for k, v in pairs(Vector) do
  print(k)
end

for k, v in pairs(Pos) do
  vmt[k] = v
end

function new_position(x, y)
   return setmetatable({x = x or 0, y = y or 0}, vmt)
end

c = new_position(3, 3)
print(c)
c.add(5,6)

d = Vector(1, 1)

c = c + d
print(c)
blah = {table.unpack(Pos)}

for _, v in ipairs(blah) do
  print(v)
end

-- listDoubles(vmt, vmt_i)

-- for k in pairs(foo) do 
--   print(k)
-- end
--
--mt = { __newindex = s, __index = print }
--
-- setmetatable(t, mt)
--
-- x = 'wow'
-- t.x = x
-- t[5] = 99
--
-- for k, v in pairs(s) do
--   print(k, v)
-- end
