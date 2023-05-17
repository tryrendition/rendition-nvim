-- function executeShellCommand()
--   -- Run the shell command "rendition get-tailwind <name> <documentId> [nodeId]
--
--   local renditionName = argv[1]
--   local documentId = argv[2]
--   local nodeId = argv[3]
--   local rendition = io.popen('rendition get-tailwind' .. name .. ' ' .. documentId .. ' ' .. nodeId)
--   if rendition == nil then
--     print('Rendition not found')
--   else
--     print(rendition)
--   end
-- end

local M = {}

-- main module file

local M = {}
M.config = {}

-- setup is the public method to setup your plugin
M.setup = function(args)
  M.config = vim.tbl_deep_extend('force', M.config, args or {})
end

M.core = function()
  vim.api.nvim_echo({ 'Hello World!' }, false)
end

return M
