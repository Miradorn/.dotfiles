return function()
    local lsp_name = function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end

        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes

            if client.name ~= "null-ls" and filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end

        return msg
    end

    require('lualine').setup {
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
            lualine_b = { { 'filetype', fmt = string.upper }},
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
end
