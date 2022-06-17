import("nvim-treesitter.configs", function(c) c.setup {
        ensure_installed = {
            'bash', 'cmake', 'comment', 'css', 'dockerfile', 'eex', 'elixir',
            'elm', 'erlang', 'go', 'gomod', 'graphql', 'hcl', 'heex', 'hjson',
            'html', 'java', 'javascript', 'jsdoc', 'json', 'json5', 'lua',
            'make', 'markdown', 'python', 'ruby', 'rust', 'scss', 'svelte',
            'toml', 'tsx', 'typescript', 'vim', 'vue', 'yaml'
        },
        endwise = { enable = true },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gv",
                node_incremental = "gv",
                scope_incremental = "gV",
                node_decremental = "gd"
            }
        }
    }
end)
