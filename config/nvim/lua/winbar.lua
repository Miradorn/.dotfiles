local M = {}

local aerial
import('aerial', function(a) aerial = a end)
assert(aerial)

-- Format the list representing the symbol path
-- Grab it from https://github.com/stevearc/aerial.nvim/blob/master/lua/lualine/components/aerial.lua
local function format_symbols(symbols, depth, separator)
  local parts = {}
  depth = depth or #symbols

  if depth > 0 then
    symbols = { unpack(symbols, 1, depth) }
  else
    symbols = { unpack(symbols, #symbols + 1 + depth) }
  end

  for _, symbol in ipairs(symbols) do
    table.insert(parts, string.format("%s %s", symbol.icon, string.gsub(symbol.name, "%%", "%%%%")))
  end

  return table.concat(parts, separator)
end

M.winbar = function()
  if vim.tbl_contains({ 'alpha', 'startify', 'NvimTree', 'aerial', 'toggleterm', 'qf', 'packer', 'help', 'dashboard', 'Trouble' }, vim.bo.filetype) then
    return ''
  end
  -- Get a list representing the symbol path by aerial.get_location (see
  -- https://github.com/stevearc/aerial.nvim/blob/master/lua/aerial/init.lua#L127),
  -- and format the list to get the symbol path.
  -- Grab it from
  -- https://github.com/stevearc/aerial.nvim/blob/master/lua/lualine/components/aerial.lua#L89
  local symbols = aerial.get_location(false)
  local symbol_path = format_symbols(symbols, nil, ' > ')

  return (symbol_path == "" and "..." or symbol_path)
end

vim.o.winbar = "%{%v:lua.require('winbar').winbar()%}"
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

return M
