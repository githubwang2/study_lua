--Lua��For��ֵ����



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
--doǰ��Ĭ��Ϊ1 ��ʡ��


--Lua��For���ͱ���

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
--pairs������������˳���
--pairs() ipairs() ������
--ipairs()ֻ�������鲿��


for k,v in ipairs(a) do
	print(k,v)
end
-->			1	20
-->			2	30

--table ��������  ӳ��
