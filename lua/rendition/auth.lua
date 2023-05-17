local mod = {}

mod.run = function()
  local job = vim.fn.jobstart('rendition auth', { on_stdout = vim.print })
end

return mod
