-- Generated Gold translation mod.
local function applyModule(mod, path)
  local body = mod:read(path)
  assert(body, "Missing required mod module: " .. path)
  local chunk, err = loadstring(body, "@" .. path)
  assert(chunk, err)
  local apply = chunk()
  assert(type(apply) == "function", path .. " must return function(mod)")
  apply(mod)
end
return function(mod)
  applyModule(mod, "text.lua")
  applyModule(mod, "graphics.lua")
end
