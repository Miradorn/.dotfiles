--available
-- Helpers
--
local g = vim.g
-- local cmd = vim.cmd
local fn = vim.fn
-- local o, wo, bo = vim.o, vim.wo, vim.bo
-- local utils = require "custom"

--
-- Pre Plugin config
--
g.vim_markdown_no_default_key_mappings = 1
g.matchup_matchparen_offscreen = {}


-- Disable some built-in plugins we don't want
local disabled_built_ins = {
    "gzip", "man", "matchit", "matchparen", "shada_plugin", "tarPlugin", "tar",
    "zipPlugin", "zip"
}

for _i, v in ipairs(disabled_built_ins) do g["loaded_" .. v] = 1 end

-- Leader
g.mapleader = " "

-- Settings
local opts = {
    mouse = "a",
    -- textwidth = 120,
    scrolloff = 7,
    -- cmdheight = 0,
    wildmode = "longest,full",
    -- lazyredraw = true,
    showmatch = true,
    ignorecase = true,
    smartcase = true,
    tabstop = 2,
    expandtab = true,
    shiftwidth = 2,
    number = true,
    cursorline = true,
    smartindent = true,
    hidden = true,
    -- laststatus = 3,
    guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]],
    undofile = true,
    swapfile = false,
    showbreak = "↪\\",
    list = true,
    listchars = {
        tab = "» ",
        extends = "›",
        precedes = "‹",
        nbsp = "+",
        trail = "·",
        space = "·"
    },
    history = 5000,
    signcolumn = "number",
    colorcolumn = { "120" },
    splitbelow = true,
    splitright = true,

    updatetime = 1000,

    completeopt = "menu,menuone,noselect",

    -- Colorscheme
    termguicolors = true,
    background = "dark",

    -- folds
    foldenable = true,
    -- foldmethod = "expr",
    -- foldexpr = "nvim_treesitter#foldexpr()",
    foldlevel = 99,
    foldcolumn = "0",
}

for k, v in pairs(opts) do
    vim.opt[k] = v
end
-- Visuals

fn.sign_define("DiagnosticSignError",
    { text = "", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn",
    { text = "", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation",
    { text = "", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint" })

g.nord_borders = true

-- diagnostics
vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = false,
    signs = true,
    underline = true,
    float = { border = "single" }
})


local diag_augroup = vim.api.nvim_create_augroup("AUGDiagnosticChanged", {})
vim.api.nvim_create_autocmd("DiagnosticChanged", {
    pattern = "*",
    callback = function() vim.diagnostic.setqflist({ open = false }) end,
    group = diag_augroup
})

-- Commands
vim.api.nvim_create_user_command("PackerInstall", function()
    vim.cmd("packadd packer.nvim")
    require('plugins').install()
end, {})
vim.api.nvim_create_user_command("PackerUpdate", function()
    vim.cmd("packadd packer.nvim")
    require('plugins').delete_snapshot("before-update")
    require('plugins').snapshot("before-update")
    require('plugins').update()
end, {})
vim.api.nvim_create_user_command("PackerSync", function()
    require('plugins').delete_snapshot("before-update")
    require('plugins').snapshot("before-update")
    vim.cmd("packadd packer.nvim")
    require('plugins').sync()
end, {})
vim.api.nvim_create_user_command("PackerClean", function()
    vim.cmd("packadd packer.nvim")
    require('plugins').clean()
end, {})
vim.api.nvim_create_user_command("PackerCompile", function()
    vim.cmd("packadd packer.nvim")
    require('plugins').compile()
end, {})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

-- Highlight yanks
local yank_augroup = vim.api.nvim_create_augroup("Yank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function() vim.highlight.on_yank({ timeout = 500 }) end,
    group = yank_augroup
})
