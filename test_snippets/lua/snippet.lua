-- Commenting: Single line and multi-line comments
-- Single line comment
--[[
    Multi-line comment
]]

-- Base Types Examples
local number = 42 -- Number
local string = "Hello, Lua!" -- String
local boolean = true -- Boolean
local nilValue = nil -- Nil
local table = {key = "value", "list", 42} -- Table
local functionValue = function() print("This is a function") end -- Function
local thread = coroutine.create(function() end) -- Thread
local userdata = {} -- Userdata

-- Control Structures

-- if-then-else
if number < 100 then
    print("Number is less than 100")
elseif number == 100 then
    print("Number is 100")
else
    print("Number is greater than 100")
end

-- while loop
local i = 1
while i <= 5 do
    print("While loop iteration:", i)
    i = i + 1
end

-- repeat-until loop
repeat
    i = i - 1
    print("Repeat-until loop iteration:", i)
until i == 1

-- for loop - numeric
for j = 1, 5 do
    print("For loop iteration:", j)
end

-- for loop - generic (pairs, ipairs for arrays)
for key, value in pairs(table) do
    print(key, value)
end

-- Functions
function greet(name)
    print("Hello, " .. name)
end
greet("Lua user")

-- Tables (Lua’s sole data structuring mechanism)
local person = {name = "John Doe", age = 30}
print(person.name, person.age) -- Accessing table elements

-- Table as array
local colors = {"red", "green", "blue"}
for index, color in ipairs(colors) do
    print(index, color)
end

-- Coroutine example
local co = coroutine.create(function ()
    for i = 1, 5 do
      print("co", i)
      coroutine.yield()
    end
end)

coroutine.resume(co) -- Starts or continues the execution of coroutine co

