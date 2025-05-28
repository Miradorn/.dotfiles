return {
  {
    "gbprod/yanky.nvim",
    dependencies = { "kkharji/sqlite.lua", "folke/snacks.nvim" },
    event = "VeryLazy",

    opts = {
      history_length = 1000,
      storage = "sqlite",

    },
    keys = {
      { "<Leader>ty", function() Snacks.picker.yanky() end, desc = "yank history" },
      { "<A-y>",      function() Snacks.picker.yanky() end, desc = "yank history", mode = { "i" } },
    }
  },
  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {
      foldKeymaps = {
        setup = false, -- modifies `h` and `l`
        hOnlyOpensOnFirstColumn = false,
      },
    },
  },
  {
    "bullets-vim/bullets.vim",
    ft = { "markdown", "text", "gitcommit", "scratch" },
    init = function()
      -- may set any options here
      vim.g.bullets_outline_levels = {}
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = "markdown",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    opts = {
      latex = { enabled = false },
      completions = { lsp = { enabled = true } },
    },
  },
  {
    "OXY2DEV/helpview.nvim",
    lazy = false, -- Recommended
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "mhinz/vim-startify",
    lazy = false,
    init = function()
      -- may set any options here
      vim.g.startify_change_to_dir = 0
    end,
  },
  -- { "wellle/targets.vim",      event = "VeryLazy" },
  -- { "MunifTanjim/nui.nvim", event = "VeryLazy" },
  { "tpope/vim-repeat",          event = "VeryLazy" },
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    init = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },
  -- { "AndrewRadev/splitjoin.vim", event = "VeryLazy" },
  { "elixir-editors/vim-elixir", event = "VeryLazy" },
  -- {
  --   "mbbill/undotree",
  --   event = "VeryLazy",
  --   keys = {
  --     { "<leader>gu", ":UndotreeToggle<CR>", desc = "UndoTree", silent = true },
  --   },
  --   init = function()
  --     vim.g.undotree_SetFocusWhenToggle = 1
  --   end,
  -- },
  {
    "monaqa/dial.nvim",
    keys = {
      { "<C-a>", "<Plug>(dial-increment)" },
      { "<C-x>", "<Plug>(dial-decrement)" },
    },
  },
  {
    "tpope/vim-eunuch",
    event = "VeryLazy",
    cmd = {
      "Remove",
      "Delete",
      "Move",
      "Chmod",
      "Mkdir",
      "SudoWrite",
      "SudoEdit",
    },
  },
  {
    "tpope/vim-sleuth",
    event = "VeryLazy",
  },
  -- {
  --   "ahmedkhalf/project.nvim",
  --   lazy = false,
  --   config = function()
  --     require("project_nvim").setup()
  --   end,
  -- },
  { "tpope/vim-projectionist", lazy = false },
  -- { "kevinhwang91/nvim-bqf",   ft = "qf" },
  -- { "yorickpeterse/nvim-pqf",  ft = "qf",   config = function() require "pqf".setup() end }
}
