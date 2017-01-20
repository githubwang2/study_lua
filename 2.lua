
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
Window = {}
Window.mt = {}
Window.prototype = {x = 0, y = 0, width=100, height = 100}
Window.mt.__index = function(table, key)
    return Window.prototype[key]
end

function Window.new(t)
    setmetatable(t, Window.mt)
    return t
end

-- 测试
w = Window.new{x = 10, y = 20}
print(w.height)
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
Window = {}
Window.mt = {}
Window.mt.__newindex = function(table, key, value)
    print("update of element" .. tostring(key) .. tostring(value))
    rawset(table, key, value)
    -- 测试下面的语句！
    --table[key] = value
end

function Window.new(t)
    setmetatable(t, Window.mt)
    return t
end

-- 测试
w = Window.new{x = 10, y = 20}
-- w.x = 20
w.a = 10
print(w.a)
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
Set = {}
-- 未了避免命名空间污染，我们在set内部定义其metatable
Set.mt = {}

function Set.new(t)
    local set = {}
    Set.mt.__add = Set.union
    Set.mt.__tostring = Set.tostring
    setmetatable(set, Set.mt)
    for i, v in ipairs(t) do
        set[v] = true
    end
    return set
end

function Set.union(a, b)
    local res = Set.new{}
    -- k short for key
    for k in pairs(a) do
        res[k] = true
    end
    for k in pairs(b) do
        res[k] = true
    end
    return res
end

function Set.tostring(set)
    local s = "{"
    local sep = ""
    for e in pairs(set) do
        s = s .. sep .. e
        sep = ", "
    end
    return s .. "}"
end


-- 测试
s1 = Set.new{10, 20, 30, 50}
s2 = Set.new{30, 1}
s3 = s1 + s2
print(s3)


