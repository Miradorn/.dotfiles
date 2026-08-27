-- mini.nvim is also used in ui.lua; vim.pack.add is idempotent
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

-- Mini modules (editor)
require("mini.ai").setup()
require("mini.surround").setup({
  mappings = {
    add = "ys",
    delete = "ds",
    replace = "cs",
  },
  search_method = "cover_or_next",
})
require("mini.pairs").setup()
require("mini.comment").setup()
require("mini.splitjoin").setup()
require("mini.bracketed").setup({ window = { suffix = "" } })

-- Yanky
vim.pack.add({
  'https://github.com/gbprod/yanky.nvim',
  'https://github.com/kkharji/sqlite.lua',
})

require("yanky").setup({
  history_length = 1000,
  storage = "sqlite",
})

local map = vim.keymap.set
map("n", "<Leader>ty", function() Snacks.picker.yanky() end, { desc = "Yank history" })
map("i", "<A-y>", function() Snacks.picker.yanky() end, { desc = "Yank history" })

-- Origami
vim.pack.add({ 'https://github.com/chrisgrieser/nvim-origami' })
require("origami").setup({
  autoFold = { enabled = false },
  foldKeymaps = {
    setup = false,
    hOnlyOpensOnFirstColumn = false,
  },
})

-- Dial
vim.pack.add({ 'https://github.com/monaqa/dial.nvim' })
local augend = require("dial.augend")
require("dial.config").augends:register_group {
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.date.alias["%Y-%m-%d"],
    augend.date.alias["%m/%d"],
    augend.date.alias["%H:%M"],
    augend.constant.alias.bool,
    augend.semver.alias.semver,
  },
}
map("n", "<C-a>", "<Plug>(dial-increment)")
map("n", "<C-x>", "<Plug>(dial-decrement)")

-- Vim-matchup
vim.pack.add({ 'https://github.com/andymass/vim-matchup' })

-- Render-markdown
vim.pack.add({ 'https://github.com/MeanderingProgrammer/render-markdown.nvim' })
require("render-markdown").setup({
  latex = { enabled = false },
  completions = { lsp = { enabled = true } },
})

-- Helpview
vim.pack.add({ 'https://github.com/OXY2DEV/helpview.nvim' })

-- Bullets
vim.pack.add({ 'https://github.com/bullets-vim/bullets.vim' })
vim.g.bullets_outline_levels = {}
