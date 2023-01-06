-- local winbar
--
-- import('winbar', function(w) winbar = w end)

local lsp_names = function()
    local clients = {}

    for _, client in pairs(vim.lsp.buf_get_clients(0)) do
        clients[#clients + 1] = client.name
    end

    return table.concat(clients, ' '), ' '
end


import({ 'lualine', 'nvim-navic' }, function(modules)
    local lualine = modules.lualine
    local navic = modules["nvim-navic"]

    local get_location = function()
        local l = navic.get_location()
        if l == "" then return "/" else return l end
    end


    lualine.setup {
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = 'catppuccin',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                winbar = {
                    'alpha',
                    'startify',
                    'NvimTree',
                    'aerial',
                    'toggleterm',
                    'qf',
                    'packer',
                    'help',
                    'dashboard',
                    'Trouble'
                },
            },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { { 'filetype', fmt = string.upper } },
            lualine_c = {
                { "filename", path = 1 }
            },
            lualine_x = {
                { "filesize", icon = "", },
                { "location", icon = "" },
                "progress",
                'encoding',
                'fileformat',
                { lsp_names, icon = "", },
                'diagnostics'
            },
            lualine_y = { 'diff' },
            lualine_z = { 'branch' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        winbar = {
            lualine_b = { { get_location, cond = navic.is_available } },
            lualine_y = { "diagnostics" }
        },
        inactive_winbar = {
            lualine_b = { { "filename", path = 1 } },
            lualine_y = { "diagnostics" }
        },
        tabline = {},
        extensions = { 'nvim-tree', 'fugitive', 'fzf', 'quickfix', 'symbols-outline', 'aerial' }
    }
end)
