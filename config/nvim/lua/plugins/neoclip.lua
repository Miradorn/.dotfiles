import("neoclip", function(clip) clip.setup {
        enable_persistent_history = true,
        keys = {
            telescope = {
                i = {
                    select = '<C-s>',
                    paste = '<CR>',
                    paste_behind = '<C-k>',
                    replay = '<c-q>', -- replay a macro
                    delete = '<c-d>', -- delete an entry
                    custom = {},
                },
                n = {
                    select = 's',
                    paste = '<CR>',
                    paste_behind = '<S-CR>',
                    replay = 'q',
                    delete = 'd',
                    custom = {},
                },
            },
        },
    }
end)
