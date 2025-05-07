return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "saghen/blink.cmp",
      "mason-org/mason-lspconfig.nvim",
      -- "hrsh7th/cmp-nvim-lsp",
      "b0o/SchemaStore.nvim",
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
    },
    config = function()
      local servers = require("alst.config.lsp-servers")

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers)
      })

      for server, settings in pairs(servers) do
        vim.lsp.config(server, settings)
        vim.lsp.enable(server)
      end
    end,
  },
  {
    "mhanberg/output-panel.nvim",
    event = "VeryLazy",
    config = function()
      require("output_panel").setup {}
    end
  }
}
