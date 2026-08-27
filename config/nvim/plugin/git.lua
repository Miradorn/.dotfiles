vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/dlyongemallo/diffview-plus.nvim'
  -- { src = 'https://github.com/Miradorn/blame.nvim', version = 'fix/nested-repo-cwd' },
})

-- Gitsigns
require("gitsigns").setup()

local map = vim.keymap.set
map("n", "<leader>gg", function()
  require('gitsigns').blame_line({ full = true }, function()
    require('gitsigns').blame_line { full = true }
  end)
end, { desc = "Blame line", silent = true })
map("n", "<leader>gtl", function() require('gitsigns').toggle_current_line_blame() end, { desc = "Toggle inline blame", silent = true })
map("n", "<leader>W", function() require('gitsigns').stage_buffer() end, { desc = "Git write", silent = true })

-- Blame
-- require("blame").setup()
map("n", "<leader>gb", function() require('gitsigns').blame() end, { desc = "Blame", silent = true })
map("n", "<leader>gbb", function() require('gitsigns').blame() end, { desc = "Blame", silent = true })

-- Diffview
require("diffview").setup({
  enhanced_diff_hl = true,
  diffopt = { algorithm = "histogram" },
  view = {
    default = {
      layout = "diff2_horizontal",
      winbar_info = true,
    },
    merge_tool = {
      layout = "diff3_mixed",
      winbar_info = true,
    },
  },
})

map("n", "<leader>do", function() require("diffview").toggle() end, { desc = "DiffView toggle" })
