-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/alexander/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/alexander/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/alexander/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/alexander/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/alexander/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n\25\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\nsetup+\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\fComment\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n\29\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\14lazy_load?\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0 luasnip.loaders.from_vscode\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n≈\1\0\1\5\0\4\0\0069\1\0\0005\3\2\0005\4\1\0=\4\3\3B\1\2\1K\0\1\0\vlayout\1\0\3\18update_events.TextChanged,InsertLeave,WinEnter,WinLeave\16attach_mode\vglobal\16filter_kind\1\1\0\3\26placement_editor_edge\2\14min_width\3-\22default_direction\nright\nsetup*\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\vaerial\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins/bufferline\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n∫\3\0\1\b\0\23\0\0269\1\0\0009\1\1\1B\1\1\0029\2\2\0009\2\3\0025\4\a\0005\5\5\0005\6\4\0=\6\6\5=\5\b\0045\5\f\0005\6\n\0009\a\t\1=\a\v\6=\6\r\5=\5\14\0045\5\15\0005\6\16\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\5=\5\22\4B\2\2\1K\0\1\0\17integrations\nnavic\1\0\1\fenabled\2\15native_lsp\1\0\1\fenabled\2\21indent_blankline\1\0\2\26colored_indent_levels\1\fenabled\2\1\0\n\fneotest\2\rgitsigns\2\15treesitter\2\rmarkdown\2\vaerial\2\15illuminate\2\14telescope\2\vnotify\2\tleap\2\rnvimtree\2\22custom_highlights\fComment\1\0\0\afg\1\0\0\rsubtext0\vstyles\1\0\0\rcomments\1\0\0\1\2\0\0\vitalic\nsetup\15catppuccin\16get_palette\24catppuccin.palettesµ\1\1\0\4\0\n\0\0146\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0005\2\5\0003\3\6\0B\0\3\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\27colorscheme catppuccin\17nvim_command\bapi\0\1\3\0\0\15catppuccin\24catppuccin.palettes\vimport\14macchiato\23catppuccin_flavour\6g\bvim\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tmux"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dash.nvim"] = {
    config = { "\27LJ\2\np\0\1\6\0\6\0\b9\1\0\0005\3\1\0005\4\3\0005\5\2\0=\5\4\4=\4\5\3B\1\2\1K\0\1\0\23file_type_keywords\velixir\1\0\0\1\3\0\0\aex\velixir\1\0\1\18search_engine\vgoogle\nsetup(\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\tdash\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/dash.nvim",
    url = "https://github.com/mrjones2014/dash.nvim"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n|\0\1\a\1\b\0\f-\1\0\0009\1\0\0015\3\4\0005\4\2\0009\5\1\0B\5\1\2=\5\3\4=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\0¿\ninput\1\0\1\rrelative\veditor\vselect\1\0\0\14telescope\1\0\0\17get_dropdown\nsetup8\1\1\5\0\3\0\0066\1\0\0'\3\1\0003\4\2\0B\1\3\0012\0\0ÄK\0\1\0\0\21telescope.themes\vimport,\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\rdressing\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\nX\0\1\6\0\6\0\b9\1\0\0005\3\4\0005\4\2\0005\5\1\0=\5\3\4=\4\5\3B\1\2\1K\0\1\0\14overrides\1\0\0\15extensions\1\0\0\1\0\1\atf\14terraform\nsetup,\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\rfiletype\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fugitive-gitlab.vim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/fugitive-gitlab.vim",
    url = "https://github.com/shumphrey/fugitive-gitlab.vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n\25\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\nsetup,\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\rgitsigns\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["import.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/import.nvim",
    url = "https://github.com/miversen33/import.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n„\1\0\1\5\0\6\0\b9\1\0\0005\3\1\0005\4\2\0=\4\3\0035\4\4\0=\4\5\3B\1\2\1K\0\1\0\21filetype_exclude\1\4\0\0\vaerial\20neotest-summary\nnoice\20buftype_exclude\1\2\0\0\rterminal\1\0\5\25show_current_context\2\19use_treesitter\2\tchar\b‚îÇ\31show_current_context_start\2\28show_first_indent_level\1\nsetup4\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\21indent_blankline\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["instant.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/instant.nvim",
    url = "https://github.com/jbyuki/instant.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\n‚\1\0\1\6\0\v\0\0209\1\0\0005\3\1\0B\1\2\0019\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0'\5\b\0B\1\4\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\t\0'\5\n\0B\1\4\1K\0\1\0\29<Plug>(leap-backward-to)\6Z\28<Plug>(leap-forward-to)\6z\6o\bset\vkeymap\bvim\25add_default_mappings\1\0\1*highlight_unlabeled_phase_one_targets\2\nsetup(\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\tleap\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n\28\0\1\4\0\1\0\0049\1\0\0004\3\0\0B\1\2\1K\0\1\0\tinit+\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\flspkind\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lualine\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neotest = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins/neotest\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-elixir"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/neotest-elixir",
    url = "https://github.com/jfpedroza/neotest-elixir"
  },
  ["neotest-jest"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/neotest-jest",
    url = "https://github.com/haydenmeade/neotest-jest"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins/noice\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins/null-ls\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n\29\0\1\4\0\1\0\0049\1\0\0004\3\0\0B\1\2\1K\0\1\0\nsetup2\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\19nvim-autopairs\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n9\0\1\5\0\4\0\0069\1\0\0005\3\2\0005\4\1\0=\4\3\3B\1\2\1K\0\1\0\fpreview\1\0\0\1\0\1\twrap\2\nsetup'\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\bbqf\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins/cmp\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n\25\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\nsetup-\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\14colorizer\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins/lspconfig\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    config = { "\27LJ\2\n*\0\1\4\0\2\0\0049\1\0\0005\3\1\0B\1\2\1K\0\1\0\1\0\1\rjump_one\1\nsetup,\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\rlspfuzzy\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy",
    url = "https://github.com/ojroques/nvim-lspfuzzy"
  },
  ["nvim-markdown"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-markdown",
    url = "https://github.com/ixru/nvim-markdown"
  },
  ["nvim-navic"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14highlight\2\nsetup\15nvim-navic\frequire\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins/neoclip\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n?\0\1\4\0\4\0\0069\1\0\0005\3\1\0B\1\2\0016\1\2\0=\0\3\1K\0\1\0\vnotify\bvim\1\0\1\14max_width\3<\nsetup*\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\vnotify\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-pqf.git"] = {
    config = { "\27LJ\2\n\25\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\nsetup'\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\bpqf\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-pqf.git",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n\25\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\nsetup-\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\14scrollbar\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins/nvimTree\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins/treesitter\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\n˘\2\0\5\23\0\v\0I4\5\0\0'\6\0\0\18\b\6\0009\6\1\6!\t\1\2B\6\3\0026\a\2\0009\a\3\a9\a\4\a\18\t\6\0B\a\2\2!\b\a\3)\t\0\0006\n\5\0\18\f\0\0B\n\2\4X\r/Ä:\15\1\0146\16\2\0009\16\3\0169\16\4\16\18\18\15\0B\16\2\2 \17\16\t\1\17\b\0X\17\6Ä6\17\6\0009\17\a\17\18\19\5\0\18\20\14\0B\17\3\1X\17\31Ä\18\17\4\0\18\19\15\0!\20\t\bB\17\3\2\18\15\17\0:\17\2\0146\18\6\0009\18\a\18\18\20\5\0004\21\3\0>\15\1\21>\17\2\21B\18\3\0016\18\2\0009\18\3\0189\18\4\18\18\20\15\0B\18\2\2\18\16\18\0 \18\16\t\1\18\b\0X\18\fÄ\18\18\6\0'\19\b\0\18\21\19\0009\19\t\19!\22\t\b!\22\16\22B\19\3\2&\6\19\18X\n\3Ä \t\16\tE\r\3\3R\rœ\1276\n\6\0009\n\a\n\18\f\5\0005\r\n\0>\6\1\rB\n\3\1L\5\2\0\1\3\0\0\0\fMoreMsg\brep\6 \vinsert\ntable\vipairs\20strdisplaywidth\afn\bvim\vformat\r ÔïÅ %d %\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\3\0\0\15treesitter\vindent≈\1\1\1\a\0\14\0\0223\1\0\0009\2\1\0005\4\2\0=\1\3\0043\5\4\0=\5\5\4B\2\2\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0009\6\v\0B\2\4\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\f\0009\6\r\0B\2\4\1K\0\1\0\18closeAllFolds\azM\17openAllFolds\azR\6n\bset\vkeymap\bvim\22provider_selector\0\27fold_virt_text_handler\1\0\0\nsetup\0'\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\bufo\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\n)\0\1\4\0\2\0\0049\1\0\0005\3\1\0B\1\2\1K\0\1\0\1\0\1\fdefault\2\nsetup5\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\22nvim-web-devicons\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n\29\0\1\4\0\1\0\0049\1\0\0004\3\0\0B\1\2\1K\0\1\0\nsetup0\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\17project_nvim\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["smart-splits.nvim"] = {
    config = { "\27LJ\2\n®\3\0\1\a\0\23\00046\1\0\0009\1\1\0019\1\2\0019\2\3\0004\4\0\0B\2\2\1\18\2\1\0'\4\4\0'\5\5\0009\6\6\0B\2\4\1\18\2\1\0'\4\4\0'\5\a\0009\6\b\0B\2\4\1\18\2\1\0'\4\4\0'\5\t\0009\6\n\0B\2\4\1\18\2\1\0'\4\4\0'\5\v\0009\6\f\0B\2\4\1\18\2\1\0'\4\4\0'\5\r\0009\6\14\0B\2\4\1\18\2\1\0'\4\4\0'\5\15\0009\6\16\0B\2\4\1\18\2\1\0'\4\4\0'\5\17\0009\6\18\0B\2\4\1\18\2\1\0'\4\4\0'\5\19\0009\6\20\0B\2\4\1\18\2\1\0'\4\4\0'\5\21\0009\6\22\0B\2\4\1K\0\1\0\22start_resize_mode\n<A-r>\16resize_down\n<A-j>\17resize_right\n<A-l>\14resize_up\n<A-k>\16resize_left\n<A-h>\21move_cursor_down\n<C-j>\22move_cursor_right\n<C-l>\19move_cursor_up\n<C-k>\21move_cursor_left\n<C-h>\6n\nsetup\bset\vkeymap\bvim0\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\17smart-splits\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n>\0\1\4\0\2\0\0049\1\0\0005\3\1\0B\1\2\1K\0\1\0\1\0\2\20start_in_insert\1\16auto_scroll\1\nsetup.\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\15toggleterm\vimport\0" },
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0 undotree_SetFocusWhenToggle\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-elixir",
    url = "https://github.com/elixir-editors/vim-elixir"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "Gwrite", "GBrowse" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter",
    url = "https://github.com/sgur/vim-textobj-parameter"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/alexander/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^sqlite"] = "sqlite.lua"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n\25\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\nsetup-\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\14colorizer\vimport\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n\25\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\nsetup+\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\fComment\vimport\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins/lspconfig\vimport\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: smart-splits.nvim
time([[Config for smart-splits.nvim]], true)
try_loadstring("\27LJ\2\n®\3\0\1\a\0\23\00046\1\0\0009\1\1\0019\1\2\0019\2\3\0004\4\0\0B\2\2\1\18\2\1\0'\4\4\0'\5\5\0009\6\6\0B\2\4\1\18\2\1\0'\4\4\0'\5\a\0009\6\b\0B\2\4\1\18\2\1\0'\4\4\0'\5\t\0009\6\n\0B\2\4\1\18\2\1\0'\4\4\0'\5\v\0009\6\f\0B\2\4\1\18\2\1\0'\4\4\0'\5\r\0009\6\14\0B\2\4\1\18\2\1\0'\4\4\0'\5\15\0009\6\16\0B\2\4\1\18\2\1\0'\4\4\0'\5\17\0009\6\18\0B\2\4\1\18\2\1\0'\4\4\0'\5\19\0009\6\20\0B\2\4\1\18\2\1\0'\4\4\0'\5\21\0009\6\22\0B\2\4\1K\0\1\0\22start_resize_mode\n<A-r>\16resize_down\n<A-j>\17resize_right\n<A-l>\14resize_up\n<A-k>\16resize_left\n<A-h>\21move_cursor_down\n<C-j>\22move_cursor_right\n<C-l>\19move_cursor_up\n<C-k>\21move_cursor_left\n<C-h>\6n\nsetup\bset\vkeymap\bvim0\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\17smart-splits\vimport\0", "config", "smart-splits.nvim")
time([[Config for smart-splits.nvim]], false)
-- Config for: nvim-lspfuzzy
time([[Config for nvim-lspfuzzy]], true)
try_loadstring("\27LJ\2\n*\0\1\4\0\2\0\0049\1\0\0005\3\1\0B\1\2\1K\0\1\0\1\0\1\rjump_one\1\nsetup,\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\rlspfuzzy\vimport\0", "config", "nvim-lspfuzzy")
time([[Config for nvim-lspfuzzy]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n\25\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\nsetup,\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\rgitsigns\vimport\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n≈\1\0\1\5\0\4\0\0069\1\0\0005\3\2\0005\4\1\0=\4\3\3B\1\2\1K\0\1\0\vlayout\1\0\3\18update_events.TextChanged,InsertLeave,WinEnter,WinLeave\16attach_mode\vglobal\16filter_kind\1\1\0\3\26placement_editor_edge\2\14min_width\3-\22default_direction\nright\nsetup*\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\vaerial\vimport\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: nvim-navic
time([[Config for nvim-navic]], true)
try_loadstring("\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14highlight\2\nsetup\15nvim-navic\frequire\0", "config", "nvim-navic")
time([[Config for nvim-navic]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins/bufferline\vimport\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n„\1\0\1\5\0\6\0\b9\1\0\0005\3\1\0005\4\2\0=\4\3\0035\4\4\0=\4\5\3B\1\2\1K\0\1\0\21filetype_exclude\1\4\0\0\vaerial\20neotest-summary\nnoice\20buftype_exclude\1\2\0\0\rterminal\1\0\5\25show_current_context\2\19use_treesitter\2\tchar\b‚îÇ\31show_current_context_start\2\28show_first_indent_level\1\nsetup4\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\21indent_blankline\vimport\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins/neoclip\vimport\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n∫\3\0\1\b\0\23\0\0269\1\0\0009\1\1\1B\1\1\0029\2\2\0009\2\3\0025\4\a\0005\5\5\0005\6\4\0=\6\6\5=\5\b\0045\5\f\0005\6\n\0009\a\t\1=\a\v\6=\6\r\5=\5\14\0045\5\15\0005\6\16\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\5=\5\22\4B\2\2\1K\0\1\0\17integrations\nnavic\1\0\1\fenabled\2\15native_lsp\1\0\1\fenabled\2\21indent_blankline\1\0\2\26colored_indent_levels\1\fenabled\2\1\0\n\fneotest\2\rgitsigns\2\15treesitter\2\rmarkdown\2\vaerial\2\15illuminate\2\14telescope\2\vnotify\2\tleap\2\rnvimtree\2\22custom_highlights\fComment\1\0\0\afg\1\0\0\rsubtext0\vstyles\1\0\0\rcomments\1\0\0\1\2\0\0\vitalic\nsetup\15catppuccin\16get_palette\24catppuccin.palettesµ\1\1\0\4\0\n\0\0146\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0005\2\5\0003\3\6\0B\0\3\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\27colorscheme catppuccin\17nvim_command\bapi\0\1\3\0\0\15catppuccin\24catppuccin.palettes\vimport\14macchiato\23catppuccin_flavour\6g\bvim\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n?\0\1\4\0\4\0\0069\1\0\0005\3\1\0B\1\2\0016\1\2\0=\0\3\1K\0\1\0\vnotify\bvim\1\0\1\14max_width\3<\nsetup*\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\vnotify\vimport\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\n‚\1\0\1\6\0\v\0\0209\1\0\0005\3\1\0B\1\2\0019\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0'\5\b\0B\1\4\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\t\0'\5\n\0B\1\4\1K\0\1\0\29<Plug>(leap-backward-to)\6Z\28<Plug>(leap-forward-to)\6z\6o\bset\vkeymap\bvim\25add_default_mappings\1\0\1*highlight_unlabeled_phase_one_targets\2\nsetup(\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\tleap\vimport\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: nvim-pqf.git
time([[Config for nvim-pqf.git]], true)
try_loadstring("\27LJ\2\n\25\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\nsetup'\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\bpqf\vimport\0", "config", "nvim-pqf.git")
time([[Config for nvim-pqf.git]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n\28\0\1\4\0\1\0\0049\1\0\0004\3\0\0B\1\2\1K\0\1\0\tinit+\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\flspkind\vimport\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n\25\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\nsetup-\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\14scrollbar\vimport\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lualine\vimport\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins/nvimTree\vimport\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins/treesitter\vimport\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins/noice\vimport\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: dash.nvim
time([[Config for dash.nvim]], true)
try_loadstring("\27LJ\2\np\0\1\6\0\6\0\b9\1\0\0005\3\1\0005\4\3\0005\5\2\0=\5\4\4=\4\5\3B\1\2\1K\0\1\0\23file_type_keywords\velixir\1\0\0\1\3\0\0\aex\velixir\1\0\1\18search_engine\vgoogle\nsetup(\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\tdash\vimport\0", "config", "dash.nvim")
time([[Config for dash.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
try_loadstring("\27LJ\2\n˘\2\0\5\23\0\v\0I4\5\0\0'\6\0\0\18\b\6\0009\6\1\6!\t\1\2B\6\3\0026\a\2\0009\a\3\a9\a\4\a\18\t\6\0B\a\2\2!\b\a\3)\t\0\0006\n\5\0\18\f\0\0B\n\2\4X\r/Ä:\15\1\0146\16\2\0009\16\3\0169\16\4\16\18\18\15\0B\16\2\2 \17\16\t\1\17\b\0X\17\6Ä6\17\6\0009\17\a\17\18\19\5\0\18\20\14\0B\17\3\1X\17\31Ä\18\17\4\0\18\19\15\0!\20\t\bB\17\3\2\18\15\17\0:\17\2\0146\18\6\0009\18\a\18\18\20\5\0004\21\3\0>\15\1\21>\17\2\21B\18\3\0016\18\2\0009\18\3\0189\18\4\18\18\20\15\0B\18\2\2\18\16\18\0 \18\16\t\1\18\b\0X\18\fÄ\18\18\6\0'\19\b\0\18\21\19\0009\19\t\19!\22\t\b!\22\16\22B\19\3\2&\6\19\18X\n\3Ä \t\16\tE\r\3\3R\rœ\1276\n\6\0009\n\a\n\18\f\5\0005\r\n\0>\6\1\rB\n\3\1L\5\2\0\1\3\0\0\0\fMoreMsg\brep\6 \vinsert\ntable\vipairs\20strdisplaywidth\afn\bvim\vformat\r ÔïÅ %d %\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\3\0\0\15treesitter\vindent≈\1\1\1\a\0\14\0\0223\1\0\0009\2\1\0005\4\2\0=\1\3\0043\5\4\0=\5\5\4B\2\2\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0009\6\v\0B\2\4\0016\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\f\0009\6\r\0B\2\4\1K\0\1\0\18closeAllFolds\azM\17openAllFolds\azR\6n\bset\vkeymap\bvim\22provider_selector\0\27fold_virt_text_handler\1\0\0\nsetup\0'\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\bufo\vimport\0", "config", "nvim-ufo")
time([[Config for nvim-ufo]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins/null-ls\vimport\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\n|\0\1\a\1\b\0\f-\1\0\0009\1\0\0015\3\4\0005\4\2\0009\5\1\0B\5\1\2=\5\3\4=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\0¿\ninput\1\0\1\rrelative\veditor\vselect\1\0\0\14telescope\1\0\0\17get_dropdown\nsetup8\1\1\5\0\3\0\0066\1\0\0'\3\1\0003\4\2\0B\1\3\0012\0\0ÄK\0\1\0\0\21telescope.themes\vimport,\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\rdressing\vimport\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n\29\0\1\4\0\1\0\0049\1\0\0004\3\0\0B\1\2\1K\0\1\0\nsetup2\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\19nvim-autopairs\vimport\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\n)\0\1\4\0\2\0\0049\1\0\0005\3\1\0B\1\2\1K\0\1\0\1\0\1\fdefault\2\nsetup5\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\22nvim-web-devicons\vimport\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins/neotest\vimport\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n\29\0\1\3\0\1\0\0039\1\0\0B\1\1\1K\0\1\0\14lazy_load?\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0 luasnip.loaders.from_vscode\vimport\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-bqf
time([[Config for nvim-bqf]], true)
try_loadstring("\27LJ\2\n9\0\1\5\0\4\0\0069\1\0\0005\3\2\0005\4\1\0=\4\3\3B\1\2\1K\0\1\0\fpreview\1\0\0\1\0\1\twrap\2\nsetup'\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\bbqf\vimport\0", "config", "nvim-bqf")
time([[Config for nvim-bqf]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\vimport\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n>\0\1\4\0\2\0\0049\1\0\0005\3\1\0B\1\2\1K\0\1\0\1\0\2\20start_in_insert\1\16auto_scroll\1\nsetup.\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\15toggleterm\vimport\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\nX\0\1\6\0\6\0\b9\1\0\0005\3\4\0005\4\2\0005\5\1\0=\5\3\4=\4\5\3B\1\2\1K\0\1\0\14overrides\1\0\0\15extensions\1\0\0\1\0\1\atf\14terraform\nsetup,\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\rfiletype\vimport\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins/cmp\vimport\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n\29\0\1\4\0\1\0\0049\1\0\0004\3\0\0B\1\2\1K\0\1\0\nsetup0\1\0\4\0\3\0\0056\0\0\0'\2\1\0003\3\2\0B\0\3\1K\0\1\0\0\17project_nvim\vimport\0", "config", "project.nvim")
time([[Config for project.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Git', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Git', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Git ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gwrite', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gwrite', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gwrite ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'UndotreeToggle', function(cmdargs)
          require('packer.load')({'undotree'}, { cmd = 'UndotreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'undotree'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('UndotreeToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GBrowse', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'GBrowse', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GBrowse ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
