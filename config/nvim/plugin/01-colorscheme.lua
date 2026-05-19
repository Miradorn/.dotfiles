vim.pack.add({ 'https://github.com/folke/tokyonight.nvim' })

require("tokyonight").setup({
  style = "moon",
  light_style = "day",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,
  on_highlights = function(hl, c)
    hl.Comment = { fg = c.fg_dark }
    hl.BlinkCmpGhostText = { fg = c.fg_dark }
    hl.CopilotSuggestion = { fg = c.fg_dark }
    hl.SnacksPickerDir = { fg = c.fg_dark }
    hl.SnacksPickerPathHidden = { fg = c.fg_dark }
    hl.SnacksPickerPathIgnored = { fg = c.fg_dark }
    hl.DiagnosticUnnecessary = { fg = c.fg_dark }
    hl.SnacksDashboardFile = { fg = c.fg }
    hl.Search = { bg = c.bg_visual }
    hl.InlineSearchCount = { fg = c.orange }
  end,
})

vim.cmd [[colorscheme tokyonight]]
