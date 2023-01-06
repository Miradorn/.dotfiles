import({ "bufferline", "catppuccin.groups.integrations.bufferline" }, function(modules)
    -- local colors = modules["catppuccin.palettes"].get_palette "mocha"
    local bl = modules.bufferline
    local highlights = modules["catppuccin.groups.integrations.bufferline"]

    bl.setup {
        highlights = highlights.get(),
        options = {
            separator_style = "slant",
            -- diagnostics = "nvim_lsp",
            -- diagnostics_indicator = function(_, _, diagnostics_dict, _)
            --     local s = " "
            --     for e, n in pairs(diagnostics_dict) do
            --         local sym = e == "error" and " "
            --             or (e == "warning" and " " or (e == "hint" and " " or " "))
            --         s = s .. n .. sym
            --     end
            --     return s
            -- end,
            offsets = { {
                filetype = "NvimTree",
                text = "NvimTree",
                highlight = "Directory",
            } },
            -- custom_areas = {
            --     right = function()
            --         local result = {}
            --         local seve = vim.diagnostic.severity
            --         local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
            --         local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
            --         local info = #vim.diagnostic.get(0, { severity = seve.INFO })
            --         local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
            --
            --         if error ~= 0 then
            --             table.insert(result, { text = "  " .. error, guifg = colors.red })
            --         end
            --
            --         if warning ~= 0 then
            --             table.insert(result, { text = "  " .. warning, guifg = colors.yellow })
            --         end
            --
            --         if hint ~= 0 then
            --             table.insert(result, { text = "  " .. hint, guifg = colors.teal })
            --         end
            --
            --         if info ~= 0 then
            --             table.insert(result, { text = "  " .. info, guifg = colors.sky })
            --         end
            --         return result
            --     end,
            -- }
        }
    }
end)
