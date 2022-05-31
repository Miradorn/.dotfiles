-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/alex/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/alex/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/alex/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/alex/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/alex/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/BetterLua.vim",
    url = "https://github.com/euclidianAce/BetterLua.vim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/Navigator.nvim",
    url = "https://github.com/numToStr/Navigator.nvim"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\nƒ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\26placement_editor_edge\2\14min_width\3-\18update_events.TextChanged,InsertLeave,WinEnter,WinLeave\22default_direction\nright\19close_behavior\vglobal\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nú\4\0\0\f\1\28\1a4\0\0\0006\1\0\0009\1\1\0019\1\2\0016\2\0\0009\2\1\0029\2\3\2)\4\0\0005\5\5\0009\6\4\1=\6\2\5B\2\3\2\21\2\2\0006\3\0\0009\3\1\0039\3\3\3)\5\0\0005\6\a\0009\a\6\1=\a\2\6B\3\3\2\21\3\3\0006\4\0\0009\4\1\0049\4\3\4)\6\0\0005\a\t\0009\b\b\1=\b\2\aB\4\3\2\21\4\4\0006\5\0\0009\5\1\0059\5\3\5)\a\0\0005\b\v\0009\t\n\1=\t\2\bB\5\3\2\21\5\5\0\b\2\0\0X\6\fÄ6\6\f\0009\6\r\6\18\b\0\0005\t\15\0'\n\14\0\18\v\2\0&\n\v\n=\n\16\t-\n\0\0009\n\17\n=\n\18\tB\6\3\1\b\3\0\0X\6\fÄ6\6\f\0009\6\r\6\18\b\0\0005\t\20\0'\n\19\0\18\v\3\0&\n\v\n=\n\16\t-\n\0\0009\n\21\n=\n\18\tB\6\3\1\b\5\0\0X\6\fÄ6\6\f\0009\6\r\6\18\b\0\0005\t\23\0'\n\22\0\18\v\5\0&\n\v\n=\n\16\t-\n\0\0009\n\24\n=\n\18\tB\6\3\1\b\4\0\0X\6\fÄ6\6\f\0009\6\r\6\18\b\0\0005\t\26\0'\n\25\0\18\v\4\0&\n\v\n=\n\16\t-\n\0\0009\n\27\n=\n\18\tB\6\3\1L\0\2\0\0¿\tinfo\1\0\0\n ÔÑ© \thint\1\0\0\n Ôäú \twarn\1\0\0\n Ôî© \nguifg\nerror\ttext\1\0\0\n Ôôô \vinsert\ntable\1\0\0\tHINT\1\0\0\tINFO\1\0\0\tWARN\1\0\0\nERROR\bget\rseverity\15diagnostic\bvim\0ü\2\1\0\a\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\f\0005\4\5\0004\5\3\0005\6\6\0>\6\1\5=\5\a\0045\5\t\0003\6\b\0=\6\n\5=\5\v\4=\4\r\3B\1\2\0012\0\0ÄK\0\1\0\foptions\1\0\0\17custom_areas\nright\1\0\0\0\foffsets\1\0\3\ttext\rNvimTree\14highlight\14Directory\rfiletype\rNvimTree\1\0\2\16diagnostics\rnvim_lsp\20separator_style\nslant\nsetup\15bufferline\tload\19onenord.colors\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tmux"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dash.nvim"] = {
    config = { "\27LJ\2\nâ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\23file_type_keywords\velixir\1\0\0\1\3\0\0\aex\velixir\1\0\1\18search_engine\vgoogle\nsetup\tdash\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/dash.nvim",
    url = "https://github.com/mrjones2014/dash.nvim"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\nç\1\0\0\a\0\t\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4B\4\1\2=\4\6\3=\3\b\2B\0\2\1K\0\1\0\vselect\1\0\0\14telescope\1\0\0\15get_cursor\21telescope.themes\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\nu\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\15extensions\1\0\0\1\0\1\atf\14terraform\nsetup\rfiletype\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nú\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\1\0\3\19use_treesitter\2\28show_first_indent_level\1\tchar\b‚îÇ\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["instant.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/instant.nvim",
    url = "https://github.com/jbyuki/instant.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\no\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\frounded\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n≠\2\0\0\r\0\15\1)'\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\1\0009\2\5\0029\2\6\2B\2\1\0026\3\a\0\18\5\2\0B\3\2\2\v\3\0\0X\3\1ÄL\0\2\0006\3\b\0\18\5\2\0B\3\2\4X\6\17Ä9\b\t\a9\b\n\b9\t\v\a\6\t\f\0X\t\fÄ\15\0\b\0X\t\nÄ6\t\1\0009\t\r\t9\t\14\t\18\v\b\0\18\f\1\0B\t\3\2\b\t\0\0X\t\2Ä9\t\v\aL\t\2\0E\6\3\3R\6Ì\127L\0\2\0\nindex\afn\fnull-ls\tname\14filetypes\vconfig\vipairs\tnext\23get_active_clients\blsp\rfiletype\24nvim_buf_get_option\bapi\bvim\18No Active Lsp˛ˇˇˇ\31≤\6\1\0\b\0'\0<3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0005\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0044\5\0\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\14\0044\5\3\0005\6\15\0006\a\16\0009\a\17\a=\a\18\6>\6\1\5=\5\19\0045\5\20\0=\5\21\0045\5\24\0005\6\22\0>\6\1\0055\6\23\0>\6\2\0055\6\25\0>\0\1\6>\6\6\5=\5\26\0045\5\27\0=\5\28\0045\5\29\0=\5\30\4=\4\31\0035\4 \0004\5\0\0=\5\14\0044\5\0\0=\5\19\0045\5!\0=\5\21\0045\5\"\0=\5\26\0044\5\0\0=\5\28\0044\5\0\0=\5\30\4=\4#\0034\4\0\0=\4$\0035\4%\0=\4&\3B\1\2\1K\0\1\0\15extensions\1\6\0\0\14nvim-tree\rfugitive\bfzf\rquickfix\20symbols-outline\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\vbranch\14lualine_y\1\2\0\0\tdiff\14lualine_x\1\0\1\ticon\bÔî≥\1\b\0\0\0\0\rprogress\rencoding\15fileformat\0\16diagnostics\1\2\1\0\rlocation\ticon\bÓúî\1\2\1\0\rfilesize\ticon\bÔ†±\14lualine_c\1\2\0\0\rfilename\14lualine_b\bfmt\nupper\vstring\1\2\0\0\rfiletype\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\4\25always_divide_middle\2\18icons_enabled\2\17globalstatus\2\ntheme\fonenord\nsetup\flualine\frequire\0\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neoterm = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/neoterm",
    url = "https://github.com/kassio/neoterm"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nl\0\1\4\0\2\0\0039\1\0\0005\3\1\0D\1\2\0\1\6\0\0\17.eslintrc.js\18.eslintrc.cjs\19.eslintrc.yaml\18.eslintrc.yml\19.eslintrc.json\18root_has_fileö\6\1\0\b\0'\0j6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\2\3\0004\3\24\0009\4\4\0019\4\5\0049\4\6\0045\6\a\0=\2\b\0065\a\t\0=\a\n\6B\4\2\2>\4\1\0039\4\4\0019\4\v\4>\4\2\0039\4\f\0019\4\r\4>\4\3\0039\4\f\0019\4\14\4>\4\4\0039\4\f\0019\4\5\0049\4\6\0045\6\15\0=\2\b\0065\a\16\0=\a\n\6B\4\2\2>\4\5\0039\4\f\0019\4\17\4>\4\6\0039\4\f\0019\4\18\4>\4\a\0039\4\f\0019\4\19\4>\4\b\0039\4\f\0019\4\20\4>\4\t\0039\4\f\0019\4\v\0049\4\6\0045\6\21\0B\4\2\2>\4\n\0039\4\f\0019\4\22\4>\4\v\0039\4\f\0019\4\23\4>\4\f\0039\4\24\0019\4\5\0049\4\6\0045\6\25\0=\2\b\0065\a\26\0=\a\n\6B\4\2\2>\4\r\0039\4\24\0019\4\27\4>\4\14\0039\4\24\0019\4\28\4>\4\15\0039\4\24\0019\4\29\4>\4\16\0039\4\24\0019\4\19\4>\4\17\0039\4\24\0019\4\30\0049\4\6\0045\6 \0005\a\31\0=\a\n\6B\4\2\2>\4\18\0039\4\24\0019\4!\4>\4\19\0039\4\24\0019\4\20\4>\4\20\0039\4\24\0019\4\"\4>\4\21\0039\4\24\0019\4\22\4>\4\22\0039\4\24\0019\4#\4>\4\23\0039\4$\0005\6%\0=\3&\6B\4\2\1K\0\1\0\fsources\1\0\0\nsetup\18terraform_fmt\nshfmt\rprettier\1\0\0\1\4\0\0\velixir\feelixir\theex\bmix\14goimports\fgofumpt\ffixjson\1\2\0\0\fgraphql\1\0\0\15formatting\ryamllint\14stylelint\1\0\1\23diagnostics_format\16#{m} [#{c}]\frubocop\17markdownlint\rhadolint\fgitlint\1\2\0\0\fgraphql\1\0\0\ncredo\talex\16diagnostics\15shellcheck\20extra_filetypes\1\2\0\0\fgraphql\14condition\1\0\0\twith\reslint_d\17code_actions\0\rbuiltins\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\në\2\0\0\5\0\a\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0006\2\0\0'\4\4\0B\2\2\0A\0\0\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0006\2\0\0'\4\5\0B\2\2\0A\0\0\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0006\2\0\0'\4\6\0B\2\2\0A\0\0\1K\0\1\0&nvim-autopairs.rules.endwise-ruby%nvim-autopairs.rules.endwise-lua(nvim-autopairs.rules.endwise-elixir\14add_rules\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire™\1\0\2\5\1\b\0\15-\2\0\0009\2\1\0029\2\2\0029\3\0\0018\2\3\2'\3\3\0009\4\0\1&\2\4\2=\2\0\0015\2\5\0009\3\6\0009\3\a\0038\2\3\2=\2\4\1L\1\2\0\2¿\tname\vsource\1\0\4\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\fluasnip\v[Snip]\tpath\v[path]\tmenu\6 \fdefault\fpresets\tkindö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisible[\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\19expand_or_jump\23expand_or_jumpableü\t\1\0\r\0G\0è\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6\f\0005\a\t\0009\b\6\0009\b\a\b9\b\b\bB\b\1\2=\b\n\a9\b\6\0009\b\a\b9\b\b\bB\b\1\2=\b\v\a=\a\a\0065\a\14\0003\b\r\0=\b\15\a=\a\16\0065\a\18\0003\b\17\0=\b\19\a=\a\20\0065\a\21\0=\a\n\0069\a\22\0009\a\23\a=\a\24\0069\a\25\0009\a\26\a9\a\27\a5\t\29\0003\n\28\0=\n\30\t3\n\31\0=\n \t3\n!\0=\n\"\t9\n\6\0009\n#\n=\n$\t9\n\25\0009\n%\nB\n\1\2=\n&\t9\n\25\0009\n'\nB\n\1\2=\n(\t9\n\25\0009\n)\n)\f¸ˇB\n\2\2=\n*\t9\n\25\0009\n)\n)\f\4\0B\n\2\2=\n+\t9\n\25\0009\n,\n5\f-\0B\n\2\2=\n.\t9\n\25\0009\n,\n5\f/\0B\n\2\2=\n0\t9\n\25\0009\n1\nB\n\1\2=\n2\tB\a\2\2=\a\25\0064\a\5\0005\b3\0>\b\1\a5\b4\0>\b\2\a5\b5\0>\b\3\a5\b6\0>\b\4\a=\a7\6B\4\2\0019\4\5\0009\0048\4'\0069\0005\a:\0009\b\25\0009\b\26\b9\b8\bB\b\1\2=\b\25\a4\b\3\0005\t;\0>\t\1\b=\b7\aB\4\3\0019\4\5\0009\0048\4'\6<\0005\a=\0009\b\25\0009\b\26\b9\b8\bB\b\1\2=\b\25\a9\b\6\0009\b7\b4\n\3\0005\v>\0>\v\1\n4\v\3\0005\f?\0>\f\1\vB\b\3\2=\b7\aB\4\3\0019\4@\0\18\6\4\0009\4A\4'\aB\0009\bC\0035\nE\0005\vD\0=\vF\nB\b\2\0A\4\2\0012\0\0ÄK\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<C-e>\nclose\t<CR>\1\0\1\vselect\1\14<C-Space>\1\0\1\vselect\2\fconfirm\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\21select_prev_item\n<C-y>\fdisable\n<C-j>\0\f<S-Tab>\0\n<Tab>\1\0\0\0\vinsert\vpreset\fmapping\14preselect\tNone\18PreselectMode\1\0\1\16completeopt\26menu,menuone,noselect\15formatting\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\1\0\0\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\nsetup\"nvim-autopairs.completion.cmp\flspkind\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nµ\1\0\2\6\1\b\0\0216\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\0\0B\2\2\0016\2\0\0'\4\3\0B\2\2\0029\2\2\2\18\4\0\0\18\5\1\0B\2\3\1-\2\0\0009\2\4\2\a\2\5\0X\2\3Ä9\2\6\0+\3\2\0=\3\a\2K\0\1\0\0¿\24document_formatting\24server_capabilities\vyamlls\tname\vaerial\14on_attach\15illuminate\frequire¸\1\1\1\5\0\14\0\0216\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0026\2\4\0'\4\5\0B\2\2\0029\2\6\2\18\4\1\0B\2\2\2\18\1\2\0009\2\a\0015\3\t\0=\3\b\0025\2\n\0=\1\v\0023\3\f\0=\3\r\0022\0\0ÄL\2\2\0\14on_attach\0\17capabilities\1\0\0\1\0\1\24dynamicRegistration\1\18colorProvider\17textDocument\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvime\0\1\3\0\3\0\a9\1\0\0+\2\1\0=\2\1\0019\1\0\0+\2\1\0=\2\2\1K\0\1\0\30document_range_formatting\24document_formatting\24server_capabilitiesˇ\1\1\1\4\6\f\0!-\1\0\0\18\3\0\0B\1\2\2\a\0\0\0X\2\2Ä-\2\1\0=\2\1\1\a\0\2\0X\2\2Ä-\2\2\0=\2\1\1\a\0\3\0X\2\2Ä-\2\3\0=\2\1\1\a\0\4\0X\2\2Ä5\2\6\0=\2\5\1\a\0\a\0X\2\2Ä-\2\4\0=\2\1\1\a\0\b\0X\2\2Ä-\2\5\0=\2\1\1\a\0\t\0X\2\2Ä3\2\v\0=\2\n\0012\0\0ÄL\1\2\0\1¿\2¿\4¿\3¿\5¿\6¿\0\14on_attach\rtsserver\vjsonls\ngopls\1\0\1\risNeovim\2\17init_options\nvimls\vyamlls\15solargraph\rsettings\16sumneko_luaº\f\1\0\18\0002\0M5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\3B\1\2\0013\1\6\0005\2\27\0005\3\r\0005\4\a\0006\5\b\0009\5\t\0056\a\n\0009\a\v\a'\b\f\0B\5\3\2=\5\v\4=\4\14\0035\4\16\0005\5\15\0=\5\17\0045\5\18\0=\5\19\4=\4\20\0035\4\24\0006\5\b\0009\5\21\0059\5\22\5'\a\23\0+\b\2\0B\5\3\2=\5\25\4=\4\26\3=\3\28\0025\3\"\0005\4\30\0005\5\29\0=\5\31\0045\5 \0=\5!\4=\4#\0035\4%\0005\5$\0=\5&\0045\5(\0005\6'\0=\6)\0055\6.\0005\a-\0006\b\1\0'\n*\0B\b\2\0029\b+\b9\b,\bB\b\1\2=\b,\a=\a+\0063\a/\0006\b0\0\18\n\0\0B\b\2\4H\v\tÄ6\r\1\0'\0151\0B\r\2\0028\r\f\r9\r\3\r\18\15\a\0\18\17\f\0B\15\2\0A\r\0\1F\v\3\3R\vı\1272\0\0ÄK\0\1\0\14lspconfig\npairs\0\1\0\0\1\0\0\fschemas\tjson\16schemastore\ngopls\1\0\0\1\0\1\fgofumpt\2\15solargraph\1\0\0\1\0\1\16diagnostics\1\tyaml\1\0\0\vformat\1\0\1\venable\2\15customTags\1\0\0\0011\0\0\16!And scalar\17!And mapping\18!And sequence\15!If scalar\16!If mapping\17!If sequence\16!Not scalar\17!Not mapping\18!Not sequence\19!Equals scalar\20!Equals mapping\21!Equals sequence\15!Or scalar\16!Or mapping\17!Or sequence\22!FindInMap scalar\24!FindInMap mappping\24!FindInMap sequence\19!Base64 scalar\20!Base64 mapping\21!Base64 sequence\17!Cidr scalar\18!Cidr mapping\19!Cidr sequence\16!Ref scalar\17!Ref mapping\18!Ref sequence\16!Sub scalar\17!Sub mapping\18!Sub sequence\19!GetAtt scalar\20!GetAtt mapping\21!GetAtt sequence\19!GetAZs scalar\20!GetAZs mapping\21!GetAZs sequence\24!ImportValue scalar\25!ImportValue mapping\26!ImportValue sequence\19!Select scalar\20!Select mapping\21!Select sequence\18!Split scalar\19!Split mapping\20!Split sequence\17!Join scalar\18!Join mapping\19!Join sequence\bLua\1\0\0\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fdisable\1\3\0\0\21lowercase-global\19need-check-nil\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\bvim\1\0\1\fversion\vLuaJIT\0\21ensure_installed\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\1\20\0\0\vbashls\ncssls\rdockerls\relixirls\nember\rerlangls\ngopls\fgraphql\thtml\vjsonls\16sumneko_lua\15solargraph\vsvelte\16tailwindcss\16terraformls\rtsserver\nvimls\nvuels\vyamlls\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rjump_one\1\nsetup\rlspfuzzy\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy",
    url = "https://github.com/ojroques/nvim-lspfuzzy"
  },
  ["nvim-markdown"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-markdown",
    url = "https://github.com/ixru/nvim-markdown"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n¨\2\0\0\a\0\r\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\n\0005\4\6\0005\5\4\0004\6\0\0=\6\5\5=\5\a\0045\5\b\0004\6\0\0=\6\5\5=\5\t\4=\4\v\3=\3\f\2B\0\2\1K\0\1\0\tkeys\14telescope\1\0\0\6n\1\0\5\17paste_behind\v<S-CR>\vreplay\6q\vselect\6s\vdelete\6d\npaste\t<CR>\6i\1\0\0\vcustom\1\0\5\17paste_behind\n<C-k>\vreplay\n<c-q>\vselect\n<C-s>\vdelete\n<c-d>\npaste\t<CR>\1\0\1\30enable_persistent_history\2\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n_\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0006\1\0\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\bvim\1\0\1\14max_width\3<\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-pqf.git"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bpqf\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-pqf.git",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nõ\16\0\0\v\0_\0Ô\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0004\4\0\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\14\0005\5\v\0005\6\f\0=\6\r\5=\5\15\4=\4\16\0035\4\17\0004\5\0\0=\5\18\4=\4\19\0035\4\20\0004\5\0\0=\5\21\4=\4\22\0035\4\23\0005\5\24\0004\6\"\0005\a\26\0005\b\25\0=\b\27\a\18\b\0\0'\n\28\0B\b\2\2=\b\29\a>\a\1\0065\a\31\0005\b\30\0=\b\27\a\18\b\0\0'\n \0B\b\2\2=\b\29\a>\a\2\0065\a!\0\18\b\0\0'\n\"\0B\b\2\2=\b\29\a>\a\3\0065\a#\0\18\b\0\0'\n$\0B\b\2\2=\b\29\a>\a\4\0065\a%\0\18\b\0\0'\n&\0B\b\2\2=\b\29\a>\a\5\0065\a'\0\18\b\0\0'\n(\0B\b\2\2=\b\29\a>\a\6\0065\a)\0\18\b\0\0'\n*\0B\b\2\2=\b\29\a>\a\a\0065\a+\0\18\b\0\0'\n,\0B\b\2\2=\b\29\a>\a\b\0065\a-\0\18\b\0\0'\n.\0B\b\2\2=\b\29\a>\a\t\0065\a/\0\18\b\0\0'\n.\0B\b\2\2=\b\29\a>\a\n\0065\a0\0\18\b\0\0'\n1\0B\b\2\2=\b\29\a>\a\v\0065\a2\0\18\b\0\0'\n3\0B\b\2\2=\b\29\a>\a\f\0065\a4\0\18\b\0\0'\n5\0B\b\2\2=\b\29\a>\a\r\0065\a6\0\18\b\0\0'\n7\0B\b\2\2=\b\29\a>\a\14\0065\a8\0\18\b\0\0'\n9\0B\b\2\2=\b\29\a>\a\15\0065\a:\0\18\b\0\0'\n;\0B\b\2\2=\b\29\a>\a\16\0065\a<\0\18\b\0\0'\n=\0B\b\2\2=\b\29\a>\a\17\0065\a>\0\18\b\0\0'\n?\0B\b\2\2=\b\29\a>\a\18\0065\a@\0\18\b\0\0'\nA\0B\b\2\2=\b\29\a>\a\19\0065\aB\0\18\b\0\0'\nC\0B\b\2\2=\b\29\a>\a\20\0065\aD\0\18\b\0\0'\nE\0B\b\2\2=\b\29\a>\a\21\0065\aF\0\18\b\0\0'\nG\0B\b\2\2=\b\29\a>\a\22\0065\aH\0\18\b\0\0'\nI\0B\b\2\2=\b\29\a>\a\23\0065\aJ\0\18\b\0\0'\nK\0B\b\2\2=\b\29\a>\a\24\0065\aL\0\18\b\0\0'\nM\0B\b\2\2=\b\29\a>\a\25\0065\aN\0\18\b\0\0'\nO\0B\b\2\2=\b\29\a>\a\26\0065\aP\0\18\b\0\0'\nQ\0B\b\2\2=\b\29\a>\a\27\0065\aR\0\18\b\0\0'\nS\0B\b\2\2=\b\29\a>\a\28\0065\aT\0\18\b\0\0'\nU\0B\b\2\2=\b\29\a>\a\29\0065\aV\0\18\b\0\0'\n\"\0B\b\2\2=\b\29\a>\a\30\0065\aW\0\18\b\0\0'\n\22\0B\b\2\2=\b\29\a>\a\31\0065\aX\0\18\b\0\0'\nY\0B\b\2\2=\b\29\a>\a \0065\aZ\0\18\b\0\0'\n[\0B\b\2\2=\b\29\a>\a!\6=\6\\\5=\5]\4=\4^\3B\1\2\1K\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\ag?\nclose\1\0\1\bkey\6q\1\0\1\bkey\6o\1\0\1\bkey\6s\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\23toggle_git_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-]>\acb\tedit\bkey\1\0\0\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\1\0\1\16custom_only\1\1\0\2\tside\tleft\nwidth\3\30\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\factions\14open_file\1\0\0\18window_picker\1\0\1\venable\1\1\0\1\18resize_window\1\16diagnostics\1\0\1\venable\2\23hijack_directories\1\0\2\14auto_open\2\venable\2\23ignore_ft_on_setup\1\0\a\15update_cwd\2\17hijack_netrw\2\18open_on_setup\1\16open_on_tab\1\20respect_buf_cwd\1\18hijack_cursor\1\18disable_netrw\1\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nî\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\agV\21node_incremental\agv\21node_decremental\agd\19init_selection\agv\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\fendwise\1\0\1\venable\2\21ensure_installed\1\0\0\1$\0\0\tbash\ncmake\fcomment\bcss\15dockerfile\beex\velixir\belm\verlang\ago\ngomod\fgraphql\bhcl\theex\nhjson\thtml\tjava\15javascript\njsdoc\tjson\njson5\blua\tmake\rmarkdown\vpython\truby\trust\tscss\vsvelte\ttoml\btsx\15typescript\bvim\bvue\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onenord.nvim"] = {
    config = { "\27LJ\2\nØ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vstyles\1\0\0\1\0\6\rkeywords\tNONE\fstrings\tNONE\16diagnostics\14underline\rcomments\vitalic\14functions\vitalic\14variables\tbold\nsetup\fonenord\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/onenord.nvim",
    url = "https://github.com/rmehri01/onenord.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÑ\4\0\0\b\0\30\00026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\r\0005\5\a\0005\6\5\0005\a\4\0=\a\6\6=\6\b\0055\6\n\0009\a\t\0=\a\v\6=\6\f\5=\5\14\4=\4\16\0035\4\18\0005\5\17\0=\5\19\0045\5\20\0=\5\21\4=\4\22\0035\4\24\0005\5\23\0=\5\25\4=\4\26\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\25\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\28\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\29\0B\1\2\1K\0\1\0\rprojects\16media_files\19load_extension\15extensions\bfzf\1\0\0\1\0\4\nfuzzy\2\28override_generic_sorter\2\25override_file_sorter\2\14case_mode\15smart_case\fpickers\15find_files\1\0\1\vhidden\2\17file_browser\1\0\0\1\0\1\vhidden\2\rdefaults\1\0\0\rmappings\1\0\0\6n\n<C-c>\1\0\0\nclose\6i\1\0\0\n<C-b>\1\0\0\1\2\1\0\n<esc>\ttype\fcommand\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0 undotree_SetFocusWhenToggle\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-elixir",
    url = "https://github.com/elixir-editors/vim-elixir"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-textobj-line",
    url = "https://github.com/kana/vim-textobj-line"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter",
    url = "https://github.com/sgur/vim-textobj-parameter"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
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

-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n≠\2\0\0\r\0\15\1)'\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\1\0009\2\5\0029\2\6\2B\2\1\0026\3\a\0\18\5\2\0B\3\2\2\v\3\0\0X\3\1ÄL\0\2\0006\3\b\0\18\5\2\0B\3\2\4X\6\17Ä9\b\t\a9\b\n\b9\t\v\a\6\t\f\0X\t\fÄ\15\0\b\0X\t\nÄ6\t\1\0009\t\r\t9\t\14\t\18\v\b\0\18\f\1\0B\t\3\2\b\t\0\0X\t\2Ä9\t\v\aL\t\2\0E\6\3\3R\6Ì\127L\0\2\0\nindex\afn\fnull-ls\tname\14filetypes\vconfig\vipairs\tnext\23get_active_clients\blsp\rfiletype\24nvim_buf_get_option\bapi\bvim\18No Active Lsp˛ˇˇˇ\31≤\6\1\0\b\0'\0<3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\n\0005\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0044\5\0\0=\5\t\4=\4\v\0035\4\r\0005\5\f\0=\5\14\0044\5\3\0005\6\15\0006\a\16\0009\a\17\a=\a\18\6>\6\1\5=\5\19\0045\5\20\0=\5\21\0045\5\24\0005\6\22\0>\6\1\0055\6\23\0>\6\2\0055\6\25\0>\0\1\6>\6\6\5=\5\26\0045\5\27\0=\5\28\0045\5\29\0=\5\30\4=\4\31\0035\4 \0004\5\0\0=\5\14\0044\5\0\0=\5\19\0045\5!\0=\5\21\0045\5\"\0=\5\26\0044\5\0\0=\5\28\0044\5\0\0=\5\30\4=\4#\0034\4\0\0=\4$\0035\4%\0=\4&\3B\1\2\1K\0\1\0\15extensions\1\6\0\0\14nvim-tree\rfugitive\bfzf\rquickfix\20symbols-outline\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\vbranch\14lualine_y\1\2\0\0\tdiff\14lualine_x\1\0\1\ticon\bÔî≥\1\b\0\0\0\0\rprogress\rencoding\15fileformat\0\16diagnostics\1\2\1\0\rlocation\ticon\bÓúî\1\2\1\0\rfilesize\ticon\bÔ†±\14lualine_c\1\2\0\0\rfilename\14lualine_b\bfmt\nupper\vstring\1\2\0\0\rfiletype\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\4\25always_divide_middle\2\18icons_enabled\2\17globalstatus\2\ntheme\fonenord\nsetup\flualine\frequire\0\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\nƒ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\26placement_editor_edge\2\14min_width\3-\18update_events.TextChanged,InsertLeave,WinEnter,WinLeave\22default_direction\nright\19close_behavior\vglobal\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\no\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\frounded\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: onenord.nvim
time([[Config for onenord.nvim]], true)
try_loadstring("\27LJ\2\nØ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vstyles\1\0\0\1\0\6\rkeywords\tNONE\fstrings\tNONE\16diagnostics\14underline\rcomments\vitalic\14functions\vitalic\14variables\tbold\nsetup\fonenord\frequire\0", "config", "onenord.nvim")
time([[Config for onenord.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nî\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\agV\21node_incremental\agv\21node_decremental\agd\19init_selection\agv\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\fendwise\1\0\1\venable\2\21ensure_installed\1\0\0\1$\0\0\tbash\ncmake\fcomment\bcss\15dockerfile\beex\velixir\belm\verlang\ago\ngomod\fgraphql\bhcl\theex\nhjson\thtml\tjava\15javascript\njsdoc\tjson\njson5\blua\tmake\rmarkdown\vpython\truby\trust\tscss\vsvelte\ttoml\btsx\15typescript\bvim\bvue\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\nú\4\0\0\f\1\28\1a4\0\0\0006\1\0\0009\1\1\0019\1\2\0016\2\0\0009\2\1\0029\2\3\2)\4\0\0005\5\5\0009\6\4\1=\6\2\5B\2\3\2\21\2\2\0006\3\0\0009\3\1\0039\3\3\3)\5\0\0005\6\a\0009\a\6\1=\a\2\6B\3\3\2\21\3\3\0006\4\0\0009\4\1\0049\4\3\4)\6\0\0005\a\t\0009\b\b\1=\b\2\aB\4\3\2\21\4\4\0006\5\0\0009\5\1\0059\5\3\5)\a\0\0005\b\v\0009\t\n\1=\t\2\bB\5\3\2\21\5\5\0\b\2\0\0X\6\fÄ6\6\f\0009\6\r\6\18\b\0\0005\t\15\0'\n\14\0\18\v\2\0&\n\v\n=\n\16\t-\n\0\0009\n\17\n=\n\18\tB\6\3\1\b\3\0\0X\6\fÄ6\6\f\0009\6\r\6\18\b\0\0005\t\20\0'\n\19\0\18\v\3\0&\n\v\n=\n\16\t-\n\0\0009\n\21\n=\n\18\tB\6\3\1\b\5\0\0X\6\fÄ6\6\f\0009\6\r\6\18\b\0\0005\t\23\0'\n\22\0\18\v\5\0&\n\v\n=\n\16\t-\n\0\0009\n\24\n=\n\18\tB\6\3\1\b\4\0\0X\6\fÄ6\6\f\0009\6\r\6\18\b\0\0005\t\26\0'\n\25\0\18\v\4\0&\n\v\n=\n\16\t-\n\0\0009\n\27\n=\n\18\tB\6\3\1L\0\2\0\0¿\tinfo\1\0\0\n ÔÑ© \thint\1\0\0\n Ôäú \twarn\1\0\0\n Ôî© \nguifg\nerror\ttext\1\0\0\n Ôôô \vinsert\ntable\1\0\0\tHINT\1\0\0\tINFO\1\0\0\tWARN\1\0\0\nERROR\bget\rseverity\15diagnostic\bvim\0ü\2\1\0\a\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\f\0005\4\5\0004\5\3\0005\6\6\0>\6\1\5=\5\a\0045\5\t\0003\6\b\0=\6\n\5=\5\v\4=\4\r\3B\1\2\0012\0\0ÄK\0\1\0\foptions\1\0\0\17custom_areas\nright\1\0\0\0\foffsets\1\0\3\ttext\rNvimTree\14highlight\14Directory\rfiletype\rNvimTree\1\0\2\16diagnostics\rnvim_lsp\20separator_style\nslant\nsetup\15bufferline\tload\19onenord.colors\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n¨\2\0\0\a\0\r\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\n\0005\4\6\0005\5\4\0004\6\0\0=\6\5\5=\5\a\0045\5\b\0004\6\0\0=\6\5\5=\5\t\4=\4\v\3=\3\f\2B\0\2\1K\0\1\0\tkeys\14telescope\1\0\0\6n\1\0\5\17paste_behind\v<S-CR>\vreplay\6q\vselect\6s\vdelete\6d\npaste\t<CR>\6i\1\0\0\vcustom\1\0\5\17paste_behind\n<C-k>\vreplay\n<c-q>\vselect\n<C-s>\vdelete\n<c-d>\npaste\t<CR>\1\0\1\30enable_persistent_history\2\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: nvim-lspfuzzy
time([[Config for nvim-lspfuzzy]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rjump_one\1\nsetup\rlspfuzzy\frequire\0", "config", "nvim-lspfuzzy")
time([[Config for nvim-lspfuzzy]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\në\2\0\0\5\0\a\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0006\2\0\0'\4\4\0B\2\2\0A\0\0\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0006\2\0\0'\4\5\0B\2\2\0A\0\0\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0006\2\0\0'\4\6\0B\2\2\0A\0\0\1K\0\1\0&nvim-autopairs.rules.endwise-ruby%nvim-autopairs.rules.endwise-lua(nvim-autopairs.rules.endwise-elixir\14add_rules\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n_\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0006\1\0\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\bvim\1\0\1\14max_width\3<\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\nç\1\0\0\a\0\t\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4B\4\1\2=\4\6\3=\3\b\2B\0\2\1K\0\1\0\vselect\1\0\0\14telescope\1\0\0\15get_cursor\21telescope.themes\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-pqf.git
time([[Config for nvim-pqf.git]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bpqf\frequire\0", "config", "nvim-pqf.git")
time([[Config for nvim-pqf.git]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire™\1\0\2\5\1\b\0\15-\2\0\0009\2\1\0029\2\2\0029\3\0\0018\2\3\2'\3\3\0009\4\0\1&\2\4\2=\2\0\0015\2\5\0009\3\6\0009\3\a\0038\2\3\2=\2\4\1L\1\2\0\2¿\tname\vsource\1\0\4\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\fluasnip\v[Snip]\tpath\v[path]\tmenu\6 \fdefault\fpresets\tkindö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisible[\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\19expand_or_jump\23expand_or_jumpableü\t\1\0\r\0G\0è\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6\f\0005\a\t\0009\b\6\0009\b\a\b9\b\b\bB\b\1\2=\b\n\a9\b\6\0009\b\a\b9\b\b\bB\b\1\2=\b\v\a=\a\a\0065\a\14\0003\b\r\0=\b\15\a=\a\16\0065\a\18\0003\b\17\0=\b\19\a=\a\20\0065\a\21\0=\a\n\0069\a\22\0009\a\23\a=\a\24\0069\a\25\0009\a\26\a9\a\27\a5\t\29\0003\n\28\0=\n\30\t3\n\31\0=\n \t3\n!\0=\n\"\t9\n\6\0009\n#\n=\n$\t9\n\25\0009\n%\nB\n\1\2=\n&\t9\n\25\0009\n'\nB\n\1\2=\n(\t9\n\25\0009\n)\n)\f¸ˇB\n\2\2=\n*\t9\n\25\0009\n)\n)\f\4\0B\n\2\2=\n+\t9\n\25\0009\n,\n5\f-\0B\n\2\2=\n.\t9\n\25\0009\n,\n5\f/\0B\n\2\2=\n0\t9\n\25\0009\n1\nB\n\1\2=\n2\tB\a\2\2=\a\25\0064\a\5\0005\b3\0>\b\1\a5\b4\0>\b\2\a5\b5\0>\b\3\a5\b6\0>\b\4\a=\a7\6B\4\2\0019\4\5\0009\0048\4'\0069\0005\a:\0009\b\25\0009\b\26\b9\b8\bB\b\1\2=\b\25\a4\b\3\0005\t;\0>\t\1\b=\b7\aB\4\3\0019\4\5\0009\0048\4'\6<\0005\a=\0009\b\25\0009\b\26\b9\b8\bB\b\1\2=\b\25\a9\b\6\0009\b7\b4\n\3\0005\v>\0>\v\1\n4\v\3\0005\f?\0>\f\1\vB\b\3\2=\b7\aB\4\3\0019\4@\0\18\6\4\0009\4A\4'\aB\0009\bC\0035\nE\0005\vD\0=\vF\nB\b\2\0A\4\2\0012\0\0ÄK\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<C-e>\nclose\t<CR>\1\0\1\vselect\1\14<C-Space>\1\0\1\vselect\2\fconfirm\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\21select_prev_item\n<C-y>\fdisable\n<C-j>\0\f<S-Tab>\0\n<Tab>\1\0\0\0\vinsert\vpreset\fmapping\14preselect\tNone\18PreselectMode\1\0\1\16completeopt\26menu,menuone,noselect\15formatting\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\1\0\0\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\nsetup\"nvim-autopairs.completion.cmp\flspkind\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: dash.nvim
time([[Config for dash.nvim]], true)
try_loadstring("\27LJ\2\nâ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\23file_type_keywords\velixir\1\0\0\1\3\0\0\aex\velixir\1\0\1\18search_engine\vgoogle\nsetup\tdash\frequire\0", "config", "dash.nvim")
time([[Config for dash.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nú\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\1\0\3\19use_treesitter\2\28show_first_indent_level\1\tchar\b‚îÇ\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nõ\16\0\0\v\0_\0Ô\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0004\4\0\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\14\0005\5\v\0005\6\f\0=\6\r\5=\5\15\4=\4\16\0035\4\17\0004\5\0\0=\5\18\4=\4\19\0035\4\20\0004\5\0\0=\5\21\4=\4\22\0035\4\23\0005\5\24\0004\6\"\0005\a\26\0005\b\25\0=\b\27\a\18\b\0\0'\n\28\0B\b\2\2=\b\29\a>\a\1\0065\a\31\0005\b\30\0=\b\27\a\18\b\0\0'\n \0B\b\2\2=\b\29\a>\a\2\0065\a!\0\18\b\0\0'\n\"\0B\b\2\2=\b\29\a>\a\3\0065\a#\0\18\b\0\0'\n$\0B\b\2\2=\b\29\a>\a\4\0065\a%\0\18\b\0\0'\n&\0B\b\2\2=\b\29\a>\a\5\0065\a'\0\18\b\0\0'\n(\0B\b\2\2=\b\29\a>\a\6\0065\a)\0\18\b\0\0'\n*\0B\b\2\2=\b\29\a>\a\a\0065\a+\0\18\b\0\0'\n,\0B\b\2\2=\b\29\a>\a\b\0065\a-\0\18\b\0\0'\n.\0B\b\2\2=\b\29\a>\a\t\0065\a/\0\18\b\0\0'\n.\0B\b\2\2=\b\29\a>\a\n\0065\a0\0\18\b\0\0'\n1\0B\b\2\2=\b\29\a>\a\v\0065\a2\0\18\b\0\0'\n3\0B\b\2\2=\b\29\a>\a\f\0065\a4\0\18\b\0\0'\n5\0B\b\2\2=\b\29\a>\a\r\0065\a6\0\18\b\0\0'\n7\0B\b\2\2=\b\29\a>\a\14\0065\a8\0\18\b\0\0'\n9\0B\b\2\2=\b\29\a>\a\15\0065\a:\0\18\b\0\0'\n;\0B\b\2\2=\b\29\a>\a\16\0065\a<\0\18\b\0\0'\n=\0B\b\2\2=\b\29\a>\a\17\0065\a>\0\18\b\0\0'\n?\0B\b\2\2=\b\29\a>\a\18\0065\a@\0\18\b\0\0'\nA\0B\b\2\2=\b\29\a>\a\19\0065\aB\0\18\b\0\0'\nC\0B\b\2\2=\b\29\a>\a\20\0065\aD\0\18\b\0\0'\nE\0B\b\2\2=\b\29\a>\a\21\0065\aF\0\18\b\0\0'\nG\0B\b\2\2=\b\29\a>\a\22\0065\aH\0\18\b\0\0'\nI\0B\b\2\2=\b\29\a>\a\23\0065\aJ\0\18\b\0\0'\nK\0B\b\2\2=\b\29\a>\a\24\0065\aL\0\18\b\0\0'\nM\0B\b\2\2=\b\29\a>\a\25\0065\aN\0\18\b\0\0'\nO\0B\b\2\2=\b\29\a>\a\26\0065\aP\0\18\b\0\0'\nQ\0B\b\2\2=\b\29\a>\a\27\0065\aR\0\18\b\0\0'\nS\0B\b\2\2=\b\29\a>\a\28\0065\aT\0\18\b\0\0'\nU\0B\b\2\2=\b\29\a>\a\29\0065\aV\0\18\b\0\0'\n\"\0B\b\2\2=\b\29\a>\a\30\0065\aW\0\18\b\0\0'\n\22\0B\b\2\2=\b\29\a>\a\31\0065\aX\0\18\b\0\0'\nY\0B\b\2\2=\b\29\a>\a \0065\aZ\0\18\b\0\0'\n[\0B\b\2\2=\b\29\a>\a!\6=\6\\\5=\5]\4=\4^\3B\1\2\1K\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\ag?\nclose\1\0\1\bkey\6q\1\0\1\bkey\6o\1\0\1\bkey\6s\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\23toggle_git_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-]>\acb\tedit\bkey\1\0\0\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\1\0\1\16custom_only\1\1\0\2\tside\tleft\nwidth\3\30\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\factions\14open_file\1\0\0\18window_picker\1\0\1\venable\1\1\0\1\18resize_window\1\16diagnostics\1\0\1\venable\2\23hijack_directories\1\0\2\14auto_open\2\venable\2\23ignore_ft_on_setup\1\0\a\15update_cwd\2\17hijack_netrw\2\18open_on_setup\1\16open_on_tab\1\20respect_buf_cwd\1\18hijack_cursor\1\18disable_netrw\1\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÑ\4\0\0\b\0\30\00026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\r\0005\5\a\0005\6\5\0005\a\4\0=\a\6\6=\6\b\0055\6\n\0009\a\t\0=\a\v\6=\6\f\5=\5\14\4=\4\16\0035\4\18\0005\5\17\0=\5\19\0045\5\20\0=\5\21\4=\4\22\0035\4\24\0005\5\23\0=\5\25\4=\4\26\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\25\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\28\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\29\0B\1\2\1K\0\1\0\rprojects\16media_files\19load_extension\15extensions\bfzf\1\0\0\1\0\4\nfuzzy\2\28override_generic_sorter\2\25override_file_sorter\2\14case_mode\15smart_case\fpickers\15find_files\1\0\1\vhidden\2\17file_browser\1\0\0\1\0\1\vhidden\2\rdefaults\1\0\0\rmappings\1\0\0\6n\n<C-c>\1\0\0\nclose\6i\1\0\0\n<C-b>\1\0\0\1\2\1\0\n<esc>\ttype\fcommand\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nl\0\1\4\0\2\0\0039\1\0\0005\3\1\0D\1\2\0\1\6\0\0\17.eslintrc.js\18.eslintrc.cjs\19.eslintrc.yaml\18.eslintrc.yml\19.eslintrc.json\18root_has_fileö\6\1\0\b\0'\0j6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\2\3\0004\3\24\0009\4\4\0019\4\5\0049\4\6\0045\6\a\0=\2\b\0065\a\t\0=\a\n\6B\4\2\2>\4\1\0039\4\4\0019\4\v\4>\4\2\0039\4\f\0019\4\r\4>\4\3\0039\4\f\0019\4\14\4>\4\4\0039\4\f\0019\4\5\0049\4\6\0045\6\15\0=\2\b\0065\a\16\0=\a\n\6B\4\2\2>\4\5\0039\4\f\0019\4\17\4>\4\6\0039\4\f\0019\4\18\4>\4\a\0039\4\f\0019\4\19\4>\4\b\0039\4\f\0019\4\20\4>\4\t\0039\4\f\0019\4\v\0049\4\6\0045\6\21\0B\4\2\2>\4\n\0039\4\f\0019\4\22\4>\4\v\0039\4\f\0019\4\23\4>\4\f\0039\4\24\0019\4\5\0049\4\6\0045\6\25\0=\2\b\0065\a\26\0=\a\n\6B\4\2\2>\4\r\0039\4\24\0019\4\27\4>\4\14\0039\4\24\0019\4\28\4>\4\15\0039\4\24\0019\4\29\4>\4\16\0039\4\24\0019\4\19\4>\4\17\0039\4\24\0019\4\30\0049\4\6\0045\6 \0005\a\31\0=\a\n\6B\4\2\2>\4\18\0039\4\24\0019\4!\4>\4\19\0039\4\24\0019\4\20\4>\4\20\0039\4\24\0019\4\"\4>\4\21\0039\4\24\0019\4\22\4>\4\22\0039\4\24\0019\4#\4>\4\23\0039\4$\0005\6%\0=\3&\6B\4\2\1K\0\1\0\fsources\1\0\0\nsetup\18terraform_fmt\nshfmt\rprettier\1\0\0\1\4\0\0\velixir\feelixir\theex\bmix\14goimports\fgofumpt\ffixjson\1\2\0\0\fgraphql\1\0\0\15formatting\ryamllint\14stylelint\1\0\1\23diagnostics_format\16#{m} [#{c}]\frubocop\17markdownlint\rhadolint\fgitlint\1\2\0\0\fgraphql\1\0\0\ncredo\talex\16diagnostics\15shellcheck\20extra_filetypes\1\2\0\0\fgraphql\14condition\1\0\0\twith\reslint_d\17code_actions\0\rbuiltins\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\nu\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\15extensions\1\0\0\1\0\1\atf\14terraform\nsetup\rfiletype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nµ\1\0\2\6\1\b\0\0216\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\0\0B\2\2\0016\2\0\0'\4\3\0B\2\2\0029\2\2\2\18\4\0\0\18\5\1\0B\2\3\1-\2\0\0009\2\4\2\a\2\5\0X\2\3Ä9\2\6\0+\3\2\0=\3\a\2K\0\1\0\0¿\24document_formatting\24server_capabilities\vyamlls\tname\vaerial\14on_attach\15illuminate\frequire¸\1\1\1\5\0\14\0\0216\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0026\2\4\0'\4\5\0B\2\2\0029\2\6\2\18\4\1\0B\2\2\2\18\1\2\0009\2\a\0015\3\t\0=\3\b\0025\2\n\0=\1\v\0023\3\f\0=\3\r\0022\0\0ÄL\2\2\0\14on_attach\0\17capabilities\1\0\0\1\0\1\24dynamicRegistration\1\18colorProvider\17textDocument\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvime\0\1\3\0\3\0\a9\1\0\0+\2\1\0=\2\1\0019\1\0\0+\2\1\0=\2\2\1K\0\1\0\30document_range_formatting\24document_formatting\24server_capabilitiesˇ\1\1\1\4\6\f\0!-\1\0\0\18\3\0\0B\1\2\2\a\0\0\0X\2\2Ä-\2\1\0=\2\1\1\a\0\2\0X\2\2Ä-\2\2\0=\2\1\1\a\0\3\0X\2\2Ä-\2\3\0=\2\1\1\a\0\4\0X\2\2Ä5\2\6\0=\2\5\1\a\0\a\0X\2\2Ä-\2\4\0=\2\1\1\a\0\b\0X\2\2Ä-\2\5\0=\2\1\1\a\0\t\0X\2\2Ä3\2\v\0=\2\n\0012\0\0ÄL\1\2\0\1¿\2¿\4¿\3¿\5¿\6¿\0\14on_attach\rtsserver\vjsonls\ngopls\1\0\1\risNeovim\2\17init_options\nvimls\vyamlls\15solargraph\rsettings\16sumneko_luaº\f\1\0\18\0002\0M5\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\3B\1\2\0013\1\6\0005\2\27\0005\3\r\0005\4\a\0006\5\b\0009\5\t\0056\a\n\0009\a\v\a'\b\f\0B\5\3\2=\5\v\4=\4\14\0035\4\16\0005\5\15\0=\5\17\0045\5\18\0=\5\19\4=\4\20\0035\4\24\0006\5\b\0009\5\21\0059\5\22\5'\a\23\0+\b\2\0B\5\3\2=\5\25\4=\4\26\3=\3\28\0025\3\"\0005\4\30\0005\5\29\0=\5\31\0045\5 \0=\5!\4=\4#\0035\4%\0005\5$\0=\5&\0045\5(\0005\6'\0=\6)\0055\6.\0005\a-\0006\b\1\0'\n*\0B\b\2\0029\b+\b9\b,\bB\b\1\2=\b,\a=\a+\0063\a/\0006\b0\0\18\n\0\0B\b\2\4H\v\tÄ6\r\1\0'\0151\0B\r\2\0028\r\f\r9\r\3\r\18\15\a\0\18\17\f\0B\15\2\0A\r\0\1F\v\3\3R\vı\1272\0\0ÄK\0\1\0\14lspconfig\npairs\0\1\0\0\1\0\0\fschemas\tjson\16schemastore\ngopls\1\0\0\1\0\1\fgofumpt\2\15solargraph\1\0\0\1\0\1\16diagnostics\1\tyaml\1\0\0\vformat\1\0\1\venable\2\15customTags\1\0\0\0011\0\0\16!And scalar\17!And mapping\18!And sequence\15!If scalar\16!If mapping\17!If sequence\16!Not scalar\17!Not mapping\18!Not sequence\19!Equals scalar\20!Equals mapping\21!Equals sequence\15!Or scalar\16!Or mapping\17!Or sequence\22!FindInMap scalar\24!FindInMap mappping\24!FindInMap sequence\19!Base64 scalar\20!Base64 mapping\21!Base64 sequence\17!Cidr scalar\18!Cidr mapping\19!Cidr sequence\16!Ref scalar\17!Ref mapping\18!Ref sequence\16!Sub scalar\17!Sub mapping\18!Sub sequence\19!GetAtt scalar\20!GetAtt mapping\21!GetAtt sequence\19!GetAZs scalar\20!GetAZs mapping\21!GetAZs sequence\24!ImportValue scalar\25!ImportValue mapping\26!ImportValue sequence\19!Select scalar\20!Select mapping\21!Select sequence\18!Split scalar\19!Split mapping\20!Split sequence\17!Join scalar\18!Join mapping\19!Join sequence\bLua\1\0\0\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fdisable\1\3\0\0\21lowercase-global\19need-check-nil\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\bvim\1\0\1\fversion\vLuaJIT\0\21ensure_installed\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\1\20\0\0\vbashls\ncssls\rdockerls\relixirls\nember\rerlangls\ngopls\fgraphql\thtml\vjsonls\16sumneko_lua\15solargraph\vsvelte\16tailwindcss\16terraformls\rtsserver\nvimls\nvuels\vyamlls\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gpush lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpush", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gpull lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpull", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gblame lua require("packer.load")({'vim-fugitive'}, { cmd = "Gblame", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gstatus lua require("packer.load")({'vim-fugitive'}, { cmd = "Gstatus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
