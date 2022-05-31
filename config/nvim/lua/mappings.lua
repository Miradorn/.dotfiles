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
map("i", "<C-b>", "<left>")
map("i", "<C-f>", "<right>")
map("i", "<C-e>", "<End>")
map("i", "<C-a>", "<Home>")

-- file modification

map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>W", ":w!<CR>")
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>Q", ":q!<CR>")
map("n", "<Leader>e", ":e<CR>")
map("n", "<Leader>E", ":e!<CR>")

-- nvimTree Explorer

map("n", "<Leader>n", ":NvimTreeToggle<CR>")
map("n", "<Leader>N", ":NvimTreeFindFile<CR>")

-- undotree
map("n", "<Leader>gu", ":UndotreeToggle<CR>")

-- Vim Command Line

map("c", "<C-p>", "<up>")
map("c", "<C-n>", "<down>")
map("c", "<C-a>", "<Home>")
map("c", "<C-f>", "<Right>")
map("c", "<C-b>", "<Left>")
map("c", "<A-b>", "<S-Left>")
map("c", "<A-f>", "<S-Right>")

-- terminal
map("t", "<ESC>", "<C-\\><C-n>")
-- map("t", "<C-c>", "<C-\\><C-n>")

map("n", "<Leader>tt", ":Ttoggle<CR>", silent)

-- Tests
map("n", "<Leader>tf", ":TestFile<CR>", silent)
map("n", "<Leader>tn", ":TestNearest<CR>", silent)
map("n", "<Leader>tl", ":TestLast<CR>", silent)
map("n", "<Leader>ts", ":TestSuite<CR>", silent)

-- reenable fzf closing
vim.cmd([[
	augroup fzfexit
		au!
		autocmd FileType fzf tnoremap <buffer> <esc> <c-c>
		autocmd FileType fzf tnoremap <buffer> <C-c> <c-c>
	augroup END
]])

-- Splits

map("n", "<C-h>", require('Navigator').left)
map("n", "<C-k>", require('Navigator').up)
map("n", "<C-l>", require('Navigator').right)
map("n", "<C-j>", require('Navigator').down)

-- Selection

map("n", "<Leader><Leader>", "V")
map("v", "v", "<Plug>(expand_region_expand)")
map("v", "V", "<Plug>(expand_region_shrink)")

map("n", "<Leader>,", ":noh<CR>")

-- Searches

map("n", "<Leader>*", ":Ag <C-R><C-W><CR>", silent)
map("v", "<Leader>*", "y:Ag <C-r>=fnameescape(@\")<CR><CR>", silent)

map("n", "<a-n>", function() require 'illuminate'.next_reference { wrap = true } end)
map("n", "<a-p>", function() require 'illuminate'.next_reference { reverse = true, wrap = true } end)

-- Diagnostics

map("n", "<Leader>dd", vim.diagnostic.open_float)
map("n", "<Leader>dw", vim.diagnostic.setloclist)

-- Config Edit

map("n", "<leader>ev", ":vsplit $MYVIMRC<cr>")
map("n", "<leader>evi", ":vsplit $MYVIMRC<cr>")
map("n", "<leader>evp", ":vsplit ~/.dotfiles/config/nvim/lua/plugins.lua<cr>")
map("n", "<leader>evl",
	":vsplit ~/.dotfiles/config/nvim/lua/lspconfig.lua<cr>")
map("n", "<leader>evm", ":vsplit ~/.dotfiles/config/nvim/lua/mappings.lua<cr>")
map("n", "<leader>evv", function()
	require('telescope.builtin.files').find_files {
		search_dirs = { '~/.dotfiles/config/nvim/' }
	}
end)
map("n", "<leader>et", ":vsplit ~/.tmux.conf<cr>")
map("n", "<leader>ez", ":vsplit ~/.zshrc<cr>")
map("n", "<leader>ek", ":vsplit ~/.config/kitty/kitty.conf<cr>")

-- Packer

map("n", "<leader>u", ":PackerSync<CR>")
map("n", "<leader>pc", ":PackerClean<CR>")
map("n", "<leader>pr", function() require'plugins'.rollback('before-update') end)

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

map("n", "<Leader>ff", function() vim.lsp.buf.format({timeout_ms = 10000}) end)

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

map("n", "<Leader>go", ":AerialToggle! right<CR>")
map("n", "<Leader>dt", ":AerialToggle! right<CR>")

-- other

map("n", "gx",
	":execute 'silent! !open ' . shellescape(expand('<cWORD>'), 1)<cr>", silent)

-- Telescope https://github.com/nvim-telescope/telescope.nvim#mappings

map("n", "<C-p>", require 'custom'.project_files)
map("n", "<C-A-p>", require 'telescope.builtin'.find_files)
map("n", "<Leader>td", require 'telescope.builtin'.diagnostics)
map("n", "<Leader>bf", require 'telescope.builtin'.buffers)
map("n", "<Leader>gc", require 'telescope.builtin'.git_commits)
map("n", "<Leader>gbc", require 'telescope.builtin'.git_bcommits)
map("n", "<Leader>gbr", require 'telescope.builtin'.git_branches)
map("n", "<Leader>tr", require 'telescope.builtin'.treesitter)
map("n", "<Leader>tp", require 'telescope'.extensions.projects.projects)
map("n", "<Leader>tm", require 'telescope.builtin'.keymaps)
map("n", "<Leader>tb", require 'telescope.builtin'.builtin)
map("n", "<Leader>ty", require 'telescope'.extensions.neoclip.default)
map("i", "<C-y>", require 'telescope'.extensions.neoclip.default)

-- Dash
map("n", "D", function() require('dash').search(false, vim.fn.expand('<cword>')) end)
map("n", "<Leader>D", function() require('dash').search(false, vim.fn.expand('<cword>')) end)
