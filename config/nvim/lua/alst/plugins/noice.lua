return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- dependencies = {
    --   "MunifTanjim/nui.nvim",
    -- },
    config = function()
      require("noice").setup {
        routes = {
          {
            filter = {
              event = 'msg_show',
              kind = 'emsg',
              find = 'Pattern not found:',
            },
            opts = { skip = true },
          },
        },
        views = {
          cmdline_popup = {
            position = {
              row = "15"
            },
          },
          cmdline_popupmenu = {
            position = {
              row = "18"
            },
          },
          mini = {
            position = {
              row = 3,
            },
            border = {
              style = "double",
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
          },
        },
        presets = {
          command_palette = true,
          long_message_to_split = true,
          lsp_doc_border = true,
        },
        --[[
        markdown = {
        hover = {
        ["|(%S-)|"] = vim.cmd.help, -- vim help links
        ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
        },
        highlights = {
        ["|%S-|"] = "@text.reference",
        ["@%S+"] = "@parameter",
        ["^%s*(Parameters:)"] = "@text.title",
        ["^%s*(Return:)"] = "@text.title",
        ["^%s*(See also:)"] = "@text.title",
        ["{%S-}"] = "@parameter",
        },
        } ]]
        --
      }
      require 'telescope'.load_extension("noice")
    end,
    -- stylua: ignore
    keys = {
      { "<leader>snl", function() require("noice").cmd("last") end,    desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end,     desc = "Noice All" },
      {
        "<c-f>",
        function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
        silent = true,
        expr = true,
        desc = "Scroll forward"
      },
      {
        "<c-b>",
        function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
        silent = true,
        expr = true,
        desc = "Scroll backward"
      },
    },
  },
}
