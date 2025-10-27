return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "MCPHub" },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    opts = {},
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_slash_commands = true,
            make_vars = true,
            show_result_in_chat = true,
          },
        },
      },
      strategies = {
        chat = {
          adapter = {
            name = "anthropic",
            model = "claude-sonnet-4-5-20250929",
          },
        },
        cmd = {
          adapter = {
            name = "anthropic",
            model = "claude-sonnet-4-5-20250929",
          },
        },
          adapter = {
            name = "anthropic",
            model = "claude-sonnet-4-5-20250929",
          },
      },
      memory = {
        opts = {
          chat = {
            enabled = true,
          },
        },
      },
    },
    cmd = { "CodeCompanionChat", "CodeCompanion", "CodeCompanionCmd", "CodeCompanionActions" },
    keys = {
      { "<leader>cc", "<CMD>CodeCompanionChat Toggle<CR>", desc = "CodeCompanionChat" },
    },
    dependencies = {
      "ravitemer/mcphub.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "MeanderingProgrammer/render-markdown.nvim",
      "echasnovski/mini.diff",
    },
  },
}
