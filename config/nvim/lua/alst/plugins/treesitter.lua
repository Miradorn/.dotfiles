return {
  { "nvim-treesitter/playground", event = "BufReadPost" },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "metiulekm/nvim-treesitter-endwise",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallSync",
      "TSInstallInfo",
      "TSUpdate",
      "TSUpdateSync",
      "TSUninstall",
      "TSBufEnable",
      "TSBufDisable",
      "TSBufToggle",
      "TSEnable",
      "TSDisable",
      "TSToggle",
      "TSModuleInfo",
      "TSEditQuery",
      "TSEditQueryUserAfter",
    },
    keys = {
      { "<A-v>", desc = "Start TS Selection" },
      { "<v>",   desc = "Increment Selection Node",  mode = "x" },
      { "<gv>",  desc = "Increment Selection Scope", mode = "x" },
      { "<V>",   desc = "Schrink selection",         mode = "x" },
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "css",
        "dockerfile",
        "eex",
        "elixir",
        "elm",
        "erlang",
        "go",
        "gomod",
        "graphql",
        "hcl",
        "heex",
        "helm",
        -- "help",
        "hjson",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "rust",
        "scss",
        "svelte",
        "terraform",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<A-v>",
          node_incremental = "v",
          scope_incremental = "gv",
          node_decremental = "V",
        },
      },
      matchup = { enable = true },
      endwise = { enable = true },
      -- textobjects = {
      --   select = {
      --     enable = true,
      --
      --     -- Automatically jump forward to textobj, similar to targets.vim
      --     lookahead = true,
      --
      --     keymaps = {
      --       ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
      --       ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },
      --
      --       ["ae"] = { query = "@block.outer", desc = "Select outer part of scope" },
      --       ["ie"] = { query = "@block.inner", desc = "Select inner part of scope" },
      --
      --       ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
      --       ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
      --
      --       ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
      --       ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
      --
      --       ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
      --       ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
      --     },
      --   },
      -- },
    },
    config = function(plugin, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   opts = {
  --     mode = "topline"
  --   },
  --   event = { "BufReadPost", "BufNewFile" },
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   event = { "BufReadPost", "BufNewFile" },
  -- },
}
