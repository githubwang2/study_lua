------------------------------------------------------------
--��װ
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

--����
p1=People:new()
p1:growUp()
p2=People:new()
p2:growUp()
-->            People's growUp:19
-->            People's growUp:19
--[[
ͨ�� metatable��__index���Լ��򵥵�ʵ�ַ�װ
2��age��ȫ����
]]
------------------------------------------------------------
--�̳�
------------------------------------------------------------
Man=People:new()
function Man:growUp()
	self.age=self.age+1
	print("man is growUp:"..self.age)
end

--����
man=Man:new()
man:growUp()
-->             man is growUp:19
------------------------------------------------------------
--��̬
------------------------------------------------------------
--����
person=People:new()
person:growUp()
person=Man:new()
person:growUp()
-->				People is growUp:19
-->				man is growUp:19
--Lua��֧�ֺ�����̬����ָ��Ķ�̬������Lua�Ķ�̬�������ԣ��������֧��
