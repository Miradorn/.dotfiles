return function()
    local actions = require("telescope.actions")

    require "telescope".setup {
        defaults = {
            mappings = {
                i = { ["<C-b>"] = { "<esc>", type = "command" } },
                n = { ["<C-c>"] = actions.close }
            }
        },
        pickers = {
            -- Your special builtin config goes in here
            file_browser = { hidden = true },
            find_files = { hidden = true }
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("media_files")
    require('telescope').load_extension('projects')
end