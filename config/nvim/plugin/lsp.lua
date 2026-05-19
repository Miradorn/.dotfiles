vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/b0o/SchemaStore.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/mhanberg/output-panel.nvim",
})

-- Mason
require("mason").setup()

local mr = require("mason-registry")
for _, tool in ipairs({ "stylua", "shellcheck", "shfmt", "flake8" }) do
  local p = mr.get_package(tool)
  if not p:is_installed() then
    p:install()
  end
end

vim.keymap.set("n", "<leader>mu", "<cmd>Mason<cr>", { desc = "Mason" })

-- Mason-lspconfig
require("mason-lspconfig").setup({
  automatic_enable = {
    exclude = {
      "elixirls",
      "expert",
    },
  },
  ensure_installed = {
    "bashls",
    "cssls",
    "dockerls",
    -- "dexter",
    "erlangls",
    "elixirls",
    "gopls",
    "helm_ls",
    "html",
    "jsonls",
    "expert",
    "lua_ls",
    "marksman",
    "terraformls",
    "ts_ls",
    "vimls",
    "yamlls",
  },
})

vim.lsp.enable("dexter")

-- Lazydev (loaded on lua filetype)
vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    { path = "snacks.nvim",        words = { "Snacks" } },
  },
})

-- Output panel
require("output_panel").setup({})

-- Lightbulb (code action indicator)
vim.pack.add({ "https://github.com/kosayoda/nvim-lightbulb" })
require("nvim-lightbulb").setup({
  autocmd = { enabled = true },
  sign = { text = "💡" },
  filter = function(client_name, result)
    -- return true to KEEP, false to EXCLUDE
    if result.title and result.title:match("Organize aliases") then
      return false
    end
    return true
  end,
})
