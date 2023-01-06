--
-- Helpers
--
local map = vim.keymap.set

local silent = { silent = true }

-- local config_dir = vim.fn.expand("$XDG_CONFIG_HOME")

-- movement
-- move by screen line
map("n", "j", "gj")
map("n", "k", "gk")

-- commandline/insert mode emacs movement
map({ "i", "c" }, "<C-b>", "<left>")
map({ "i", "c" }, "<C-f>", "<right>")
map({ "i", "c" }, "<C-e>", "<End>")
map({ "i", "c" }, "<C-a>", "<Home>")
map({ "i", "c" }, "<C-p>", "<up>")
map({ "i", "c" }, "<C-n>", "<down>")
map({ "i", "c" }, "<A-b>", "<S-Left>")
map({ "i", "c" }, "<A-f>", "<S-Right>")

-- file modification

map("n", "<Leader>w", ":w<CR>", silent)
map("n", "<Leader>W", ":Gwrite<CR>", silent)
map("n", "<Leader>q", ":q<CR>", silent)
map("n", "<Leader>Q", ":q!<CR>", silent)
map("n", "<Leader>e", ":e<CR>", silent)
map("n", "<Leader>E", ":e!<CR>", silent)

-- nvimTree Explorer

map("n", "<Leader>n", ":NvimTreeToggle<CR>", silent)
map("n", "<Leader>N", ":NvimTreeFindFile<CR>", silent)

-- undotree
map("n", "<Leader>gu", ":UndotreeToggle<CR>", silent)

-- Vim Command Line


-- terminal
map("t", "<ESC>", "<C-\\><C-n>")
-- map("t", "<C-c>", "<C-\\><C-n>")

map("n", "<Leader>tt", ":ToggleTerm<CR>", silent)

-- Tests
-- map("n", "<Leader>tf", function () require"neotest".run.run(vim.fn.expand("%")) end, silent)
-- map("n", "<Leader>tn", require("neotest").run.run, silent)
-- map("n", "<Leader>tl", require("neotest"). run.run_last, silent)
-- map("n", "<Leader>ts", ":TestSuite<CR>", silent)

-- reenable fzf closing
vim.cmd([[
	augroup fzfexit
		au!
		autocmd FileType fzf tnoremap <buffer> <esc> <c-c>
		autocmd FileType fzf tnoremap <buffer> <C-c> <c-c>
	augroup END
]])

-- Selection

map("n", "<Leader><Leader>", "V")
map("n", "<Leader>,", ":noh<CR>", silent)

-- Searches

map("n", "<Leader>*", ":Ag <C-R><C-W><CR>", silent)
map("v", "<Leader>*", "y:Ag <C-r>=fnameescape(@\")<CR><CR>", silent)

map("n", "<a-n>", function() require 'illuminate'.next_reference { wrap = true } end, { desc = "illuminateNext" })
map("n", "<a-p>", function() require 'illuminate'.next_reference { reverse = true, wrap = true } end,
  { desc = "illuminatePrevious" })

-- Diagnostics

map("n", "<Leader>dd", vim.diagnostic.open_float, { desc = "Diagnostic Float" })
map("n", "<Leader>dw", vim.diagnostic.setloclist, { desc = "Diagnostic LocList" })

-- Config Edit

map("n", "<leader>ev", ":vsplit $MYVIMRC<cr>", silent)
map("n", "<leader>evi", ":vsplit $MYVIMRC<cr>", silent)
map("n", "<leader>evp", ":vsplit ~/.dotfiles/config/nvim/lua/plugins.lua<cr>", silent)
map("n", "<leader>evl",
  ":vsplit ~/.dotfiles/config/nvim/lua/lspconfig.lua<cr>", silent)
map("n", "<leader>evm", ":vsplit ~/.dotfiles/config/nvim/lua/mappings.lua<cr>", silent)
map("n", "<leader>evv", function()
  require('telescope.builtin').find_files {
    search_dirs = { '~/.dotfiles/config/nvim/' }
  }
end, { desc = "Neovim config picker" })
map("n", "<leader>et", ":vsplit ~/.tmux.conf<cr>", silent)
map("n", "<leader>ez", ":vsplit ~/.zshrc<cr>", silent)
map("n", "<leader>ek", ":vsplit ~/.config/kitty/kitty.conf<cr>", silent)

-- Packer

map("n", "<leader>u", ":PackerSync<CR>", silent)
map("n", "<leader>pc", ":PackerCompile<CR>", silent)
map("n", "<leader>pcl", ":PackerClean<CR>", silent)
map("n", "<leader>pr", function() require 'plugins'.rollback('before-update') end, { desc = "Packer Rollback" })

-- kommentary

map("n", "gcc", "<Plug>kommentary_line_default", {})
map("n", "gc", "<Plug>kommentary_motion_default", {})
map("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})

-- better increment

map("n", "<C-a>", "<Plug>(dial-increment)")
map("n", "<C-x>", "<Plug>(dial-decrement)")
map("v", "<C-a>", "<C-a> <Plug>(dial-increment)")
map("v", "<C-x>", "<C-x> <Plug>(dial-decrement)")
map("n", "g<C-a>", "<Plug>(dial-increment-additional)")
map("n", "g<C-x>", "<Plug>(dial-decrement-additional)")

-- Code

map("n", "<Leader>ff", function() vim.lsp.buf.format({ timeout_ms = 10000 }) end)

-- LSP
map("n", "gh", vim.lsp.buf.hover)
map("n", "K", vim.lsp.buf.hover)

map("n", "<Leader>ca", vim.lsp.buf.code_action)
map("v", "<Leader>ca", vim.lsp.buf.range_code_action)

map("n", "<Leader>s", vim.lsp.buf.document_symbol)

map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "<space>rn", vim.lsp.buf.rename)
map("n", "gr", vim.lsp.buf.references)

map("n", "<Leader>go", ":AerialToggle! right<CR>", silent)
map("n", "<Leader>dt", ":AerialToggle! right<CR>", silent)

-- other

-- map("n", "gx",
--   ":execute 'silent! !open ' . shellescape(expand('<cWORD>'), 1)<cr>", silent)

-- Telescope https://github.com/nvim-telescope/telescope.nvim#mappings

map("n", "<C-p>", function() require 'telescope.builtin'.find_files({ hidden = false, no_ignore = false }) end,
  { desc = "Telescope files" })
map("n", "<C-A-p>", function() require 'telescope.builtin'.find_files({ hidden = true, no_ignore = true }) end,
  { desc = "Telescope all files" })
map("n", "<Leader>td", require 'telescope.builtin'.diagnostics, { desc = "Telescope diagnostic" })
map("n", "<Leader>bf", require 'telescope.builtin'.buffers, { desc = "Telescope buffers" })
map("n", "<Leader>gc", require 'telescope.builtin'.git_commits, { desc = "Telescope git_commits" })
map("n", "<Leader>gbc", require 'telescope.builtin'.git_bcommits, { desc = "Telescope git_bcommits" })
map("n", "<Leader>gbr", require 'telescope.builtin'.git_branches, { desc = "Telescope git_branches" })
map("n", "<Leader>tr", require 'telescope.builtin'.treesitter, { desc = "Telescope treesitter" })
map("n", "<Leader>tp", require 'telescope'.extensions.projects.projects, { desc = "Telescope projects" })
map("n", "<Leader>tm", require 'telescope.builtin'.keymaps, { desc = "Telescope keymaps" })
map("n", "<Leader>tb", require 'telescope.builtin'.builtin, { desc = "Telescope builitns" })
map("n", "<Leader>ty", require 'telescope'.extensions.neoclip.default, { desc = "Telescope neoclip" })
map("i", "<C-y>", require 'telescope'.extensions.neoclip.default, { desc = "Telescope neoclip" })

-- Dash
map("n", "D", function() require('dash').search(false, vim.fn.expand('<cword>')) end, { desc = "Dash" })
map("n", "<Leader>D", function() require('dash').search(false, vim.fn.expand('<cword>')) end, { desc = "Dash" })
