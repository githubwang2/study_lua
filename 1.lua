--lua5.1�����﷨
--*******************1.�����淶 ͬC****************************
--*******************2.������ֵ    ****************************
--[[
8�ֻ�������:
nil			��
boolean		����
number		����
string		�ַ���
function	����
table		��
userdata	�Զ�����������
thread		�߳�
]]
print("hello".."world")
print(#"hello world")
var=20.1
print(type(var))
var="hello world"
print(type(var))
var=print
print(type(var))
var={}
print(type(var))
str="I an a str"
print (str)
--��������˫���ž�����Ϊ�ַ�����ʶ
--���ַ������ָ�ʽʱ���������·�ʽ������
long_str=[[I am a "long",long str]]
print (long_str)
--table������C++��MAP

--lua��ֻ��nil��false��ʾ�� ���඼Ϊ��
--һ��ȫ�ֱ�����ֵΪnil ��ʾɾ���ñ���
--0��Ϊ�� ��C����
--���������ν�Ϊnumber
var=0
if var then
print("var is true")
else
print("var is false")
end
--*******************3.���ʽ   ****************************
--**���������			+ - * / ^ % (����)
--**��ϵ�����			< > <= >= ~= ==
--**�߼�������			and or not
--**�ַ����Ӳ�����		..
--**���������ȼ�
--**table����ʽ 		t={}
a={x=10,y=20}
t={}
t[1]="a"   t[2]="b"  t[3]="c"  		print(#t)
t[3]=nil  							print(#t)
c={
name="wang",
age="10",
"yiyu",
"ichiu"
}
print(c.name,c.age,c[1],c[2])
--C++�ṹ��д��Ҳ��
d={}
d.name="wang"
d.age="10"
d[1]="yiyu"
d[2]="ichiu"
print(d.name,d.age,d[1],d[2])
--*******************4.���  *********************************
--**��ֵ���
--**�ֲ��������
a1,a2=10,20
print(a1,a2)
a1,a2=a2,a1    				--���ñ����н�
print(a1,a2)
--����ֲ����� ǰ���local  ������Ϊȫ��
function someValue()
	local b1,b2=10,20
	return b1,b2
end
print(someValue())
--**�������
--------------if...then...else
--C++��
--[[
	if(a>b){
	}elseif(a>c){
	}else{
	}
]]
--lua��
a,b,c=1,2,3
if a > b then print(a)
elseif a>c  then print(b)
else print(c)
end
----------------while
--C++��
--[[
	while(a<5){
	a++
	}
]]
--lua��
while a<5 do
a=a+1
end
------------------repeat...until
--������C++��do...while
--C++��
--[[
	i=0;
	do{
	i=i+1;
	cout<<i;
	}while(i<3)		���1��2��3
]]
--lua��
local i=0
repeat
	i=i+1
	print(i..",")
until i>3			--���1��2��3��4
------------------for
--����forѭ��
--[[
	for init,max/min value, increment
	do
	  statement(s)
	end
	(for var= form,end step do )
]]
for i=1,10,1
do
   print(i)
end
--����forѭ��
--�õ������������������е�ֵ ͬC++��vector���� ���򵥷���
--[[
for <var-list> in <exp-list> do
      <body>
 end
]]
function values(t)
      local i = 0
      return function ()
           i = i + 1
           return t[i]
      end
 end

 local testTa= {10, 20, 30}
 for value in values(testTa) do
      print(value)
 end

local testTb = {"One", "Two", "Three"}
 for index, value in ipairs(testTb) do
      print(index, value)
 end
--[[
����values �ķ���ֵ��һ������һ������������������Ϊ function () i = i + 1; return t[i] end
�����������������������һ���հ� (closure)����Ϊ�����������ʹ�����������ݣ��� i �� t�� i �� t �� values ������ľֲ����������Ǹ���������ʹ�ã��������������� t, i ����˱հ���
a = values(t) ���� a Ϊһ���հ�����
����ʼ״̬�£��հ��е� i Ϊ 0�� t Ϊ����� t ���� {10, 20, 30}����������� a() �ķ�����������հ����������ִ�����������е����ݣ��� i ����1�� ������ t[i]
return��Ȼ���˳�����������
]]
--**break��return

--*******************5.���� *********************************
--**��������
func=function()  end
function func()  end
--����
class={}
function class.func1()
end
function class:func2()
end
--lua��ʹ�á���������ĺ������Զ�����һ����Ϊself�ı�����selfͬc++�е�thisһ������ʾ��ǰ�����ָ�룻
--����."û��self
function class.func1(self)end
function class:func2()end --func1��func2�ȼ�
--**���������뷵��ֵ
function f()
	return 30,50
end
x,y=f()
print(x,y)
--return ����һ�������ķ���ֵ��return f()���f()���ص����з���ֵ�����أ�return(f())����ʹ��ֻ�ܷ���һ�����
--unpack����һ��������Ϊ�����������±�1��ʼ�������������Ԫ��
--unpack�������ں�����������

--**�ɱ����
--lua�С�...����ʾ�ú������Խ��ܲ�ͬ������ʵ��
function add(...)
	local s=0
	for i,v in ipairs{...}do
		s=s+v
	end
	return s
end
print(add (1,2,3,4,5))
--Lua�������Ĳ�������һ����arg�ı��У����˲������⣬arg���л���һ����n��ʾ�����ĸ���
function g (a, b, ...) end
g(3)              --	a=3, b=nil, arg={n=0}
g(3, 4)           --	a=3, b=4, arg={n=0}
g(3, 4, 5, 8)     --	a=3, b=4, arg={5, 8; n=2}

--**�հ�����
--�հ�������ָ��һ������д����һ������֮�ڣ����λ���ڲ��ĺ������Է����ⲿ�����еľֲ�����
function newCounter()
	local i=0
	return function()
		i=i+1
		return i
	end
end
c1=newCounter()
print(c1())
print(c1())
--��������������һ���Ǿֲ��ı���i��i��������һ���������������Ͽ�
--���ڴ�������i�ĺ���(newCounter)�Ѿ����أ�����֮��ÿ�ε�����������ʱ��i���ѳ�������������
--������Ϊ��������һֱ��ʹ�ñ���i������lua����ȷ��ά��i����������
--�������������ڲ���i�Ȳ���ȫ�ֱ�����Ҳ���Ǿֲ��������������ⲿ�ľֲ�������upvalue
