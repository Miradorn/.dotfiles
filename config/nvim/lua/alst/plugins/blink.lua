return {
  {
    'saghen/blink.cmp',
    -- build = "cargo +nightly build --release",
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
      "folke/lazydev.nvim",
      'MeanderingProgrammer/render-markdown.nvim',
      -- 'rafamadriz/friendly-snippets',
    },

    -- use a release tag to download pre-built binaries
    -- version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
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
          menu = {
            auto_show = true,
          },
          list = {
            selection = { preselect = false, auto_insert = true }
          },
        },
        -- optionally disable cmdline completions
        -- sources = {},
      },
      term = {
        sources = { 'path' },
      },
      completion = {
        keyword = {
          range = "full"
        },
        list = {
          selection = { preselect = false, auto_insert = true }
        },
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          -- border = "rounded",
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
                -- Optionally, you may also use the highlights from mini.icons
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
          window = {
            border = "rounded",
          },
        },
        ghost_text = {
          enabled = false,
          show_without_selection = true,

        },
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = false,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, via `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'buffer' },
        -- default = { 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
          lua = { 'lazydev', 'lsp', 'path', 'buffer' },
        },
        providers = {
          lsp = { timeout_ms = 1000, fallbacks = {}, async  = true, score_offset = 50 },
          buffer = { score_offset = -5 },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },

      -- experimental signature help support
      signature = {
        enabled = true,
        -- window = {
        --   border = "rounded"
        -- }
      },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" }
  },
}
