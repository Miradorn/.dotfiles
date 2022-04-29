--
-- Helpers
--
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require "custom"
local opt = utils.opt

--
-- Pre Plugin config
--
g.vim_markdown_no_default_key_mappings = 1

g.startify_change_to_dir = 0

-- Recompile packer/plugins on safe
local packer_augroup = vim.api.nvim_create_augroup("Packer", {})
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = {
        "*/config/nvim/lua/plugins.lua", "*/config/nvim/lua/plugins/*.lua"
    },
    callback = function(args)
        vim.cmd("source " .. args.file)
        require 'plugins'.compile()
    end,
    group = packer_augroup
})

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
    "gzip", "man", "matchit", "matchparen", "shada_plugin", "tarPlugin", "tar",
    "zipPlugin", "zip", "netrwPlugin"
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
-- opt("expandtab", true)
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
opt("listchars", {
    tab = "» ",
    extends = "›",
    precedes = "‹",
    nbsp = "+",
    trail = "·",
    space = "·"
})
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
cmd("colorscheme nordfox")

g.kommentary_create_default_mappings = false

g.dashboard_default_executive = "telescope"

g.expandtab = true
g.shiftwidth = 2

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
    signs = true,
    underline = true,
    float = { border = "single" }
})

-- quickfix window formatting from https://github.com/kevinhwang91/nvim-bqf
function _G.qftf(info)
    local items
    local ret = {}
    if info.quickfix == 1 then
        items = fn.getqflist({ id = info.id, items = 0 }).items
    else
        items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
    end
    local limit = 31
    local fname_fmt1, fname_fmt2 = '%-' .. limit .. 's',
        '…%.' .. (limit - 1) .. 's'
    local valid_fmt = '%s │%5d:%-3d│%s %s'
    for i = info.start_idx, info.end_idx do
        local e = items[i]
        local fname = ''
        local str
        if not e then return end
        if e.valid == 1 then
            if e.bufnr > 0 then
                fname = fn.bufname(e.bufnr)
                if fname == '' then
                    fname = '[No Name]'
                else
                    fname = fname:gsub('^' .. vim.env.HOME, '~')
                end
                -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
                if #fname <= limit then
                    fname = fname_fmt1:format(fname)
                else
                    fname = fname_fmt2:format(fname:sub(1 - limit))
                end
            end
            local lnum = e.lnum > 99999 and -1 or e.lnum
            local col = e.col > 999 and -1 or e.col
            local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
            str = valid_fmt:format(fname, lnum, col, qtype, e.text)
        else
            str = e.text
        end
        table.insert(ret, str)
    end
    return ret
end

vim.o.qftf = '{info -> v:lua._G.qftf(info)}'

--[[ autocmd("diagnostics_hover", {
    [[CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
}, true) ]]

-- Commands
vim.api.nvim_create_user_command("PackerInstall", function()
    vim.cmd("packadd packer.nvim")
    require('plugins').install()
end, {})
vim.api.nvim_create_user_command("PackerUpdate", function()
    vim.cmd("packadd packer.nvim")
    require('plugins').update()
end, {})
vim.api.nvim_create_user_command("PackerSync", function()
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
