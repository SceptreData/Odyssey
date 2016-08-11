local Tools= {}
Tools.__index = Tools

function Tools.printMeta(t)
  assert( type(t) == 'table')
  local meta = getmetatable(t)
  for k in pairs(meta) do
    print(k)
  end
end

function Tools.checkMeta(t, k)
  local meta = getmetatable(t)
  for key in pairs(meta) do
    if key == k then return true end
  end
  return false
end
    
function Tools.inherit( base )
  local sub = {}
  for k, v in pairs(base) do
    sub[k] = v
  end
  return sub
end


function Tools.shallow_copy(t)
  local t2 = {}
  for k, v in pairs(t) do
    t2[k] = v
  end
  return t2
end

function Tools.combine( foo, bar )
  local mt = Tools.shallow_copy(bar)
  for k, func in pairs(foo) do
    mt[k] = func
  end
  return mt
end

function Tools.printTable(t)
  for k,v in pairs(t) do
    print(k, v)
  end
end

function Tools.add_index(t1, meta)
  meta.__index = t1.__index
end

return Tools

