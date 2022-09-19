import("null-ls", function(null_ls)
    local b = null_ls.builtins

    local eslint_condition = function(utils)
        return utils.root_has_file({
            ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml",
            ".eslintrc.json"
        })
    end
    local sources = {
        b.code_actions.eslint_d.with({
            condition = eslint_condition,
            extra_filetypes = { "graphql" }
        }), b.code_actions.shellcheck, b.diagnostics.alex, b.diagnostics.credo,
        b.diagnostics.eslint_d.with({
            condition = eslint_condition,
            extra_filetypes = { "graphql" }
        }), b.diagnostics.gitlint, b.diagnostics.hadolint,
        b.diagnostics.markdownlint, b.diagnostics.rubocop,
        -- b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
        b.diagnostics.stylelint, b.diagnostics.yamllint,
        b.formatting.eslint_d.with({
            condition = eslint_condition,
            extra_filetypes = { "graphql" }
        }), b.formatting.fixjson, b.formatting.gofumpt, b.formatting.goimports,
        b.formatting.markdownlint,
        -- b.formatting.mix.with({ extra_filetypes = { 'elixir', 'eelixir', 'heex' } }),
        b.formatting.prettier, b.formatting.rubocop, b.formatting.shfmt,
        b.formatting.stylelint, b.formatting.terraform_fmt
    }
    null_ls.setup({
        -- debug = true,
        default_timeout = 15000,
        sources = sources
    })
end)
