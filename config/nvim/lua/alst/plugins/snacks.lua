return {
  {
    "folke/snacks.nvim",
    dependencies = {
      "folke/trouble.nvim",
    },
    priority = 1000,
    lazy = false,
    opts = {
      explorer = {
        replace_netrw = true, -- Replace netrw with the snacks explorer
      },
      bigfile = { enabled = true },
      image = { enabled = true },
      picker = {
        enabled = true,
        layout = "telescope",
        matcher = {
          frecency = true
        },
        formatters = {
          file = {
            filename_first = true, -- display filename before the file path
            truncate = 200,        -- truncate the file path to (roughly) this length

          },
        },
        auto_confirm = false,
        ui_select = true,
        actions = require("trouble.sources.snacks").actions,
        sources = {
          explorer = {
            layout = { preset = "default", preview = false },
            auto_close = true,
            jump = { close = true }
          }
        },
        win = {
          input = {
            keys = {
              ["<c-a>"] = "<c-a>",
              ["<c-b>"] = "<c-b>",
              ["<c-f>"] = "<c-f>",
              ["<c-d>"] = { "preview_scroll_down", mode = { "n", "i" }, },
              ["<c-u>"] = { "preview_scroll_up", mode = { "n", "i" }, },
              ["<c-t>"] = { "trouble_open", mode = { "n", "i" }, },
            },
          },
        },
      },
      terminal = {
        interactive = false,
      },
      input = {
        enabled = true,
      },
      statuscolumn = {
        enabled = true,
        left = { "mark", "sign" }, -- priority of signs on the left (high to low)
        right = { "fold", "git" }, -- priority of signs on the right (high to low)
        folds = {
open = true,             -- show open fold icons
          git_hl = true,           -- use Git Signs hl for fold icons
        },
        git = {
          -- patterns to match Git signs
          patterns = { "GitSign", "MiniDiffSign" },
        },
        refresh = 50, -- refresh at most every 50ms
      },
      notifier = { enabled = true }
    },
    keys = {
      { "<leader>tt",  function() Snacks.terminal() end,                        desc = "ToggleTerm" },
      { "<leader>tm",  function() Snacks.picker.notifications() end,            desc = "Show notification history" },
      { "<leader>ss",  function() Snacks.picker() end,                          desc = "Snacks pickers" },
      { "<C-p>",       function() Snacks.picker.files { follow = true } end,    desc = "Show File Picker" },
      { "<Leader>td",  function() Snacks.picker.diagnostics() end,              desc = "Diagnostics picker" },
      { "<Leader>bf",  function() Snacks.picker.buffers() end,                  desc = "Buffer picker" },
      { "<Leader>gc",  function() Snacks.picker.git_log() end,                  desc = "Git Commits picker" },
      { "<Leader>gbr", function() Snacks.picker.git_branches() end,             desc = "Git Commits picker" },
      { "<Leader>gbc", function() Snacks.picker.git_log_file() end,             desc = "Git Buffer Commits picker" },
      { "<Leader>gs",  function() Snacks.picker.git_status() end,               desc = "Git status picker" },
      { "<Leader>ty",  function() Snacks.picker.registers() end,                desc = "Registers" },
      { "<Leader>tk",  function() Snacks.picker.keymaps() end,                  desc = "Keymap picker" },
      { "<C-f>",       function() Snacks.picker.grep { live = false } end,      desc = "Live Grep picker" },
      { "<leader>tg",  function() Snacks.picker.grep { live = false } end,      desc = "Live Grep picker" },
      { "<leader>*",   function() Snacks.picker.grep_word { live = false } end, desc = "Grep word under cursor",   mode = { "n", "v" } },
      { "<leader>gu",  function() Snacks.picker.undo() end,                     desc = "Grep word under cursor",   mode = { "n", "v" } },
      { "<leader>n",   function() Snacks.explorer() end,                        desc = "explorer" },
      { "<leader>N",   function() Snacks.explorer.reveal() end,                 desc = "reveal in explorer" },
      {
        "<leader>evv",
        function()
          Snacks.picker.files { cwd = "~/.dotfiles/config/nvim/", follow = true }
        end,
        desc = "Neovim config picker",
      },
      -- { "<esc>",      "<C-\\><C-n>",      desc = "Escape terminal insert mode", mode = { "t" } },
    },
  }
}
