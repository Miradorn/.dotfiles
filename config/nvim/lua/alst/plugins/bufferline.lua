return {
  {
    "akinsho/nvim-bufferline.lua",
    event = "VeryLazy",
    dependencies = {
      "catppuccin/nvim",
    },
    opts = function()
      local highlights = require("catppuccin.groups.integrations.bufferline").get()
      return {
        highlights = highlights,
        options = {
          separator_style = "slant",
          -- diagnostics = "nvim_lsp",
          -- diagnostics_indicator = function(_, _, diagnostics_dict, _)
          --     local s = " "
          --     for e, n in pairs(diagnostics_dict) do
          --         local sym = e == "error" and " "
          --             or (e == "warning" and " " or (e == "hint" and " " or " "))
          --         s = s .. n .. sym
          --     end
          --     return s
          -- end,
          offsets = {
            {
              filetype = "neo-tree",
              text = "Filetree",
              highlight = "Directory",
              seperator = true,
            },
          },
        },
      }
    end,
    config = function()
      require("bufferline").setup()
    end,
  },
}
