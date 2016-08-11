-- energy component. Allows for custom recharge/usage functions.

local Energy = {}
Energy.__index = Energy

function Energy.attach( recharge_fn, max, cur)
  local e = setmetatable({}, Energy)
  e.r_fn = recharge_fn or nil
  e.max = max or 1200
  e.level = cur or 0
  return e
end

function Energy:recharge(...)
  self.level = self.level + self.r_fn(...)
  if self.level > self.max then
    self.level = self.max
  elseif self.level < 0 then
    self.level = 0
  end
  return self
end

function Energy:set( new_level )
  if new_level > self.max then
    new_level = max
  elseif new_level < 0 then
    new_level = 0
  end
  self.level = new_level
  return self
end

return Energy
