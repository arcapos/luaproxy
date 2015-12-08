local proxy = require 'proxy'


p = proxy.new()
p:dostring([[
print('This is the proxy state')

print('n is:')
print(n)
]])

local t2 = {{id = 42, text = ' foo'}, {id = 10, text = 'bar'}}

p.t2 = t2

print(p.t2[2].text)

p.n = 42	-- creates n in the proxy state
p:dostring([[print('n is ' .. n) n = n + 1]])
print(p.n)

p.Query = {
	op = 'test',
	num = 73
}

print('print in the proxy')
p:dostring([[print(Query.op) print(Query.num)]])

print('print locally')
print(p.Query.op)
print(p.Query.num)

p.Query.num = 15

p:dostring('print(Query.num)')

t = {
	a = 1,
	b = true,
	c = 3
}

p.t = t

p:dostring('print(t.a) print(t.b) print(t.c)')

p:dostring([[print('n is now ' .. n)]])


print("abc " .. p.Query.op)

p:dostring([[function test ()
	print('this is the test function in the proxy')
end
print('function test created')]])

p.test()

print('index tests')

p.posgroup = {}
p.posgroup[1] = {
	name = 'abc'
}

print('--- create table at index 2')

p.posgroup[2] = {}

print('--- set def ')

p.posgroup[2].name = 'def'

print('--- set sale as table')

p.posgroup[2].sale = {}


print('finally')

p:dostring([[
print(posgroup.name)

for k, item in pairs(posgroup) do
	print(item.name)
end
]])

print('---')

images = {}
for n = 1, 110 do
	images[n] = {
		id = 10,
		name = 'test',
		descr = 'descr',
		threshold = 100
	}
end

p.images = {}
for n = 1, 110 do
	p.images[n] = {
		id = 10,
		name = 'test',
		descr = 'descr',
		threshold = 100
	}
end

print('end')
