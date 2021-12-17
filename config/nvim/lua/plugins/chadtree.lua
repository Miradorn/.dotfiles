return function()
    local chadtree_settings = {
        options = { show_hidden = true },
        theme = { text_colour_set = "nord" },
        keymap = { v_split = { "v" }, h_split = { "h" } },
    }

    vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
end
