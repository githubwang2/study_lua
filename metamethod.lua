Windows = {} --����һ�������ռ�
Windows.mt = {} -- ����Ԫ��
--����Ĭ��ֵ��
Windows.default = {x = 0, y = 0, width = 100, height = 100, color = {r = 255, g = 255, b = 255}}
--����__indexԪ����
--Windows.mt.__index = function (table, key)
--	return Windows.default[key]
--end
Windows.mt.__index = Windows.default


--�������캯��
function Windows.new(t)
	setmetatable(t, Windows.mt)
	return t
end



local win = Windows.new({x = 10, y = 10})
print(win.x)             	-- >10 ���������Ѿ�ӵ�е�ֵ
print(win.width)          	-- >100 ����default���е�ֵ
print(win.color.r)         	-- >255 ����default���е�ֵ
--[[
print(win.x)ʱ������win���������ӵ��x�ֶΣ����Ծ�ֱ�Ӵ�ӡ��������ӵ�е��ֶε�ֵ��
print(win.width)������win��������û��width�ֶΣ���ô��ȥ�����Ƿ�ӵ��Ԫ��Ԫ�����Ƿ���__index��Ӧ��Ԫ������
���ڴ���__indexԪ������������default���е�width�ֶε�ֵ
]]
