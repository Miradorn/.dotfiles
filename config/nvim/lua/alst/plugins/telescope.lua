return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "folke/trouble.nvim",
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
      -- { "nvim-telescope/telescope-frecency.nvim" },
      { "dinocosta/telescope-phx-routes.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "debugloop/telescope-undo.nvim",

      {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
          { "kkharji/sqlite.lua" },
        },
        event = "VeryLazy",
        keys = {
          {
            "<Leader>ty",
            function()
              require("telescope").extensions.neoclip.default()
            end,
            desc = "Telescope neoclip",
          },
          {
            "<C-y>",
            function()
              require("telescope").extensions.neoclip.default()
            end,
            desc = "Telescope neoclip",
            mode = { "i", "v" },
          },
        },
        opts = {
          keys = {
            telescope = {
              i = {
                select = "<S-cr>",
                paste = "<cr>",
                paste_behind = "<c-k>",
                replay = "<c-q>", -- replay a macro
                delete = "<c-d>", -- delete an entry
                edit = "<c-e>",   -- edit an entry
                custom = {},
              },
            },
          },
        },
      },
    },
    cmd = { "Telescope" },
    keys = {
      {
        "<leader>evv",
        function()
          require("telescope.builtin").find_files({ search_dirs = { "~/.dotfiles/config/nvim/" } })
        end,
        desc = "Neovim config picker",
      },
      {
        "<C-p>",
        function()
          require("telescope.builtin").find_files({ hidden = false, no_ignore = false })
          -- require("telescope").extensions.frecency.frecency()
        end,
        desc = "Telescope files",
      },
      {
        "<C-A-p>",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Telescope all files",
      },
      {
        "<Leader>td",
        function()
          require("telescope.builtin").diagnostics()
        end,
        desc = "Telescope diagnostic",
      },
      {
        "<Leader>bf",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Telescope buffers",
      },
      {
        "<Leader>gc",
        function()
          require("telescope.builtin").git_commits()
        end,
        desc = "Telescope git_commits",
      },
      {
        "<Leader>gbc",
        function()
          require("telescope.builtin").git_bcommits()
        end,
        desc = "Telescope git_bcommits",
      },
      {
        "<Leader>gbr",
        function()
          require("telescope.builtin").git_branches()
        end,
        desc = "Telescope git_branches",
      },
      {
        "<Leader>gs",
        function()
          require("telescope.builtin").git_status()
        end,
        desc = "Telescope git_branches",
      },
      {
        "<Leader>tr",
        function()
          require("telescope").extensions["phx-routes"].routes()
        end,
        desc = "Telescope phoenix routes",
      },
      {
        "<Leader>tm",
        function()
          require("telescope").extensions.notify.notify()
        end,
        desc = "Telescope notify",
      },
      {
        "<Leader>tk",
        function()
          require("telescope.builtin").keymaps()
        end,
        desc = "Telescope keymaps",
      },
      {
        "<Leader>tb",
        function()
          require("telescope.builtin").builtin()
        end,
        desc = "Telescope builitns",
      },
      {
        "<C-f>",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Find text",
      },
      {
        "<leader>tg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Find text",
      },
      {
        "<Leader>*",
        function()
          require("telescope.builtin").grep_string()
        end,
        desc = "Find word under cursor",
        mode = { "n", "v" },
      },
      {
        "<Leader>ty",
        function()
          require("telescope").extensions.neoclip.default()
        end,
        desc = "Telescope neoclip",
      },
      {
        "<C-y>",
        function()
          require("telescope").extensions.neoclip.default()
        end,
        desc = "Telescope neoclip",
      },

      {
        "<leader>gu",
        function()
          require("telescope").extensions.undo.undo()
        end,
        desc = "UndoTree",
      },
    },

    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local open_with_trouble = require("trouble.sources.telescope").open


      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-t>"] = open_with_trouble,
            },
            n = {
              ["<C-c>"] = actions.close,
              ["<C-q>"] = open_with_trouble,
              ["<C-t>"] = open_with_trouble,
            },
          },
          path_display = {
            filename_first = {
              reverse_directories = false
            }
          },
        },
        pickers = {
          -- Your special builtin config goes in here
          file_browser = { no_ignore = true, hidden = true },
          find_files = { no_ignore = true, hidden = true },
        },
        extensions = {
          -- frecency = {
          --   default_workspace = "CWD",
          -- },
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })

      telescope.load_extension("fzf")
      -- telescope.load_extension("frecency")
      telescope.load_extension("media_files")
      telescope.load_extension("notify")
      telescope.load_extension("noice")
      telescope.load_extension("phx-routes")
      telescope.load_extension("undo")


      -- telescope.load_extension("smart_open")
      -- telescope.load_extension("dash")
    end,
  },
}
