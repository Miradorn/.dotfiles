--
-- Helpers
--
local function map(mode, lhs, rhs, opts)
    local options = {}
    if opts then options = vim.tbl_extend("force", options, opts) end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function noremap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend("force", options, opts) end

    map(mode, lhs, rhs, options)
end

local silent = { silent = true }

-- local config_dir = vim.fn.expand("$XDG_CONFIG_HOME")

-- movement
-- move by screen line
noremap("n", "j", "gj")
noremap("n", "k", "gk")

-- file modification

noremap("n", "<Leader>w", ":w<CR>")
noremap("n", "<Leader>W", ":w!<CR>")
noremap("n", "<Leader>q", ":q<CR>")
noremap("n", "<Leader>Q", ":q!<CR>")
noremap("n", "<Leader>e", ":e<CR>")
noremap("n", "<Leader>E", ":e!<CR>")

-- nvimTree Explorer

noremap("n", "<Leader>n", ":NvimTreeToggle<CR>")
noremap("n", "<Leader>N", ":NvimTreeFindFile<CR>")

-- undotree
noremap("n", "<Leader>gu", ":UndotreeToggle<CR>")

-- Vim Command Line

noremap("c", "<C-p>", "<up>")
noremap("c", "<C-n>", "<down>")
noremap("c", "<C-a>", "<Home>")
noremap("c", "<C-f>", "<Right>")
noremap("c", "<C-b>", "<Left>")
noremap("c", "<A-b>", "<S-Left>")
noremap("c", "<A-f>", "<S-Right>")

-- terminal
noremap("t", "<ESC>", "<C-\\><C-n>")
noremap("t", "<C-c>", "<C-\\><C-n>")

noremap("n", "<Leader>tt", ":Ttoggle<CR>", silent)

-- Tests
noremap("n", "<Leader>tf", ":TestFile<CR>", silent)
noremap("n", "<Leader>tn", ":TestNearest<CR>", silent)
noremap("n", "<Leader>tl", ":TestLast<CR>", silent)

-- reenable fzf closing
vim.cmd([[
	augroup fzfexit
		au!
		autocmd FileType fzf tnoremap <buffer> <esc> <c-c>
		autocmd FileType fzf tnoremap <buffer> <C-c> <c-c>
	augroup END
]])

-- Splits

noremap("n", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", silent)
noremap("n", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", silent)
noremap("n", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", silent)
noremap("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", silent)
noremap("n", "<C-p>", "<CMD>lua require('Navigator').previous()<CR>", silent)

-- Selection

noremap("n", "<Leader><Leader>", "V")
map("v", "v", "<Plug>(expand_region_expand)")
map("v", "V", "<Plug>(expand_region_shrink)")

noremap("n", "<Leader>,", ":noh<CR>")

-- Searches

noremap("n", "<Leader>*", ":Ag <C-R><C-W><CR>", silent)
noremap("v", "<Leader>*", "y:Ag <C-r>=fnameescape(@\")<CR><CR>", silent)

noremap("n", "<a-n>", "<cmd>lua require'illuminate'.next_reference{wrap=true}<cr>")
noremap("n", "<a-p>", "<cmd>lua require'illuminate'.next_reference{reverse=true,wrap=true}<cr>")

-- Diagnostics

noremap("n", "<Leader>dd", ":TroubleToggle document_diagnostics<CR>")
noremap("n", "<Leader>dw", ":TroubleToggle workspace_diagnostics<CR>")

-- Config Edit

noremap("n", "<leader>ev", ":vsplit $MYVIMRC<cr>")
noremap("n", "<leader>evp", ":vsplit ~/.config/nvim/lua/plugins.lua<cr>")
noremap("n", "<leader>evl", ":vsplit ~/.config/nvim/lua/lspconfig_config.lua<cr>")
noremap("n", "<leader>evm", ":vsplit ~/.config/nvim/lua/mappings.lua<cr>")
noremap("n", "<leader>evv",
        ":lua require('telescope.builtin.files').find_files {search_dirs =  {'~/.dotfiles/config/nvim/'}}<CR>")
noremap("n", "<leader>et", ":vsplit ~/.tmux.conf<cr>")
noremap("n", "<leader>ez", ":vsplit ~/.zshrc<cr>")
noremap("n", "<leader>ek", ":vsplit ~/.config/kitty/kitty.conf<cr>")

-- Packer

noremap("n", "<leader>u", ":PackerSync<CR>")
noremap("n", "<leader>pc", ":PackerClean<CR>")

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

noremap("n", "<Leader>ff", "<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 5000)<CR>")

-- LSP
noremap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
noremap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)

noremap("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
noremap("v", "<Leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", silent)

noremap("n", "<Leader>s", "<cmd>lua vim.lsp.buf.document_symbol<CR>")

noremap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", silent)
noremap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
noremap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", silent)
noremap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
noremap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", silent)

-- other

map("n", "gx", ":execute 'silent! !open ' . shellescape(expand('<cWORD>'), 1)<cr>", silent)

-- Telescope https://github.com/nvim-telescope/telescope.nvim#mappings

noremap("n", "<C-p>", "<cmd>lua require'custom'.project_files()<CR>")
noremap("n", "<Leader>p", "<cmd>Telescope find_files<CR>")
noremap("n", "<Leader>d", "<cmd>Telescope lsp_document_diagnostics<CR>")
noremap("n", "<Leader>bf", "<cmd>Telescope buffers<CR>")
noremap("n", "<Leader>gc", "<cmd>Telescope git_commits<CR>")
noremap("n", "<Leader>gbc", "<cmd>Telescope git_bcommits<CR>")
noremap("n", "<Leader>gbr", "<cmd>Telescope git_branches<CR>")
noremap("n", "<Leader>tr", "<cmd>Telescope treesitter<CR>")
noremap("n", "<Leader>tp", "<cmd>Telescope builtin<CR>")
