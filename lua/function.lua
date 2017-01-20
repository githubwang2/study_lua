--Lua的函数


function add(a,b)
	return a+b,a-b --Lua里面的多返回值
end

print(add(1,2))

add2=function(a,b)
	return a+b
end

print(add2(1,2))

a,b,c=1,2             --Lua你的多赋值
a,b=b,a
print(a,b,c)
-->		2	1	nil


--------------超级有用的local
function foo()
	a1=1
	local a2=2
	return a2+1
end
foo()
print(a1,a2,foo())
-->			1	nil	3
--使用local的理由1： 局部
-----------------2： 自动的优化
