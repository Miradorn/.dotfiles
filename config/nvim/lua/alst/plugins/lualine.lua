return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/trouble.nvim",
      "folke/noice.nvim",
    },
    opts = function()
      local function show_macro_recording()
        local recording_register = vim.fn.reg_recording()
        if recording_register == "" then
          return ""
        else
          return "Recording @" .. recording_register
        end
      end

      local symbols = require 'trouble'.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal} >",
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        -- hl_group = "lualine_a_normal",
      })

      return {
        options = {
          globalstatus = true,
          icons_enabled = true,
          theme = 'tokyonight',
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            winbar = {
              "alpha",
              "snacks_terminal",
              "sidekick_terminal",
              -- "blame",
              "dashboard",
              "help",
              "packer",
              "startify",
              "snacks_picker_list"
            },
          },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {
            "mode",
            { "macro-recording", fmt = show_macro_recording }
          },
          lualine_b = { { "filetype", fmt = string.upper } },
          lualine_c = {
            { "filename", path = 1 },
            {
              require("noice").api.status.message.get_hl,
              cond = require("noice").api.status.message.has,
            },
          },
          lualine_x = {
            {
              require("noice").api.status.search.get,
              cond = require("noice").api.status.search.has,
              color = { fg = "#ff9e64" },
            },
            "progress",
            "encoding",
            "fileformat",
            { "lsp_status", icon = "󰀴" },
            {
              function()
                return " "
              end,
              color = function()
                local status = require("sidekick.status").get()
                if status then
                  return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
                end
              end,
              cond = function()
                local status = require("sidekick.status")
                return status.get() ~= nil
              end,
            },
            {
              function()
                local status = require("sidekick.status").cli()
                return " " .. (#status > 1 and #status or "")
              end,
              cond = function()
                return #require("sidekick.status").cli() > 0
              end,
              color = function()
                return "Special"
              end,
            }
          },
          lualine_y = { "b:gitsigns_status" },
          lualine_z = { "branch" },
        },
        -- inactive_sections = {
        --   lualine_a = {},
        --   lualine_b = {},
        --   lualine_c = { "filename" },
        --   lualine_x = { "location" },
        --   lualine_y = {},
        --   lualine_z = {},
        -- },
        winbar = {
          lualine_a = { { symbols.get, draw_empty = true } },
          -- lualine_a = { { symbols.get, cond = symbols.has, draw_empty = true } },
          lualine_y = { { "diagnostics", draw_empty = true } },
        },
        inactive_winbar = {
          lualine_b = { { "filename", path = 1, draw_empty = true } },
          lualine_y = { { "diagnostics", draw_empty = true } },
        },
        tabline = {},
        extensions = {
          -- "aerial",
          -- "fzf",
          "lazy",
          "man",
          "mason",
          -- "nvim-tree",
          "quickfix",
          -- "symbols-outline",
          -- "toggleterm",
          "trouble",
        },
      }
    end,
  },
}
