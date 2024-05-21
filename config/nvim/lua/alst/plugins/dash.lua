return {
  {
    "mrjones2014/dash.nvim",
    cmd = { "Dash", "DashWord" },
    keys = {
      {
        "D",
        function()
          require("dash").search(false, vim.fn.expand("<cword>"))
        end,
        desc = "Dash",
      },
      {
        "<Leader>D",
        function()
          require("dash").search(false, vim.fn.expand("<cword>"))
        end,
        desc = "Dash",
      },
    },
    build = "make install",
    opts = {
      file_type_keywords = {
        elixir = "ex"
      }
    }
  },
}
