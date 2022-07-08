local cmp
local luasnip
local lspkind
local cmp_autopairs

import("cmp", function(c) cmp = c end)
import("luasnip", function(c) luasnip = c end)
import("lspkind", function(c) lspkind = c end)
import("nvim-autopairs.completion.cmp", function(c) cmp_autopairs = c end)

assert(cmp)
assert(luasnip)
assert(lspkind)
assert(cmp_autopairs)


local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup {
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " ..
                vim_item.kind
            vim_item.menu = ({
                luasnip = "[Snip]",
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                -- tmux = "[tmux]",
                path = "[path]"
            })[entry.source.name]

            return vim_item
        end
    },
    completion = { completeopt = "menu,menuone,noselect" },
    preselect = cmp.PreselectMode.None,
    -- You can set mapping if you want.
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
        ["<C-j>"] = function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ["<C-y>"] = cmp.config.disable,
        ['<C-n>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        }),
        ['<C-p>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-e>"] = cmp.mapping.close()
        -- ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
    }),

    -- You should specify your *installed* sources.

    sources = {
        { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" },
        { name = "path" }
        -- { name = "tmux" },
    }
}

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

cmp.event:on('confirm_done',
    cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
