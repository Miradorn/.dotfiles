function fill_winbar(components)
    import("winbar", function(winbar)

    table.insert(components.active, {})

    table.insert(components.active[1], {
        provider = function()
            return winbar.winbar()
        end,
        enabled = function() return winbar.winbar() ~= nil end
    })

    table.insert(components.inactive, {})

    table.insert(components.inactive[1], {
        provider = function()
            return winbar.winbar()
        end,
        enabled = function() return winbar.winbar() ~= nil end
    })
    end)

end

import("feline", function(feline)
    local components = {
        active = {},
        inactive = {}
    }
    table.insert(components.active, {})
    table.insert(components.active, {})

    local winbar_components = {
        active = {},
        inactive = {}
    }

    fill_winbar(winbar_components)

    feline.setup {

    }

    feline.winbar.setup {
        components = winbar_components

    }
end)
