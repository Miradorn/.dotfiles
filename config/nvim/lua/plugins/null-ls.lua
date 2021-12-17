return function()
local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
    b.code_actions.eslint_d,
    b.code_actions.gitrebase,
    b.code_actions.gitsigns,
    b.code_actions.shellcheck,
    b.diagnostics.credo,
    b.diagnostics.eslint_d,
    b.diagnostics.hadolint,
    b.diagnostics.markdownlint,
    b.diagnostics.rubocop,
    b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
    b.diagnostics.stylelint,
    b.diagnostics.write_good,
    b.diagnostics.yamllint,
    b.formatting.eslint_d,
    b.formatting.fixjson,
    b.formatting.gofumpt,
    b.formatting.goimports,
    b.formatting.lua_format,
    b.formatting.markdownlint,
    b.formatting.mix,
    b.formatting.prettier,
    b.formatting.rubocop,
    b.formatting.shfmt,
    b.formatting.stylelint,
    b.formatting.terraform_fmt,
}
    null_ls.setup({
        -- debug = true,
        sources = sources,
    })
end
