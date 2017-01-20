--Lua的系统库

local t={}

for i=1,10 do
	table.insert(t,i)
end

print(table)




for k,v in pairs(t)do
	print(k,v)
end

for k,v in pairs(table) do
	print(k,v)
end
-->		setn	function: 00698FD0
-->		insert	function: 00698F50
-->		getn	function: 006984A0
-->		foreachi	function: 00698480
-->		maxn	function: 006984E0
-->		foreach	function: 00698440
-->		concat	function: 00698400
-->		sort	function: 00699010
-->		remove	function: 00698F9
--table实际上是封装好的函数库

--一些常用的  #  type  tonumber tostring	format
print(string.format("hi %d",2))
-->		hi 2
