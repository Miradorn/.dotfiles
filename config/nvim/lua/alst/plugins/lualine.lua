return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "folke/trouble.nvim",
      -- {
      --   "stevearc/aerial.nvim",
      --   keys = {
      --     { "<Leader>go", ":AerialToggle right<CR>",  silent = true, desc = "Aerial" },
      --     { "<Leader>gO", ":AerialToggle! right<CR>", silent = true, desc = "Aerial" },
      --   },
      --   cmd = {
      --     "AerialToggle",
      --     "AerialOpen",
      --     "AerialOpenAll",
      --     "AerialClose",
      --     "AerialCloseAll",
      --     "AerialInfo",
      --     "AerialNavToggle",
      --     "AerialNavOpen",
      --     "AerialNavClose",
      --   },
      --   opts = {
      --     layout = {
      --       placement = "edge",
      --       min_width = 45,
      --       default_direction = "right",
      --     },
      --     attach_mode = "global",
      --     update_events = "TextChanged,InsertLeave,WinEnter,WinLeave",
      --     filter_kind = false,
      --   },
      -- },
    },
    opts = function()
      local lsp_names = function()
        local clients = {}

        for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
          clients[#clients + 1] = client.name
        end

        return table.concat(clients, " "), " "
      end

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
              -- "blame",
              "dashboard",
              "help",
              "packer",
              "startify",
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
            { "location", icon = "" },
            "progress",
            "encoding",
            "fileformat",
            { lsp_names, icon = "󰀴" },
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
          lualine_a = { { symbols.get, cond = symbols.has, draw_empty = true } },
          lualine_y = { "diagnostics" },
        },
        inactive_winbar = {
          lualine_b = { { "filename", path = 1 } },
          lualine_y = { "diagnostics" },
        },
        tabline = {},
        extensions = {
          "aerial",
          "fzf",
          "lazy",
          "man",
          "mason",
          "nvim-tree",
          "quickfix",
          "symbols-outline",
          "toggleterm",
          "trouble",
        },
      }
    end,
  },
}
