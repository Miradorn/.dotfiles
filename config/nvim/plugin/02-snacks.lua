vim.pack.add({
  'https://github.com/folke/snacks.nvim',
  'https://github.com/folke/trouble.nvim',
})

require("trouble").setup({
  modes = {
    lsp_document_symbols = { groups = {} },
    diagnostics = { groups = {} },
  },
})

require("snacks").setup({
  explorer = {
    replace_netrw = true,
  },
  styles = {
    dashboard = {
      wo = { conceallevel = 0, list = false },
    },
  },
  bigfile = { enabled = true },
  image = { enabled = true },
  dashboard = {
    enabled = true,
    width = math.floor(vim.o.columns * 0.5),
    formats = {
      key = function() return { "" } end,
      icon = function(item)
        -- Resolve file/directory icons via devicons
        local icon_res
        if item.file and (item.icon == "file" or item.icon == "directory") then
          icon_res = Snacks.dashboard.icon(item.file, item.icon)
        elseif item.icon then
          icon_res = { item.icon .. " ", width = 2, hl = item.icon_hl or "icon" }
        end

        if item.key then
          return {
            { "[", hl = "special" }, { item.key, hl = "key" }, { "] ", hl = "special" },
            icon_res or { "" },
          }
        end
        return icon_res or { "" }
      end,
      file = function(item, ctx)
        local fname = vim.fn.fnamemodify(item.file, ":~")
        fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
        if #fname > ctx.width then
          local dir = vim.fn.fnamemodify(fname, ":h")
          local file = vim.fn.fnamemodify(fname, ":t")
          if dir and file then
            file = file:sub(-(ctx.width - #dir - 2))
            fname = dir .. "/…" .. file
          end
        end
        local dir, file = fname:match("^(.*)/(.+)$")
        return dir and { { dir .. "/", hl = "SnacksPickerDir" }, { file, hl = "SnacksDashboardFile" } }
          or { { fname, hl = "SnacksDashboardFile" } }
      end,
    },
    preset = {
      header = [[
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    },
    sections = {
      { section = "header", padding = 1 },
      { title = "MRU " .. vim.fn.fnamemodify(".", ":~"), padding = 1 },
      { section = "recent_files", cwd = true, limit = 8, padding = 1 },
      { title = "MRU", padding = 1 },
      { section = "recent_files", limit = 8, padding = 1 },
      { title = "Bookmarks", padding = 1 },
      { section = "keys", gap = 1, padding = 1 },
    },
  },
  picker = {
    enabled = true,
    layout = "telescope",
    matcher = {
      frecency = true
    },
    formatters = {
      file = {
        filename_first = true,
        truncate = 200,
      },
    },
    auto_confirm = false,
    ui_select = true,
    actions = require("trouble.sources.snacks").actions,
    sources = {
      explorer = {
        auto_close = true,
        hidden = true,
        ignored = true,
        win = {
          list = {
            keys = {
              ['/'] = false,
              ['<c-c>'] = 'cancel',
            },
          },
        },
        layout = {
          cycle = false,
          layout = {
            box = 'horizontal',
            position = 'float',
            height = 0.9,
            width = 0.9,
            border = 'rounded',
            { win = 'list' },
            { win = 'preview', width = 0, border = 'left' },
          },
        },
      }
    },
    win = {
      input = {
        keys = {
          ["<c-a>"] = "<c-a>",
          ["<c-b>"] = "<c-b>",
          ["<c-f>"] = "<c-f>",
          ["<c-d>"] = { "preview_scroll_down", mode = { "n", "i" }, },
          ["<c-u>"] = { "preview_scroll_up", mode = { "n", "i" }, },
          ["<c-t>"] = { "trouble_open", mode = { "n", "i" }, },
        },
      },
    },
  },
  terminal = {
    interactive = false,
  },
  input = {
    enabled = true,
  },
  statuscolumn = {
    enabled = false, -- replaced by mini.statuscolumn, see plugin/ui.lua
    left = { "mark", "sign" },
    right = { "fold", "git" },
    folds = {
      open = true,
      git_hl = true,
    },
    git = {
      patterns = { "GitSign", "MiniDiffSign" },
    },
    refresh = 50,
  },
  -- notifier = { enabled = true },
})

-- Snacks keymaps
local map = vim.keymap.set
map("n", "<leader>tt", function() Snacks.terminal(nil, { win = { position = "float", border = 'rounded' } }) end, { desc = "ToggleTerm" })
map("n", "<leader>tm", function() Snacks.picker.notifications() end, { desc = "Show notification history" })
map("n", "<leader>ss", function() Snacks.picker() end, { desc = "Snacks pickers" })
map("n", "<leader>sr", function() Snacks.picker.recent() end, { desc = "Snacks most recent picker" })
map("n", "<C-p>", function() Snacks.picker.smart { filter = { cwd = true }, follow = true } end, { desc = "Show File Picker" })
map("n", "<Leader>td", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics picker" })
map("n", "<Leader>bf", function() Snacks.picker.buffers() end, { desc = "Buffer picker" })
map("n", "<Leader>gc", function() Snacks.picker.git_log() end, { desc = "Git Commits picker" })
map("n", "<Leader>gbr", function() Snacks.picker.git_branches() end, { desc = "Git Branches picker" })
map("n", "<Leader>gbc", function() Snacks.picker.git_log_file() end, { desc = "Git Buffer Commits picker" })
map("n", "<Leader>gs", function() Snacks.picker.git_status() end, { desc = "Git status picker" })
map("n", "<Leader>tk", function() Snacks.picker.keymaps() end, { desc = "Keymap picker" })
map({ "n", "v" }, "<leader>*", function() Snacks.picker.grep_word { live = false } end, { desc = "Grep word under cursor" })
map({ "n", "v" }, "<leader>gu", function() Snacks.picker.undo() end, { desc = "Undotree" })
map("n", "<leader>n", function() Snacks.explorer() end, { desc = "Explorer" })
map("n", "<leader>N", function() Snacks.explorer.reveal() end, { desc = "Reveal in explorer" })
map("n", "<leader>evv", function() Snacks.picker.files { cwd = "~/.dotfiles/config/nvim/", follow = true } end, { desc = "Neovim config picker" })
map("n", "<leader>ezz", function() Snacks.picker.files { cwd = "~/.dotfiles/config/zellij/", follow = true } end, { desc = "Zellij config picker" })
map("n", "<leader>ecc", function() Snacks.picker.files { cwd = "~/.dotfiles/", follow = true } end, { desc = "Config picker" })
