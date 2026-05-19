vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/sindrets/diffview.nvim',
  { src = 'https://github.com/Miradorn/blame.nvim', version = 'fix/nested-repo-cwd' },
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
require("blame").setup()
map("n", "<leader>gb", "<cmd>BlameToggle<cr>", { desc = "Blame", silent = true })
map("n", "<leader>gbb", "<cmd>BlameToggle<cr>", { desc = "Blame", silent = true })

-- Diffview
require("diffview").setup({
  enhanced_diff_hl = true,
  view = {
    default = {
      layout = "diff2_vertical",
      winbar_info = true,
    },
    merge_tool = {
      layout = "diff3_mixed",
      winbar_info = true,
    },
  },
})

map("n", "<leader>do", function() require("diffview").open() end, { desc = "DiffView Open" })
map("n", "<leader>dq", function() require("diffview").close() end, { desc = "DiffView Quit" })
