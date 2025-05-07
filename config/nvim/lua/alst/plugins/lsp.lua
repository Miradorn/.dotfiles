return {
  "neovim/nvim-lspconfig",
  "b0o/SchemaStore.nvim",
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "neovim/nvim-lspconfig", "mason-org/mason.nvim" },
    opts = {
    ensure_installed = {
        "dockerls",
        "cssls",
        "bashls",
        "ts_ls",
        "graphql",
        "gopls",
        "jsonls",
        "lua_ls",
        "html",
        "vimls",
        "erlangls",
        "yamlls",
        "terraformls",
        "marksman",
        "lexical",
      }
    }
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    cmd = "LazyDev",
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim",        words = { "Snacks" } },
        { path = "lazy.nvim",          words = { "LazyVim" } },
      },
    },
  },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    opts = {
      import = { vscode = false }
    }
  },
  {
    "mhanberg/output-panel.nvim",
    event = "VeryLazy",
    config = function()
      require("output_panel").setup {}
    end
  }
}
