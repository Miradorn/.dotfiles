return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      modes = {
        lsp_document_symbols = {
          groups = {}

        },
        diagnostics = {
          groups = {}
        },
        telescope = {
          groups = {}
          --   mode = "telescope",
          --   preview = {
          --     type = "split",
          --     relative = "win",
          --     position = "right",
          --     size = 0.3,
          --   },
        },
      },
    },
    keys = {
      {
        "<leader>dw",
        "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
        desc = "Toggle Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>go",
        "<cmd>Trouble lsp_document_symbols toggle focus=false win.position=left win.size=0.15<cr>",
        desc = "Toggle Document symbols (Trouble)",
      },
      {
        "<leader>gO",
        "<cmd>Trouble lsp_document_symbols open focus=true win.position=left win.size=0.15<cr>",
        desc = "Focus Document symbols(Trouble)",
      },
      {
        "<leader>co",
        "<cmd>Trouble quickfix toggle<cr>",
        desc = "Trouble Quickfix",
      },
    },
  },
}
