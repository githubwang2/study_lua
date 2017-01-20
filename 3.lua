------------------------------------------------------------
--封装
------------------------------------------------------------
People={age=18}

function People:new()
	local p={}
	setmetatable(p,self)
	self.__index=self
	return p
end

function People:growUp()
	self.age=self.age+1
	print("People is growUp:"..self.age)
end

--测试
p1=People:new()
p1:growUp()
p2=People:new()
p2:growUp()
-->            People's growUp:19
-->            People's growUp:19
--[[
通过 metatable与__index可以极简单的实现封装
2个age完全独立
]]
------------------------------------------------------------
--继承
------------------------------------------------------------
Man=People:new()
function Man:growUp()
	self.age=self.age+1
	print("man is growUp:"..self.age)
end

--测试
man=Man:new()
man:growUp()
-->             man is growUp:19
------------------------------------------------------------
--多态
------------------------------------------------------------
--测试
person=People:new()
person:growUp()
person=Man:new()
person:growUp()
-->				People is growUp:19
-->				man is growUp:19
--Lua不支持函数多态，而指针的多态，由于Lua的动态类型特性，本身就能支持
