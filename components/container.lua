local Container = {}
Container.__index = Container

local iscontainer = function(t)
  assert( type(t.name) == 'string' and type(t.max_slots) == 'number')
  return true
end

function Container.buildContainer( containerInfo, contents )
  assert(iscontainer(containerInfo))
  local c = setmetatable({}, Container)
  c.name = containerInfo.name
  c.weight = 0
  c.maxSlots = containerInfo.max
  c.numItems = 0
  c.num_slots = c.maxSlots

  c.contents = {}
  for _, item in contents do
    if c.num_slots > 0 then -- And object smaller than container
      c:insert(item)
    end
  end
  return c
end

function Container:insert( obj )
  if self.num_slots > 0 then
    table.insert(self.contents, obj)
    obj.in_container = self
    self.num_slots = self.num_slots - 1
    self.weight = self.weight + obj.weight
    self.numItems = self.numItems + 1
  end
end

function Container:removeObj( obj_idx )
  assert(obj_index > 0 and obj_idx <= self.num_slots)
  local obj = table.remove(self.contents, obj_idx)
  self.num_slots = self.num_slots + 1
  self.weight = self.weight - obj.weight
  self.numItems = self.numItems - 1
  return obj
end
  
function Container:getContents()
  return self.contents
end

function Container:destroy()
end

return Container
