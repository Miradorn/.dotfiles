return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = true,
    keys = {
      {
        "<leader>gg",
        function()
          require 'gitsigns'.blame_line({ full = true }, function()
            require 'gitsigns'.blame_line { full = true }
          end)
        end,
        desc = "Blame line",
        silent = true
      },
      {
        "<leader>gtl",
        function()
          require 'gitsigns'.toggle_current_line_blame()
        end,
        desc = "Toggle inline blame",
        silent = true
      },
      {
        "<leader>W",
        function()
          require 'gitsigns'.stage_buffer()
        end,
        desc = "Git write",
        silent = true,
      },
    }
  },
  -- {
  --   "tpope/vim-fugitive",
  --   dependencies = {
  --     "tpope/vim-rhubarb",
  --     "shumphrey/fugitive-gitlab.vim",
  --   },
  --   cmd = { "G", "Git", "GBrowse" },
  --   keys = {
  --     { "<leader>W", ":silent Gwrite<Cr>", desc = "Git write", silent = true },
  --   }
  -- },
  {
    "FabijanZulj/blame.nvim",
    config = true,
    cmd = { "BlameToggle" },
    keys = {
      { "<leader>gb", "<cmd>BlameToggle<cr>", desc = "Blame", silent = true }
    }
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>",  mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = "diff2_vertical",
          winbar_info = true
        },
        merge_tool = {
          layout = "diff3_mixed",
          winbar_info = true
        }
      }
    },
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory"
    },
    keys = {
      { "<leader>do", function() require("diffview").open() end,  desc = "DiffView Open" },
      { "<leader>dq", function() require("diffview").close() end, desc = "DiffView Quit" },
    }
  },
}
