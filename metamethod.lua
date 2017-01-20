Windows = {} --创建一个命名空间
Windows.mt = {} -- 创建元表
--创建默认值表
Windows.default = {x = 0, y = 0, width = 100, height = 100, color = {r = 255, g = 255, b = 255}}
--定义__index元方法
--Windows.mt.__index = function (table, key)
--	return Windows.default[key]
--end
Windows.mt.__index = Windows.default


--声明构造函数
function Windows.new(t)
	setmetatable(t, Windows.mt)
	return t
end



local win = Windows.new({x = 10, y = 10})
print(win.x)             	-- >10 访问自身已经拥有的值
print(win.width)          	-- >100 访问default表中的值
print(win.color.r)         	-- >255 访问default表中的值
--[[
print(win.x)时，由于win变量本身就拥有x字段，所以就直接打印了其自身拥有的字段的值；
print(win.width)，由于win变量本身没有width字段，那么就去查找是否拥有元表，元表中是否有__index对应的元方法，
由于存在__index元方法，返回了default表中的width字段的值
]]
