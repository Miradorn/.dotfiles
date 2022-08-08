local colors = require("catppuccin.palettes").get_palette "mocha"

import("bufferline", function(bl) bl.setup {
        options = {
            separator_style = "slant",
            diagnostics = "nvim_lsp",
            offsets = { {
                filetype = "NvimTree",
                text = "NvimTree",
                highlight = "Directory",
            } },
            custom_areas = {
                right = function()
                    local result = {}
                    local seve = vim.diagnostic.severity
                    local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
                    local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
                    local info = #vim.diagnostic.get(0, { severity = seve.INFO })
                    local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

                    if error ~= 0 then
                        table.insert(result, { text = "  " .. error, guifg = colors.red })
                    end

                    if warning ~= 0 then
                        table.insert(result, { text = "  " .. warning, guifg = colors.yellow })
                    end

                    if hint ~= 0 then
                        table.insert(result, { text = "  " .. hint, guifg = colors.teal })
                    end

                    if info ~= 0 then
                        table.insert(result, { text = "  " .. info, guifg = colors.sky })
                    end
                    return result
                end,
            }
        }
    }
end)
