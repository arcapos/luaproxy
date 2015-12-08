require "proxy"

p = proxy.new()

p.asset = {}
for n = 1, 5 do
	p.asset[n] = {
		name = 'asset ' .. n
	}
end

p:dostring([[
for n = 1, 5 do
	print(asset[n].name)
end

for i, v in pairs(asset) do
	print(i)
	print(v.name)
	for j, k in pairs(v) do
		print(j)
		print(k)
	end
end

]])

