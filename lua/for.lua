--Lua的For数值遍历



--for(int i=0;i<10;i++)
--{
--	printf("%d\n",i);
--}

for i=0,9,1 do
	print(i)
end

for i=0,9 do
	print(i)
end

for i=0,9,3 do
	print(i)
end
--> 0 3 6 9
--do前面默认为1 可省略


--Lua的For泛型遍历

a={
["foo"]=1,
[100]=true,

[1]=20,
[2]=30,
}

for k,v in pairs(a) do
	print(k,v)
end
-->			100	true
-->			2	30
-->			1	20
-->			foo	1
--pairs遍历出来是无顺序的
--pairs() ipairs() 迭代器
--ipairs()只遍历数组部分


for k,v in ipairs(a) do
	print(k,v)
end
-->			1	20
-->			2	30

--table 包含数组  映射
