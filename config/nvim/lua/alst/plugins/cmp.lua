-- local has_words_before = function()
--   unpack = unpack or table.unpack
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
-- end

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-P>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-CR>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
  --   },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = false, -- Enable debugging
      window = {
        layout = "float",
        relative = "win"
      }
    },
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatReset",
      "CopilotChatSave",
      "CopilotChatLoad",
      "CopilotChatDebugInfo",
      "CopilotChatModels",
      "CopilotChatModel",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
      "CopilotChatFixDiagnostic",
      "CopilotChatCommit",
      "CopilotChatCommitStaged"
    }
  },
  {
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp", -- Otherwise highlighting gets messed up
    event = "InsertEnter",
    dependencies = {
      -- "andersevenrud/cmp-tmux" ,
      "hrsh7th/cmp-buffer",
      -- "zbirenbaum/copilot-cmp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      -- "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    opts = function()
      local cmp = require("cmp")
      -- local luasnip = require("luasnip")
      local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
      end

      return {
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        preselect = cmp.PreselectMode.None,
        -- snippet = {
        --   expand = function(args)
        --     -- luasnip.lsp_expand(args.body)
        --     -- vim.snippet.expand(args.body)         -- For native neovim snippets (Neovim v0.10+)
        --   end,
        -- },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.snippet.active({ direction = 1 }) then
              vim.snippet.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.snippet.active({ direction = -1 }) then
              vim.snippet.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<C-j>"] = function(fallback)
            if vim.snippet.active() then
              vim.snippet.jump(1)
            else
              fallback()
            end
          end,
          -- ["<C-y>"] = cmp.config.disable,
          -- ["<C-n>"] = cmp.mapping({
          --   c = function()
          --     if cmp.visible() then
          --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          --     else
          --       vim.api.nvim_feedkeys(t("<Down>"), "n", true)
          --     end
          --   end,
          --   i = function(fallback)
          --     if cmp.visible() then
          --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          --     else
          --       fallback()
          --     end
          --   end,
          -- }),
          -- ["<C-p>"] = cmp.mapping({
          --   c = function()
          --     if cmp.visible() then
          --       cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          --     else
          --       vim.api.nvim_feedkeys(t("<Up>"), "n", true)
          --     end
          --   end,
          --   i = function(fallback)
          --     if cmp.visible() then
          --       cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          --     else
          --       fallback()
          --     end
          --   end,
          -- }),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 10 },
          { name = "copilot",  priority = 2 },
          -- { name = "luasnip",  priority = 5 },
          {
            name = "buffer",
            priority = 3,
            option = {
              get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end,
            },
          },
          { name = "path", priority = 1 },
          -- { name = "tmux" },
        }),
        formatting = {
          format = require("lspkind").cmp_format({
            maxwidth = 100,
            mode = "symbol_text",
            symbol_map = { Copilot = "", },

            before = function(entry, vim_item)
              -- vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
              vim_item.menu = ({
                -- luasnip = "[Snip]",
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                tmux = "[tmux]",
                path = "[path]",
              })[entry.source.name] or entry.source.name

              return vim_item
            end,
          }),
        },
        experimental = {
          -- ghost_text = {
          --   hl_group = "LspCodeLens",
          -- },
        },
      }
    end,
    config = function(plugin, opts)
      local cmp = require("cmp")
      cmp.setup(opts)
      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
