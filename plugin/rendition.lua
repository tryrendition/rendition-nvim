local util = require('rendition.util')

local completion_store = {
  [''] = { 'auth', 'get-tailwind', 'init' },
}

local command_to_module_map = {
  auth = 'auth',
  ['get-tailwind'] = 'getTailwind',
  init = 'initRendition',
}

vim.api.nvim_create_user_command('Rendition', function(opts)
  local params = vim.split(opts.args, '%s+', { trimempty = true })

  local mod_name, action_name = params[1], params[2]
  local arguments = util.slice(params, 3)

  local mod = require('rendition.command')
  local command = command_to_module_map[mod_name]

  if not command or not mod[command] then
    print('[Rendition] Command not found...')
    return
  end

  mod[command]({
    args = params,
    force = opts.bang,
  })
end, {
  bang = true,
  nargs = '?',
  complete = function(_, cmd_line)
    local has_space = string.match(cmd_line, '%s$')
    local params = vim.split(cmd_line, '%s+', { trimempty = true })

    if #params == 1 then
      return completion_store['']
    elseif #params == 2 and not has_space then
      return vim.tbl_filter(function(cmd)
        return not not string.find(cmd, '^' .. params[2])
      end, completion_store[''])
    end

    if #params >= 2 and completion_store[params[2]] then
      if #params == 2 then
        return completion_store[params[2]]
      elseif #params == 3 and not has_space then
        return vim.tbl_filter(function(cmd)
          return not not string.find(cmd, '^' .. params[3])
        end, completion_store[params[2]])
      end
    end
  end,
})
