--Lua�ĺ���


function add(a,b)
	return a+b,a-b --Lua����Ķ෵��ֵ
end

print(add(1,2))

add2=function(a,b)
	return a+b
end

print(add2(1,2))

a,b,c=1,2             --Lua��Ķำֵ
a,b=b,a
print(a,b,c)
-->		2	1	nil


--------------�������õ�local
function foo()
	a1=1
	local a2=2
	return a2+1
end
foo()
print(a1,a2,foo())
-->			1	nil	3
--ʹ��local������1�� �ֲ�
-----------------2�� �Զ����Ż�
