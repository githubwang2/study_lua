--Lua的包(package)


local c=require("package2")
print(c)
print(c.foo(1,2))
-->        	table: 003AB8C0
-->			3

--require 加载文件，运行

print("require")
for i=1,2 do
	print(require"package2")
end

print("dofile")
for i=1,2 do
	print(dofile"package2.lua")
end
-->			require
-->			table: 009BB988
-->			table: 009BB988
-->			dofile
-->			table: 009BBAA0
-->			table: 009BBB90
