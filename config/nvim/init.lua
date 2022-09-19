require 'import'

-- Recompile packer/plugins on safe
local packer_augroup = vim.api.nvim_create_augroup("Packer", {})
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = {
        "*/config/nvim/lua/plugins.lua", "*/config/nvim/lua/plugins/*.lua"
    },
    callback = function(args)
        vim.cmd("source " .. args.file)
        import('plugins', function(p) p.compile() end)
    end,
    group = packer_augroup
})


local bqf_augroup = vim.api.nvim_create_augroup("BQF", {})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.wo.wrap = true
    end,
    group = bqf_augroup
})


-- Plugins
--

-- require "plugins"

--
-- Navigation
--
require "settings"
require "mappings"

--
-- Config
--

-- import "winbar"
