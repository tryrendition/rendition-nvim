local mod = {}

local function slice(tbl, s, e)
  if e == nil then
    e = #tbl
  end

  local pos, new = 1, {}

  for i = s, e do
    new[pos] = tbl[i]
    pos = pos + 1
  end

  return new
end

mod.slice = slice

return mod
