-- Lua test file for linter
local function unused_function()
  return "unused"
end

local function test_function()
  local x = 1
  local y = 2
  print("Hello from Lua")
  return x + y
end

-- This should trigger luacheck warnings
local unused_var = "test"
globalVar = "this is global" -- Missing local

test_function()
