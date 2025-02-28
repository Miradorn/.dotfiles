return {
  {
    "AckslD/nvim-neoclip.lua",
    lazy = false,
    dependencies = {
      { "kkharji/sqlite.lua" },
    },
    config = true
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
    opts = { latex = { enabled = false } },
  },
  {
    "OXY2DEV/helpview.nvim",
    lazy = false, -- Recommended
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  { "mhinz/vim-startify", lazy = false },
  -- { "wellle/targets.vim",      event = "VeryLazy" },
  -- { "MunifTanjim/nui.nvim", event = "VeryLazy" },
  { "tpope/vim-repeat",   event = "VeryLazy" },
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
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("project_nvim").setup()
    end,
  },
  { "tpope/vim-projectionist",   lazy = false },
  -- { "kevinhwang91/nvim-bqf",   ft = "qf" },
  -- { "yorickpeterse/nvim-pqf",  ft = "qf",   config = function() require "pqf".setup() end }
}
