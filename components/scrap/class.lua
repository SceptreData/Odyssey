--[[
    Simple Class constructor
    Taken from Game Coding Complete p.353
    chapter 12 - Scripting with LUA
]]--

function class(baseClass, body)
  local ret = body or {}

  -- If there is a baseClass, attach our new class to it for INHERITANCE
  if (baseClass ~= nil) then
    setmetatable(ret, ret)
    ret.__index = baseClass
    ret.base = baseClass
  end

  -- Add our Create() function
  ret.Create = function(self, constructionData, originalSubclass)
    local obj
    if (self.__index ~= nil) then
      if(originalSubclass ~= nil) then
        obj = self.__index:Create(constructionData, originalSubclass)
      else
        obj = self.__index:Create(constructionData, self)
      end
    else
      obj = constructionData or {}
    end

    setmetatable(obj, obj)
    obj.__index = self

    -- copy any operators over
    if (self.__operators ~= nil) then
      for key, val in pairs(self.__operators) do
        obj[key] = val
      end
    end

    return obj
  end

  ret.IsInstance = function(self, otherClass)
    local cls = self.__index
    while cls do
      if cls == otherClass then
        return true
      end
      cls = cls.base
    end
    return false
  end

  return ret
end
