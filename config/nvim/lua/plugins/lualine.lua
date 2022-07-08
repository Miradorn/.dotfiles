local lsp_names = function()
     local clients = {}

    for _, client in pairs(vim.lsp.buf_get_clients(0)) do
        clients[#clients + 1] = client.name
    end

    return table.concat(clients, ' '), ' '
end


import('lualine', function(lualine) lualine.setup {
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = 'onenord',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {},
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { { 'filetype', fmt = string.upper } },
            lualine_c = {
                "filename"
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
        tabline = {},
        extensions = { 'nvim-tree', 'fugitive', 'fzf', 'quickfix', 'symbols-outline' }
    }
end)
