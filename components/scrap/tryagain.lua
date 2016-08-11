require('class')
vector = require('vector')

d = vector(3, 3)
print(d)

Pos = class(vector(),{
    name = 'pos' })

Pos(3,2)
