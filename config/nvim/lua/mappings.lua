--
-- Helpers
--
local map = vim.keymap.set

local silent = {silent = true}

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

-- reenable fzf closing
vim.cmd([[
	augroup fzfexit
		au!
		autocmd FileType fzf tmap <buffer> <esc> <c-c>
		autocmd FileType fzf tmap <buffer> <C-c> <c-c>
	augroup END
]])

-- Splits

map("n", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", silent)
map("n", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", silent)
map("n", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", silent)
map("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", silent)
map("n", "<C-p>", "<CMD>lua require('Navigator').previous()<CR>", silent)

-- Selection

map("n", "<Leader><Leader>", "V")
map("v", "v", "<Plug>(expand_region_expand)")
map("v", "V", "<Plug>(expand_region_shrink)")

map("n", "<Leader>,", ":noh<CR>")

-- Searches

map("n", "<Leader>*", ":Ag <C-R><C-W><CR>", silent)
map("v", "<Leader>*", "y:Ag <C-r>=fnameescape(@\")<CR><CR>", silent)

map("n", "<a-n>", "<cmd>lua require'illuminate'.next_reference{wrap=true}<cr>")
map("n", "<a-p>",
    "<cmd>lua require'illuminate'.next_reference{reverse=true,wrap=true}<cr>")

-- Diagnostics

map("n", "<Leader>dd", "<cmd>:lua vim.diagnostic.open_float()<CR>")
map("n", "<Leader>dw",
    "<cmd>:lua require('diaglist').open_buffer_diagnostics()<CR>")

-- Config Edit

map("n", "<leader>ev", ":vsplit $MYVIMRC<cr>")
map("n", "<leader>evp", ":vsplit ~/.dotfiles/config/nvim/lua/plugins.lua<cr>")
map("n", "<leader>evl",
    ":vsplit ~/.dotfiles/config/nvim/lua/lspconfig_config.lua<cr>")
map("n", "<leader>evm", ":vsplit ~/.dotfiles/config/nvim/lua/mappings.lua<cr>")
map("n", "<leader>evv",
    ":lua require('telescope.builtin.files').find_files {search_dirs =  {'~/.dotfiles/config/nvim/'}}<CR>")
map("n", "<leader>et", ":vsplit ~/.tmux.conf<cr>")
map("n", "<leader>ez", ":vsplit ~/.zshrc<cr>")
map("n", "<leader>ek", ":vsplit ~/.config/kitty/kitty.conf<cr>")

-- Packer

map("n", "<leader>u", ":PackerSync<CR>")
map("n", "<leader>pc", ":PackerClean<CR>")

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

map("n", "<Leader>ff",
    "<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 10000)<CR>")

-- LSP
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)

map("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
map("v", "<Leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", silent)

map("n", "<Leader>s", "<cmd>lua vim.lsp.buf.document_symbol<CR>")

map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", silent)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", silent)
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", silent)

map("n", "<Leader>gt", ":SymbolsOutline<CR>")
map("n", "<Leader>dt", ":SymbolsOutline<CR>")

-- other

map("n", "gx",
    ":execute 'silent! !open ' . shellescape(expand('<cWORD>'), 1)<cr>", silent)

-- Telescope https://github.com/nvim-telescope/telescope.nvim#mappings

map("n", "<C-p>", "<cmd>lua require'custom'.project_files()<CR>")
map("n", "<Leader>p", "<cmd>Telescope find_files<CR>")
map("n", "<Leader>d", "<cmd>Telescope lsp_document_diagnostics<CR>")
map("n", "<Leader>bf", "<cmd>Telescope buffers<CR>")
map("n", "<Leader>gc", "<cmd>Telescope git_commits<CR>")
map("n", "<Leader>gbc", "<cmd>Telescope git_bcommits<CR>")
map("n", "<Leader>gbr", "<cmd>Telescope git_branches<CR>")
map("n", "<Leader>tr", "<cmd>Telescope treesitter<CR>")
map("n", "<Leader>tp", "<cmd>Telescope builtin<CR>")
