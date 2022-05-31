return function()
    local wilder = require('wilder')
    wilder.setup({ modes = { ':' } })
    wilder.set_option('use_python_remote_plugin', 0)
    wilder.set_option('pipeline', {
        wilder.branch(
            wilder.cmdline_pipeline({
                fuzzy = 1,
                fuzzy_filter = wilder.lua_fzy_filter(),
            }),
            wilder.vim_search_pipeline()
        )
    })

    wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
            apply_incsearch_fix = 0,
            highlighter = wilder.lua_fzy_highlighter(),
            left = {
                ' ',
                wilder.popupmenu_devicons(),
                wilder.popupmenu_buffer_flags({
                    flags = ' a + ',
                    icons = { ["+"] = '', a = '', h = '' }
                }) },
            right = { ' ', wilder.popupmenu_scrollbar() },
            highlights = {
                border = 'FloatBorder',
                default = 'Normal',
                accent = wilder.make_hl('WilderAccent', 'Pmenu', {
                    {},
                    {},
                    { foreground = '#D08770' },
                })
            },
            border = 'rounded'
        })))
end
