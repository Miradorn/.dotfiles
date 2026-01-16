return {
  -- {
  --   "ravitemer/mcphub.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   cmd = { "MCPHub" },
  --   build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  --   opts = {},
  -- },
  {
    "folke/sidekick.nvim",
    opts = {
      nes = {
        enabled = false,
      },
      cli = {
        mux = {
          backend = "zellij",
          enabled = true,
          split = {
            vertical = true, -- vertical or horizontal split
            size = 0.4,      -- size of the split (0-1 for percentage)
          },
        },
        win = {
          split = {
            width = 0.4,
          },
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Example of a keybinding to open Claude directly
      {
        "<leader>cc",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   opts = {
  --     extensions = {
  --       mcphub = {
  --         callback = "mcphub.extensions.codecompanion",
  --         opts = {
  --           make_slash_commands = true,
  --           make_vars = true,
  --           show_result_in_chat = true,
  --         },
  --       },
  --     },
  --     strategies = {
  --       chat = {
  --         adapter = {
  --           name = "anthropic",
  --           model = "claude-sonnet-4-5-20250929",
  --         },
  --       },
  --       cmd = {
  --         adapter = {
  --           name = "anthropic",
  --           model = "claude-sonnet-4-5-20250929",
  --         },
  --       },
  --         adapter = {
  --           name = "anthropic",
  --           model = "claude-sonnet-4-5-20250929",
  --         },
  --     },
  --     memory = {
  --       opts = {
  --         chat = {
  --           enabled = true,
  --         },
  --       },
  --     },
  --   },
  --   cmd = { "CodeCompanionChat", "CodeCompanion", "CodeCompanionCmd", "CodeCompanionActions" },
  --   keys = {
  --     { "<leader>cc", "<CMD>CodeCompanionChat Toggle<CR>", desc = "CodeCompanionChat" },
  --   },
  --   dependencies = {
  --     "ravitemer/mcphub.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "MeanderingProgrammer/render-markdown.nvim",
  --     "echasnovski/mini.diff",
  --   },
  -- },
}
