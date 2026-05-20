vim.api.nvim_create_user_command("Gbrowse", function()
  Snacks.gitbrowse()
end, { desc = "Open current git file in browser" })

vim.api.nvim_create_user_command("Gblame", "BlameToggle", { desc = "Show blame information" })

-- Capitalised aliases for nvim 0.12's built-in :lsp subcommands. nvim-lspconfig
-- stopped defining these on 0.12; we keep the names for muscle memory.
local function complete_active_clients(arg_lead)
  return vim.tbl_filter(function(n) return n:sub(1, #arg_lead) == arg_lead end,
    vim.tbl_map(function(c) return c.name end, vim.lsp.get_clients()))
end

local function complete_configured(arg_lead)
  return vim.tbl_map(function(path)
    return vim.fn.fnamemodify(path, ":t:r")
  end, vim.api.nvim_get_runtime_file(("lsp/%s*.lua"):format(arg_lead), true))
end

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp",
  { desc = "LSP status (via checkhealth)" })

vim.api.nvim_create_user_command("LspStart", function(opts)
  vim.cmd("lsp enable " .. opts.args)
end, { nargs = "*", complete = complete_configured, desc = "Enable LSP server" })

vim.api.nvim_create_user_command("LspStop", function(opts)
  vim.cmd("lsp stop " .. opts.args)
end, { nargs = "*", complete = complete_active_clients, desc = "Stop LSP server" })

vim.api.nvim_create_user_command("LspRestart", function(opts)
  vim.cmd("lsp restart " .. opts.args)
end, { nargs = "*", complete = complete_active_clients, desc = "Restart LSP server" })

vim.api.nvim_create_user_command("Ag", function(opts)
  local text = opts.fargs and opts.fargs[1] or nil
  Snacks.picker.grep({ search = text, live = false })
end, { nargs = "?", desc = "Search string" })
