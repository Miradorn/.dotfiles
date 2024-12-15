return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      terminal = {
        interactive = false,
      },
      input = {
        enabled = false,
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
      { "<leader>tt", function() Snacks.terminal() end,              desc = "ToggleTerm" },
      { "<leader>tm", function() Snacks.notifier.show_history() end, desc = "Show notifier history" },
      -- { "<esc>",      "<C-\\><C-n>",      desc = "Escape terminal insert mode", mode = { "t" } },
    },

  }
}
