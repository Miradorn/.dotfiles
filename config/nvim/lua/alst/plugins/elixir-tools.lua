return {
  "elixir-tools/elixir-tools.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = "Elixir",
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup({
      credo = {
        enable = false,
      },
      nextls = {
        enable = false,
        init_options = {
          extensions = {
            credo = {
              enable = true
            }
          },
          experimental = {
            completions = {
              enable = true
            }
          }
        },

        on_attach = function(client, bufnr)
          local keymap = require("legendary").keymap

          keymap({
            "<leader>fp",
            ":Elixir nextls from-pipe<cr>",
            description = "From Pipe",
            opts = { buffer = true, noremap = true, silent = true }
          })
          keymap({
            "<leader>tp",
            ":Elixir nextls to-pipe<cr>",
            description = "To Pipe",
            opts = { buffer = true, noremap = true, silent = true }
          })
          keymap({
            "<leader>aa",
            ":Elixir nextls alias-refactor<cr>",
            description = "alias refactor",
            opts = { buffer = true, noremap = true, silent = true }
          })
        end,
      },
      elixirls = {
        enable = true,
        tag = "v0.28.0", -- defaults to nil, mutually exclusive with the `branch` option
        -- -- cmd = "/Users/alexander/.local/bin/elixir-ls/language_server.sh",
        settings = elixirls.settings({
          dialyzerEnabled = false,
          enableTestLenses = false,
          suggestSpecs = true,
          fetchDeps = true,
        }),
        on_attach = function(client, bufnr)
          local keymap = require("legendary").keymap

          keymap({
            "<leader>fp",
            ":ElixirFromPipe<cr>",
            description = "From Pipe",
            opts = { buffer = true, noremap = true, silent = true }
          })
          keymap({
            "<leader>tp",
            ":ElixirToPipe<cr>",
            description = "To Pipe",
            opts = { buffer = true, noremap = true, silent = true }
          })
          keymap({
            "<leader>em",
            ":ElixirExpandMacro<cr>",
            description = "Expand Macro",
            opts = { buffer = true, noremap = true, silent = true },
            mode = "v"
          })
        end,
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
