require("vim._core.ui2").enable({
  msg = {
    targets = "msg",
  },
})

vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  -- "https://github.com/MunifTanjim/nui.nvim",
  -- "https://github.com/folke/noice.nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/rachartier/tiny-cmdline.nvim",
})

require("tiny-cmdline").setup({
  native_types = {},
  position = {
    y = "20%",
  },
})

-- Mini modules (UI-related)
require("mini.icons").setup({})
MiniIcons.mock_nvim_web_devicons()

require("mini.tabline").setup()
require("mini.cursorword").setup()

local indentscope = require("mini.indentscope")
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "alpha",
    "dashboard",
    "neo-tree",
    "Trouble",
    "lazy",
    "mason",
    "sidekick_terminal",
    "snacks_terminal",
    "snacks_dashboard",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "SnacksDashboardOpened",
  callback = function(data)
    vim.b[data.buf].miniindentscope_disable = true
  end,
})

indentscope.setup({
  symbol = "│",
  draw = {
    animation = indentscope.gen_animation.none(),
  },
  options = {
    try_as_border = true,
  },
})

local diff = require("mini.diff")
diff.setup({ source = diff.gen_source.none() })

-- Noice
-- require("noice").setup({
--   routes = {
--     {
--       filter = {
--         event = "msg_show",
--         kind = "emsg",
--         find = "Pattern not found:",
--       },
--       opts = { skip = true },
--     },
--   },
--   views = {
--     cmdline_popup = { position = { row = "15" } },
--     cmdline_popupmenu = { position = { row = "18" } },
--     mini = {
--       position = { row = 3 },
--       win_options = {
--         winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
--       },
--     },
--   },
--   lsp = {
--     progress = { enabled = false },
--     override = {
--       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--       ["vim.lsp.util.stylize_markdown"] = true,
--     },
--   },
--   presets = {
--     command_palette = true,
--     long_message_to_split = true,
--     lsp_doc_border = true,
--   },
-- })

-- local map = vim.keymap.set
-- map("n", "<leader>snl", function()
--   require("noice").cmd("last")
-- end, { desc = "Noice Last Message" })
-- map("n", "<leader>snh", function()
--   require("noice").cmd("history")
-- end, { desc = "Noice History" })
-- map("n", "<leader>sna", function()
--   require("noice").cmd("all")
-- end, { desc = "Noice All" })
-- map({ "n", "i", "s" }, "<c-f>", function()
--   if not require("noice.lsp").scroll(4) then
--     return "<c-f>"
--   end
-- end, { silent = true, expr = true, desc = "Scroll forward" })
-- map({ "n", "i", "s" }, "<c-b>", function()
--   if not require("noice.lsp").scroll(-4) then
--     return "<c-b>"
--   end
-- end, { silent = true, expr = true, desc = "Scroll backward" })

-- Lualine
local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end

local symbols = require("trouble").statusline({
  mode = "lsp_document_symbols",
  groups = {},
  title = false,
  filter = { range = true },
  format = "{kind_icon}{symbol.name:Normal} >",
})

require("lualine").setup({
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "tokyonight",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      winbar = {
        "alpha",
        "snacks_terminal",
        "sidekick_terminal",
        "dashboard",
        "help",
        "packer",
        "startify",
        "snacks_picker_list",
      },
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      "mode",
      { "macro-recording", fmt = show_macro_recording },
    },
    lualine_b = { { "filetype", fmt = string.upper } },
    lualine_c = {
      { "filename", path = 1 },
    },
    lualine_x = {
      {
        "searchcount",
        maxcount = 999999,
        color = { fg = "#ff9e64" },
      },
      "progress",
      "encoding",
      "fileformat",
      { "lsp_status", icon = "󰀴" },
      {
        function()
          return " "
        end,
        color = function()
          local status = require("sidekick.status").get()
          if status then
            return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
          end
        end,
        cond = function()
          local status = require("sidekick.status")
          return status.get() ~= nil
        end,
      },
      {
        function()
          local status = require("sidekick.status").cli()
          return " " .. (#status > 1 and #status or "")
        end,
        cond = function()
          return #require("sidekick.status").cli() > 0
        end,
        color = function()
          return "Special"
        end,
      },
    },
    lualine_y = { "b:gitsigns_status" },
    lualine_z = { "branch" },
  },
  winbar = {
    lualine_a = { { symbols.get, draw_empty = true } },
    lualine_y = { { "diagnostics", draw_empty = true } },
  },
  inactive_winbar = {
    lualine_b = { { "filename", path = 1, draw_empty = true } },
    lualine_y = { { "diagnostics", draw_empty = true } },
  },
  tabline = {},
  extensions = { "lazy", "man", "mason", "quickfix", "trouble" },
})
