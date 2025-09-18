return {
  -- {
  --   "nvim-mini/mini.starter",
  --   lazy = false,
  --   config = function()
  --     local header_art = [[
  --                                         __
  --            ___     ___    ___   __  __ /\_\    ___ ___
  --           / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\
  --          /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \
  --          \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
  --           \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/
  --     ]]
  --
  --     local starter = require('mini.starter')
  --     starter.setup({
  --       header = header_art,
  --       evaluate_single = true,
  --       items = {
  --         starter.sections.builtin_actions(),
  --         starter.sections.recent_files(10, true),
  --         starter.sections.recent_files(10, false),
  --         -- starter.sections.telescope(),
  --       },
  --       content_hooks = {
  --         -- starter.gen_hook.adding_bullet(),
  --         starter.gen_hook.indexing('all', { 'Builtin actions' }),
  --         -- starter.gen_hook.padding(3, 2),
  --         starter.gen_hook.aligning('center', 'center'),
  --       },
  --     })
  --   end,
  -- },
  {
    'nvim-mini/mini.ai',
    event = "VeryLazy",
    config = true,
  },
  {
    "nvim-mini/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },
  {
    "nvim-mini/mini.tabline",
    event = "VeryLazy",
    config = true,
    dependencies = { "nvim-mini/mini.icons" },
  },
  {
    "nvim-mini/mini.surround",
    keys = function(plugin, keys)
      -- Populate the keys based on the user's options
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add,     desc = "Add surrounding",    mode = { "n", "v" } },
        { opts.mappings.delete,  desc = "Delete surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
      }
      ---@diagnostic disable-next-line: missing-parameter
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "ys",
        delete = "ds",
        replace = "cs",
      },
      search_method = "cover_or_next",
    },
  },

  {
    "nvim-mini/mini.pairs",
    event = "VeryLazy",
    config = true,
  },
  {
    "nvim-mini/mini.icons",
    event = "VeryLazy",
    config = function()
      require("mini.icons").setup {}

      MiniIcons.mock_nvim_web_devicons()
    end,
  },
  -- {
  --   "nvim-mini/mini.animate",
  --   event = "VeryLazy",
  --   config = function(_, _)
  --     require("mini.animate").setup({
  --       draw = {
  --         animation = require('mini.indentscope').gen_animation.none()
  --       }
  --     })
  --   end,
  -- },

  {
    "nvim-mini/mini.comment",
    event = "VeryLazy",
    opts = true
  },
  {
    "nvim-mini/mini.cursorword",
    event = "VeryLazy",
    config = true,
  },
  {
    "nvim-mini/mini.splitjoin",
    event = "VeryLazy",
    config = true,
  },
  {
    "nvim-mini/mini.bracketed",
    event = "VeryLazy",
    opts = {
      window = { suffix = "" },
    },
  },
  {
    {
      "nvim-mini/mini.indentscope",
      version = false, -- wait till new 0.7.0 release to put it back on semver
      event = "BufReadPre",
      opts = function()
        return {
          symbol = "│",
          draw = {
            animation = require("mini.indentscope").gen_animation.none(),
          },
          options = {
            try_as_border = true,
          },
        }
      end,
      config = function(_, opts)
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
          callback = function()
            vim.b.miniindentscope_disable = true
          end,
        })
        require("mini.indentscope").setup(opts)
      end,
    },
  },
}
