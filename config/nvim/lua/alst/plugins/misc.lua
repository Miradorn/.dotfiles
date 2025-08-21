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
      autoFold = {
        enabled = false
      },
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
    lazy = false,
    opts = {
      -- may set any options here
      treesitter = {
        -- enabled = false,
        disabled = { "elixir", "eex" },
        include_match_words = true
      },
      matchparen_offscreen = {},
    }
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
    config = function()
      local augend = require("dial.augend")

      require("dial.config").augends:register_group {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.date.alias["%Y-%m-%d"],
          augend.date.alias["%m/%d"],
          augend.date.alias["%H:%M"],
          augend.constant.alias.bool,
          augend.semver.alias.semver
        },
      }
    end,
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
  {
    "qvalentin/helm-ls.nvim",
    ft = "helm",
    opts = {
      conceal_templates = {
        -- enable the replacement of templates with virtual text of their current values
        enabled = false, -- this might change to false in the future
      },
      indent_hints = {
        -- enable hints for indent and nindent functions
        enabled = false,
        -- show the hints only for the line the cursor is on
        only_for_current_line = false,
      },
    },
  },
  {
    "swaits/zellij-nav.nvim",
    event = "VeryLazy", -- Lazy load plugin for improved startup times
    keys = {
      {
        "<C-h>",
        function()
          require("zellij-nav").left()
        end,
        desc = "Move one split left",
      },
      {
        "<C-k>",
        function()
          require("zellij-nav").up()
        end,
        desc = "Move one split up",
      },
      {
        "<C-l>",
        function()
          require("zellij-nav").right()
        end,
        desc = "Move one split right",
      },
      {
        "<C-j>",
        function()
          require("zellij-nav").down()
        end,
        desc = "Move one split down",
      },

    },
  }
}
