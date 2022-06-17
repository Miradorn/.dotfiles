local lsp_name = function()
    local msg = "No Active Lsp"
    local buf_number = vim.api.nvim_get_current_buf()
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })

    if next(clients) == nil then
        return msg
    end

    local client_names = {}
    for _, client in ipairs(clients) do
        table.insert(client_names, client.name)
    end

    return table.concat(client_names, " ")
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
                { lsp_name, icon = "", },
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
