P = {}
function P.a()
  print('EH!')
end

function P.b() 
  print('BEE!!!!')
end

for k in pairs(P) do 
  print(k)
end
foo = {1, 2, apple = 1, bar = 2}
print(table.unpack(foo))
c = {table.unpack(P)}

print(c[1])

for _, v in ipairs(c) do 
  print(v)
end

