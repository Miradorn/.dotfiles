import("nvim-treesitter.configs", function(c) c.setup {
        ensure_installed = {
            'bash', 'cmake', 'comment', 'css', 'dockerfile', 'eex', 'elixir',
            'elm', 'erlang', 'go', 'gomod', 'graphql', 'hcl', 'heex', 'hjson',
            'html', 'java', 'javascript', 'jsdoc', 'json', 'json5', 'lua',
            'make', 'markdown', 'markdown_inline', 'python', 'ruby', 'rust', 'regex', 'scss', 'svelte',
            'toml', 'tsx', 'typescript', 'vim', 'vue', 'yaml'
        },
        matchup = { enable = true },
        endwise = { enable = true },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<A-v>",
                node_incremental = "v",
                scope_incremental = "gv",
                node_decremental = "V"
            }
        }
    }
end)
