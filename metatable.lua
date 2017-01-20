Set = {}
local mt = {} -- 集合的元表

-- 根据参数列表中的值创建一个新的集合
function Set.new(t)
	local set = {}
	mt.__add=Set.union
	mt.__sub=Set.intersection
	mt.__tostring=Set.tostring
	mt.__metatable = "You cannot get the metatable" -- 设置完我的元表以后，不让其他人再设置
	setmetatable(set, mt)
	for i, v in pairs(t) do
		set[v] = true
	end
	return set
end

-- 并集操作
function Set.union(a, b)
	local retSet = Set.new{}
	for v in pairs(a) do
		retSet[v] = true
	end
	for v in pairs(b) do
		retSet[v] = true
	end
	return retSet
end

-- 交集操作
function Set.intersection(a, b)
	local retSet = Set.new{}
	for v in pairs(a) do
		retSet[v] = b[v]
	end
	return retSet
end

-- 打印集合的操作
function Set.tostring(set)
    local s = "{"
    local sep = ""
    for e in pairs(set) do
        s = s .. sep .. e
        sep = ", "
    end
    return s .. "}"
end


s1=Set.new{10,20,40}
s2=Set.new{10,30}
s3=s1+s2
s4=s1-s2
print(s3)
print(s4)
--print(getmetatable(s3))
--setmetatable(s3, {})
--设置了字段__metatable时，getmetatable就会返回这个字段的值，而setmetatable则会引发一个错误
--用于保护元表
--[[
-->		{40, 10, 20, 30}
-->		{10}
-->		table: 0030BA00
--------------------------------------------------------------------
-->		{40, 10, 20, 30}
-->		{10}
-->		You cannot get the metatable
-->		lua: metatable.lua:58: cannot change a protected metatable
]]
