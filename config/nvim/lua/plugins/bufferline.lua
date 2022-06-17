local colors = require("onenord.colors").load()

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
                        table.insert(result, { text = "  " .. error, guifg = colors.error })
                    end

                    if warning ~= 0 then
                        table.insert(result, { text = "  " .. warning, guifg = colors.warn })
                    end

                    if hint ~= 0 then
                        table.insert(result, { text = "  " .. hint, guifg = colors.hint })
                    end

                    if info ~= 0 then
                        table.insert(result, { text = "  " .. info, guifg = colors.info })
                    end
                    return result
                end,
            }
        }
    }
end)
