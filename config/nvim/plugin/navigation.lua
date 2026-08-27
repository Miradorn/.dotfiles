vim.pack.add({
  'https://github.com/mrjones2014/smart-splits.nvim',
  -- 'https://github.com/swaits/zellij-nav.nvim',
  'https://codeberg.org/andyg/leap.nvim',
})

-- Smart-splits keymaps
local map = vim.keymap.set
local ss = require("smart-splits")

map("n", "<A-h>", function() ss.resize_left() end, { desc = "Resize split left" })
map("n", "<A-k>", function() ss.resize_up() end, { desc = "Resize split up" })
map("n", "<A-l>", function() ss.resize_right() end, { desc = "Resize split right" })
map("n", "<A-j>", function() ss.resize_down() end, { desc = "Resize split down" })
map("n", "<A-H>", function() ss.swap_buf_left() end, { desc = "Move split left" })
map("n", "<A-K>", function() ss.swap_buf_up() end, { desc = "Move split up" })
map("n", "<A-L>", function() ss.swap_buf_right() end, { desc = "Move split right" })
map("n", "<A-J>", function() ss.swap_buf_down() end, { desc = "Move split down" })

-- Zellij-nav keymaps
map("n", "<C-h>", function() ss.move_cursor_left() end, { desc = "Move one split left" })
map("n", "<C-k>", function() ss.move_cursor_up() end, { desc = "Move one split up" })
map("n", "<C-l>", function() ss.move_cursor_right() end, { desc = "Move one split right" })
map("n", "<C-j>", function() ss.move_cursor_down() end, { desc = "Move one split down" })

-- Leap
map({ "n", "x", "o" }, "z", "<Plug>(leap-forward-till)", { desc = "Leap forward" })
map({ "n", "x", "o" }, "Z", "<Plug>(leap-backward-till)", { desc = "Leap backward" })
