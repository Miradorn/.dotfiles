-- elixir-tools.nvim purely for its vim-projectionist projections.
-- elixirls/nextls/credo MUST be set false explicitly: elixirls defaults to
-- enabled when the key is omitted. vim-projectionist comes from plugin/tools.lua.
-- Filetype detection for .ex/.exs/.eex/.leex/.heex is handled by nvim 0.12 core.
vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/elixir-tools/elixir-tools.nvim',
})

require("elixir").setup({
  nextls = { enable = false },
  elixirls = { enable = false },
  credo = { enable = false },
  projectionist = { enable = true },
})
