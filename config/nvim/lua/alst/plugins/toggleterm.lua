return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = {
      { "<leader>tt", desc = "ToggleTerm" },
      { "<esc>",      "<C-\\><C-n>",      desc = "Escape terminal insert mode", mode = { "t" } },
    },
    opts = {
      start_in_insert = false,
      auto_scroll = false,
      open_mapping = [[<leader>tt]],
      close_on_exit = false,
    },
  },
}
