--
-- Helpers
--
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require "custom"
local opt = utils.opt
local autocmd = utils.autocmd

--
-- Pre Plugin config
--

-- Recompile packer/plugins on safe
autocmd("Packer", {
  "BufWritePost ~/.dotfiles/config/nvim/lua/plugins.lua,~/.dotfiles/config/nvim/lua/plugins/*.lua source <afile> | PackerCompile",
}, true)


-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  "gzip",
  "man",
  "matchit",
  "matchparen",
  "shada_plugin",
  "tarPlugin",
  "tar",
  "zipPlugin",
  "zip",
  "netrwPlugin",
}

for i = 1, 10 do g["loaded_" .. disabled_built_ins[i]] = 1 end
-- Leader
g.mapleader = " "

-- Settings

opt("mouse", "a")
-- opt("textwidth", 120)
opt("scrolloff", 7)
opt("wildmode", "longest,full")
opt("lazyredraw", true)
opt("showmatch", true)
opt("ignorecase", true)
opt("smartcase", true)
opt("tabstop", 2)
opt("expandtab", true)
opt("shiftwidth", 2)
opt("number", true)
opt("cursorline", true)
opt("smartindent", true)
opt("hidden", true)
opt("guicursor", [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]])
opt("undofile", true)
opt("swapfile", false)
opt("showbreak", "↪\\")
opt("list", true)
opt("listchars",
    { tab = "» ", extends = "›", precedes = "‹", nbsp = "+", trail = "·", space = "·" })
opt("history", 5000)
opt("signcolumn", "auto")
opt("colorcolumn", { "120" })
opt("splitbelow", true)
opt("splitright", true)

opt("updatetime", 1000)

opt("completeopt", "menu,menuone,noselect")

-- Colorscheme
opt("termguicolors", true)
opt("background", "dark")

cmd("filetype plugin on")

g.kommentary_create_default_mappings = false

g.dashboard_default_executive = "telescope"

g.expandtab = true
g.shiftwidth = 2

-- Visuals

fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

g.nord_borders = true

-- Commands
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

g.nvim_tree_disable_window_picker = 1
-- Highlight yanks
autocmd("misc_aucmds", { [[TextYankPost * silent! lua vim.highlight.on_yank({timeout=500})]] }, true)

-- vim-test
g["test#strategy"] = "neoterm"

-- neoterm
g.neoterm_default_mod = "botright"

--
-- Plugins
--

-- require "plugins"

--
-- Navigation
--

require "mappings"

--
-- Config
--

require "custom"
