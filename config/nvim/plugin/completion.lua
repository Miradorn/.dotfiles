vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') },
})

---@module 'blink.cmp'
---@type blink.cmp.Config
require("blink.cmp").setup({
  keymap = {
    preset = 'enter',
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<C-c>'] = { 'cancel', 'fallback' },
  },
  enabled = function()
    return not vim.tbl_contains({ "copilot-chat" }, vim.bo.filetype)
  end,

  cmdline = {
    keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<CR>'] = { 'accept_and_enter', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<C-c>'] = { 'cancel', 'fallback' },
    },
    completion = {
      menu = { auto_show = true },
      list = { selection = { preselect = false, auto_insert = true } },
    },
  },
  term = {
    sources = { 'path' },
  },
  completion = {
    keyword = { range = "full" },
    list = { selection = { preselect = false, auto_insert = true } },
    accept = {
      auto_brackets = { enabled = true },
    },
    menu = {
      draw = {
        treesitter = { "lsp" },
        columns = { { "label", "label_description", gap = 3 }, { "kind_icon", "kind", gap = 1 } },
        components = {
          kind_icon = {
            ellipsis = false,
            text = function(ctx)
              local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
              return kind_icon
            end,
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          }
        }
      }
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = { border = "rounded" },
    },
    ghost_text = {
      enabled = false,
      show_without_selection = true,
    },
  },

  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = 'mono'
  },

  sources = {
    default = { 'lsp', 'path', 'buffer' },
    per_filetype = {
      lua = { 'lazydev', 'lsp', 'path', 'buffer' },
    },
    providers = {
      lsp = { timeout_ms = 1000, fallbacks = {}, async = true, score_offset = 50 },
      buffer = { score_offset = -5 },
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },

  signature = { enabled = true },
})
