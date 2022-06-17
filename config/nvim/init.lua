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

-- Plugins
--

-- require "plugins"

--
-- Navigation
--
import "settings"
import "mappings"

--
-- Config
--

import "custom"

import "winbar"
