_G.dd = function(...)
  Snacks.debug.inspect(...)
end
_G.bt = function()
  Snacks.debug.backtrace()
end
vim.print = _G.dd

require("alst.config.options")
-- require("alst.config.lsp")

-- Load snacks early so Snacks.keymap.set is available for keymaps
vim.pack.add({ 'https://github.com/folke/snacks.nvim' })
_G.Snacks = require("snacks")

require("alst.config.keymaps")
require("alst.config.commands")
require("alst.config.autocmds")

-- Load SchemaStore early so exrc/.nvim.lua files can use it
vim.pack.add({ 'https://github.com/b0o/SchemaStore.nvim' })

-- Load treesitter early so highlight config is set before plugin/ FileType autocmds fire
vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  'https://github.com/MeanderingProgrammer/treesitter-modules.nvim',
})
require("treesitter-modules").setup({
  ensure_installed = {
    "bash", "c", "cmake", "comment", "css", "dockerfile",
    "eex", "elixir", "elm", "erlang", "go", "gomod", "graphql",
    "hcl", "heex", "helm", "hjson", "html", "java", "javascript",
    "jsdoc", "json", "json5", "kitty", "lua", "make", "markdown",
    "markdown_inline", "python", "query", "regex", "ruby", "rust",
    "scss", "svelte", "terraform", "tmux", "toml", "tsx",
    "typescript", "vim", "vimdoc", "vue", "yaml",
  },
  fold = { enable = true },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<A-v>",
      node_incremental = "v",
      scope_incremental = "gv",
      node_decremental = "V",
    },
  },
})
