local mod = {}

mod.run = function()
  vim.api.nvim_echo({ 'Hello World!' }, false)
end

return mod
