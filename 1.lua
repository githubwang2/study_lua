--lua5.1基本语法
--*******************1.命名规范 同C****************************
--*******************2.类型与值    ****************************
--[[
8种基础类型:
nil			空
boolean		布尔
number		数字
string		字符串
function	函数
table		表
userdata	自定义数据类型
thread		线程
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
--单引号与双引号均可作为字符串标识
--当字符串多种格式时可以用以下方式来定义
long_str=[[I am a "long",long str]]
print (long_str)
--table类似于C++中MAP

--lua中只有nil和false表示假 其余都为真
--一个全局变量赋值为nil 表示删除该变量
--0亦为真 与C区别
--浮点与整形皆为number
var=0
if var then
print("var is true")
else
print("var is false")
end
--*******************3.表达式   ****************************
--**算术运算符			+ - * / ^ % (负号)
--**关系运算符			< > <= >= ~= ==
--**逻辑操作符			and or not
--**字符连接操作符		..
--**操作符优先级
--**table构造式 		t={}
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
--C++结构体写法也行
d={}
d.name="wang"
d.age="10"
d[1]="yiyu"
d[2]="ichiu"
print(d.name,d.age,d[1],d[2])
--*******************4.语句  *********************************
--**赋值语句
--**局部变量与块
a1,a2=10,20
print(a1,a2)
a1,a2=a2,a1    				--不用变量中介
print(a1,a2)
--定义局部变量 前面加local  ，否则为全局
function someValue()
	local b1,b2=10,20
	return b1,b2
end
print(someValue())
--**控制语句
--------------if...then...else
--C++中
--[[
	if(a>b){
	}elseif(a>c){
	}else{
	}
]]
--lua中
a,b,c=1,2,3
if a > b then print(a)
elseif a>c  then print(b)
else print(c)
end
----------------while
--C++中
--[[
	while(a<5){
	a++
	}
]]
--lua中
while a<5 do
a=a+1
end
------------------repeat...until
--类似于C++中do...while
--C++中
--[[
	i=0;
	do{
	i=i+1;
	cout<<i;
	}while(i<3)		输出1，2，3
]]
--lua中
local i=0
repeat
	i=i+1
	print(i..",")
until i>3			--输出1，2，3，4
------------------for
--数字for循环
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
--泛型for循环
--用迭代器函数来遍历所有的值 同C++中vector类似 更简单方便
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
函数values 的返回值是一个另外一个匿名函数，其内容为 function () i = i + 1; return t[i] end
并且这个匿名函数本身又是一个闭包 (closure)，因为在这个函数中使用了外层的数据，即 i 和 t， i 和 t 是 values 函数里的局部变量，被那个匿名函数使用，所以匿名函数和 t, i 组成了闭包。
a = values(t) ，则 a 为一个闭包函数
，初始状态下，闭包中的 i 为 0， t 为传入的 t （即 {10, 20, 30}），如果你用 a() 的方法调用这个闭包函数，则会执行匿名函数中的内容，即 i 增加1， 并返回 t[i]
return竟然不退出，，，，，
]]
--**break与return

--*******************5.函数 *********************************
--**函数定义
func=function()  end
function func()  end
--对象
class={}
function class.func1()
end
function class:func2()
end
--lua中使用“：”定义的函数会自动传入一个名为self的变量，self同c++中的this一样，表示当前对象的指针；
--而“."没有self
function class.func1(self)end
function class:func2()end --func1与func2等价
--**函数参数与返回值
function f()
	return 30,50
end
x,y=f()
print(x,y)
--return 返回一个函数的返回值，return f()会把f()返回的所有返回值都返回，return(f())会迫使它只能返回一个结果
--unpack接受一个数组作为参数，并从下标1开始返回数组的所有元素
--unpack经常用于函数参数传递

--**可变参数
--lua中“...”表示该函数可以接受不同数量的实参
function add(...)
	local s=0
	for i,v in ipairs{...}do
		s=s+v
	end
	return s
end
print(add (1,2,3,4,5))
--Lua将函数的参数放在一个叫arg的表中，除了参数以外，arg表中还有一个域n表示参数的个数
function g (a, b, ...) end
g(3)              --	a=3, b=nil, arg={n=0}
g(3, 4)           --	a=3, b=4, arg={n=0}
g(3, 4, 5, 8)     --	a=3, b=4, arg={5, 8; n=2}

--**闭包函数
--闭包函数是指将一个函数写在另一个函数之内，这个位于内部的函数可以访问外部函数中的局部变量
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
--匿名函数访问了一个非局部的变量i，i用来保持一个计数器，表面上看
--由于创建变量i的函数(newCounter)已经返回，所以之后每次调用匿名函数时，i均已超出它的作用域
--但是因为匿名函数一直在使用变量i，所以lua会正确的维护i的生命周期
--在匿名函数的内部，i既不是全局变量，也不是局部变量，被称作外部的局部变量或upvalue
