package.path = '../?.lua;' .. package.path

Q = require('action_queue')
lume = require('libs/lume')

time = lume.time(function()
  eq = Q.new()

  for i = 1, 100 do
    eq:push( i, math.random(100))
  end

  while not eq:isEmpty() do
    obj, val = eq.pop(eq)
  end
  end)

print(time)

time = lume.time(function()
  eq = Q.new()

  for i = 1, 100000 do
    eq:push( i, math.random(100))
  end

  while not eq:isEmpty() do
    obj, val = eq.pop(eq)
  end
  end)

print(time)

time = lume.time(function()
  eq = Q.new()

  for i = 1, 10000000 do
    eq:push( i, math.random(100))
  end

  while not eq:isEmpty() do
    obj, val = eq.pop(eq)
  end
  end)

print(time)

