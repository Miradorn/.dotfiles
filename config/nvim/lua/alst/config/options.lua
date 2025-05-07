vim.g.mapleader = " "

local opts = {
  mouse = "a",
  -- textwidth = 120,
  scrolloff = 15,
  -- cmdheight = 0,
  wildmode = "longest,full",
  -- lazyredraw = true,
  showmatch = true,
  ignorecase = true,
  smartcase = true,
  tabstop = 2,
  expandtab = true,
  shiftwidth = 2,
  number = true,
  cursorline = true,
  smartindent = true,
  hidden = true,
  -- laststatus = 3,
  guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]],
  guifont = "Victor Mono",
  undofile = true,
  swapfile = false,
  showbreak = "↪\\",
  list = true,
  winborder = "rounded",
  listchars = {
    tab = "» ",
    extends = "›",
    precedes = "‹",
    nbsp = "+",
    trail = "·",
    space = "·",
  },
  conceallevel = 2,
  history = 5000,
  -- signcolumn = "number",
  colorcolumn = { "120" },
  splitbelow = true,
  splitright = true,

  updatetime = 1000,

  completeopt = "menu,menuone,noselect",

  -- Colorscheme
  termguicolors = true,
  background = "dark",

  -- folds
  foldenable = true,
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldlevel = 99,
  foldcolumn = "0",
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
vim.opt.shortmess:append("s")

-- Visuals

vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
  virtual_text = true,
  virtual_lines = false,
  severity_sort = true,
  -- float = { border = "single" },
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.ERROR] = '',
    },
    -- texthl = {
    --   [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
    --   [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
    --   [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
    --   [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
    -- }
  }
}
