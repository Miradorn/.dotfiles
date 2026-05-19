vim.api.nvim_create_user_command("Gbrowse", function()
  Snacks.gitbrowse()
end, { desc = "Open current git file in browser" })

vim.api.nvim_create_user_command("Gblame", "BlameToggle", { desc = "Show blame information" })

vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("checkhealth vim.lsp")
end, { desc = "LSP status (via checkhealth)" })

vim.api.nvim_create_user_command("LspStart", function(opts)
  vim.cmd("Lsp start " .. (opts.args or ""))
end, { nargs = "?", desc = "Start LSP server" })

vim.api.nvim_create_user_command("LspStop", function(opts)
  vim.cmd("Lsp stop " .. (opts.args or ""))
end, { nargs = "?", desc = "Stop LSP server" })

vim.api.nvim_create_user_command("LspRestart", function(opts)
  vim.cmd("Lsp restart " .. (opts.args or ""))
end, { nargs = "?", desc = "Restart LSP server" })

vim.api.nvim_create_user_command("Ag", function(opts)
  local text = opts.fargs and opts.fargs[1] or nil
  Snacks.picker.grep({ search = text, live = false })
end, { nargs = "?", desc = "Search string" })
