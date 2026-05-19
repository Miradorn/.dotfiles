-- treesitter + treesitter-modules are loaded and configured in lua/alst/config.lua
-- (must run in init.lua before plugin/ FileType autocmds fire)

vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
  'https://github.com/RRethy/nvim-treesitter-endwise',
})

---@module "nvim-treesitter-textobjects"
require("nvim-treesitter-textobjects").setup()

local map = vim.keymap.set
local ts_select = require("nvim-treesitter-textobjects.select")
map({ "x", "o" }, "af", function() ts_select.select_textobject("@function.outer", "textobjects") end, { desc = "Select outer function" })
map({ "x", "o" }, "if", function() ts_select.select_textobject("@function.inner", "textobjects") end, { desc = "Select inner function" })
map({ "x", "o" }, "ac", function() ts_select.select_textobject("@class.outer", "textobjects") end, { desc = "Select outer class" })
map({ "x", "o" }, "ic", function() ts_select.select_textobject("@class.inner", "textobjects") end, { desc = "Select inner class" })
map({ "x", "o" }, "as", function() ts_select.select_textobject("@local.scope", "locals") end, { desc = "Select local scope" })
