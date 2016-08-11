
ActionQueue = {}
ActionQueue.__index = {}

local function push(heap, key ,val )
  assert(val ~= nil)
  local t = heap.nodes
  local h = heap.heap
  local pos = #h + 1
  local parent = (pos - pos % 2) / 2

  --Start from the top
  h[pos] = key
  t[key] = val

  -- Work our way down the heap.
  while pos > 1 and t[h[parent]] < val do
    h[parent], h[pos] = h[pos], h[parent]
    pos = parent
    parent = (pos - pos % 2) / 2
  end
end

local function pop(heap)
  local t = heap.nodes
  local h = heap.heap
  local cur = #h
  assert( cur > 0 )
  local e = h[1]
  local r = t[e]
  local val = t[h[cur]]

  h[1] = h[cur]
  h[cur] = nil
  t[e] = nil
  cur = cur - 1

  local pos = 1
  local parent =  2 * pos -- Left Child
  
  if cur > parent and t[h[parent]] < t[h[parent + 1]] then
    parent = 2 * pos + 1
  end

  while cur >= parent and t[h[parent]] > val do
    h[parent], h[pos] = h[pos], h[parent]
    pos = parent
    parent = 2 * pos
    if cur> parent and t[h[parent]] < t[h[parent+1]] then
      parent = 2 * pos + 1
    end
  end
  return e, r
end

local function isEmpty(h)
 return h.heap[1] == nil
end

function ActionQueue.new()
  return setmetatable({heap = {}, nodes = {}}, 
                      {__index = {push = push, pop = pop, isEmpty = isEmpty}})
end

return ActionQueue
