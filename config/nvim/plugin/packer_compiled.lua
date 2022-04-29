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
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
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
  ["diaglist.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\rdiaglist\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/diaglist.nvim",
    url = "https://github.com/onsails/diaglist.nvim"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
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
  ["fzy-lua-native"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/fzy-lua-native",
    url = "https://github.com/romgrk/fzy-lua-native"
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
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  lspactions = {
    config = { "\27LJ\2\n∫\1\0\0\4\0\n\0\0236\0\0\0009\0\1\0006\1\3\0'\3\4\0B\1\2\0029\1\2\1=\1\2\0006\0\0\0009\0\1\0006\1\3\0'\3\4\0B\1\2\0029\1\5\1=\1\5\0006\0\0\0009\0\6\0009\0\a\0006\1\3\0'\3\4\0B\1\2\0029\1\t\1=\1\b\0K\0\1\0\15codeaction\28textDocument/codeAction\rhandlers\blsp\ninput\15lspactions\frequire\vselect\aui\bvim\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/lspactions",
    url = "https://github.com/RishabhRD/lspactions"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÉ\5\0\0\5\0\31\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\4\25always_divide_middle\2\ntheme\tauto\18icons_enabled\2\17globalstatus\1\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neoterm = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/neoterm",
    url = "https://github.com/kassio/neoterm"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nl\0\1\4\0\2\0\0039\1\0\0005\3\1\0D\1\2\0\1\6\0\0\17.eslintrc.js\18.eslintrc.cjs\19.eslintrc.yaml\18.eslintrc.yml\19.eslintrc.json\18root_has_file±\6\1\0\b\0(\0m6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\2\3\0004\3\25\0009\4\4\0019\4\5\0049\4\6\0045\6\a\0=\2\b\0065\a\t\0=\a\n\6B\4\2\2>\4\1\0039\4\4\0019\4\v\4>\4\2\0039\4\f\0019\4\r\4>\4\3\0039\4\f\0019\4\14\4>\4\4\0039\4\f\0019\4\5\0049\4\6\0045\6\15\0=\2\b\0065\a\16\0=\a\n\6B\4\2\2>\4\5\0039\4\f\0019\4\17\4>\4\6\0039\4\f\0019\4\18\4>\4\a\0039\4\f\0019\4\19\4>\4\b\0039\4\f\0019\4\20\4>\4\t\0039\4\f\0019\4\v\0049\4\6\0045\6\21\0B\4\2\2>\4\n\0039\4\f\0019\4\22\4>\4\v\0039\4\f\0019\4\23\4>\4\f\0039\4\24\0019\4\5\0049\4\6\0045\6\25\0=\2\b\0065\a\26\0=\a\n\6B\4\2\2>\4\r\0039\4\24\0019\4\27\4>\4\14\0039\4\24\0019\4\28\4>\4\15\0039\4\24\0019\4\29\4>\4\16\0039\4\24\0019\4\30\4>\4\17\0039\4\24\0019\4\19\4>\4\18\0039\4\24\0019\4\31\0049\4\6\0045\6!\0005\a \0=\a\n\6B\4\2\2>\4\19\0039\4\24\0019\4\"\4>\4\20\0039\4\24\0019\4\20\4>\4\21\0039\4\24\0019\4#\4>\4\22\0039\4\24\0019\4\22\4>\4\23\0039\4\24\0019\4$\4>\4\24\0039\4%\0005\6&\0=\3'\6B\4\2\1K\0\1\0\fsources\1\0\0\nsetup\18terraform_fmt\nshfmt\rprettier\1\0\0\1\4\0\0\velixir\feelixir\theex\bmix\15lua_format\14goimports\fgofumpt\ffixjson\1\2\0\0\fgraphql\1\0\0\15formatting\ryamllint\14stylelint\1\0\1\23diagnostics_format\16#{m} [#{c}]\frubocop\17markdownlint\rhadolint\fgitlint\1\2\0\0\fgraphql\1\0\0\ncredo\talex\16diagnostics\15shellcheck\20extra_filetypes\1\2\0\0\fgraphql\14condition\1\0\0\twith\reslint_d\17code_actions\0\rbuiltins\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire™\1\0\2\5\1\b\0\15-\2\0\0009\2\1\0029\2\2\0029\3\0\0018\2\3\2'\3\3\0009\4\0\1&\2\4\2=\2\0\0015\2\5\0009\3\6\0009\3\a\0038\2\3\2=\2\4\1L\1\2\0\2¿\tname\vsource\1\0\4\tpath\v[path]\fluasnip\v[Snip]\vbuffer\r[Buffer]\rnvim_lsp\n[LSP]\tmenu\6 \fdefault\fpresets\tkindö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisible[\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\19expand_or_jump\23expand_or_jumpableÿ\a\1\0\r\0?\0m6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6\f\0005\a\t\0009\b\6\0009\b\a\b9\b\b\bB\b\1\2=\b\n\a9\b\6\0009\b\a\b9\b\b\bB\b\1\2=\b\v\a=\a\a\0065\a\14\0003\b\r\0=\b\15\a=\a\16\0065\a\18\0003\b\17\0=\b\19\a=\a\20\0065\a\21\0=\a\n\0069\a\22\0009\a\23\a=\a\24\0069\a\25\0009\a\26\a9\a\27\a5\t\29\0003\n\28\0=\n\30\t3\n\31\0=\n \t3\n!\0=\n\"\t9\n\6\0009\n#\n=\n$\t9\n\25\0009\n%\nB\n\1\2=\n&\t9\n\25\0009\n'\nB\n\1\2=\n(\t9\n\25\0009\n)\n)\f¸ˇB\n\2\2=\n*\t9\n\25\0009\n)\n)\f\4\0B\n\2\2=\n+\t9\n\25\0009\n,\n5\f-\0B\n\2\2=\n.\t9\n\25\0009\n,\n5\f/\0B\n\2\2=\n0\t9\n\25\0009\n1\nB\n\1\2=\n2\tB\a\2\2=\a\25\0064\a\5\0005\b3\0>\b\1\a5\b4\0>\b\2\a5\b5\0>\b\3\a5\b6\0>\b\4\a=\a7\6B\4\2\0019\0048\0\18\6\4\0009\0049\4'\a:\0009\b;\0035\n=\0005\v<\0=\v>\nB\b\2\0A\4\2\0012\0\0ÄK\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<C-e>\nclose\t<CR>\1\0\1\vselect\2\14<C-Space>\1\0\1\vselect\2\fconfirm\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\21select_prev_item\n<C-y>\fdisable\n<C-j>\0\f<S-Tab>\0\n<Tab>\1\0\0\0\vinsert\vpreset\fmapping\14preselect\tNone\18PreselectMode\1\0\1\16completeopt\26menu,menuone,noselect\15formatting\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\1\0\0\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\nsetup\"nvim-autopairs.completion.cmp\flspkind\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
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
    config = { "\27LJ\2\nÈ\1\0\2\6\1\v\0\0226\2\0\0'\4\1\0B\2\2\0029\2\2\0025\4\3\0005\5\4\0=\5\5\4B\2\2\0016\2\0\0'\4\6\0B\2\2\0029\2\2\2\18\4\0\0B\2\2\1-\2\0\0009\2\a\2\a\2\b\0X\2\3Ä9\2\t\0+\3\2\0=\3\n\2K\0\1\0\0¿\24document_formatting\26resolved_capabilities\vyamlls\tname\15illuminate\17handler_opts\1\0\1\vborder\vsingle\1\0\1\tbind\2\14on_attach\18lsp_signature\frequireπ\2\1\1\5\0\17\0\0266\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0026\2\4\0'\4\5\0B\2\2\0029\2\6\2\18\4\1\0B\2\2\2\18\1\2\0009\2\a\0019\2\b\0029\2\t\2+\3\2\0=\3\n\0029\2\a\0015\3\f\0=\3\v\0025\2\r\0=\1\14\0023\3\15\0=\3\16\0022\0\0ÄL\2\2\0\14on_attach\0\17capabilities\1\0\0\1\0\1\24dynamicRegistration\1\18colorProvider\19snippetSupport\19completionItem\15completion\17textDocument\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvimg\0\1\3\0\3\0\a9\1\0\0+\2\1\0=\2\1\0019\1\0\0+\2\1\0=\2\2\1K\0\1\0\30document_range_formatting\24document_formatting\26resolved_capabilitiesÙ\1\1\1\6\4\f\0!-\1\0\0\18\3\0\0B\1\2\0029\2\0\0\a\2\1\0X\2\2Ä-\2\1\0=\2\2\0019\2\0\0\a\2\3\0X\2\2Ä-\2\2\0=\2\2\0019\2\0\0\a\2\4\0X\2\2Ä5\2\6\0=\2\5\0019\2\0\0\a\2\a\0X\2\2Ä-\2\3\0=\2\2\0019\2\0\0\a\2\b\0X\2\2Ä3\2\n\0=\2\t\1\18\4\0\0009\2\v\0\18\5\1\0B\2\3\1K\0\1\0\2¿\3¿\4¿\5¿\nsetup\0\14on_attach\rtsserver\ngopls\1\0\1\risNeovim\2\17init_options\nvimls\vyamlls\rsettings\16sumneko_lua\tnameL\0\1\4\1\3\0\b-\1\0\0\18\3\0\0B\1\2\0016\1\0\0009\1\1\1'\3\2\0B\1\2\1K\0\1\0\6¿\31 do User LspAttachBuffers \bcmd\bvim˘\v\1\0\r\0,\0O6\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0\18\4\1\0B\2\2\4H\5\18Ä9\a\4\0\18\t\6\0B\a\2\3\15\0\a\0X\t\rÄ\18\v\b\0009\t\5\bB\t\2\2\14\0\t\0X\t\bÄ6\t\6\0'\v\a\0\18\f\6\0&\v\f\vB\t\2\1\18\v\b\0009\t\b\bB\t\2\1F\5\3\3R\5Ï\1273\2\t\0005\3\29\0005\4\16\0005\5\n\0006\6\v\0009\6\f\0066\b\r\0009\b\14\b'\t\15\0B\6\3\2=\6\14\5=\5\17\0045\5\19\0005\6\18\0=\6\20\5=\5\21\0045\5\26\0004\6\0\b6\a\v\0009\a\22\a9\a\23\a'\t\24\0B\a\2\2+\b\2\0<\b\a\0066\a\v\0009\a\22\a9\a\23\a'\t\25\0B\a\2\2+\b\2\0<\b\a\6=\6\27\5=\5\28\4=\4\30\0035\4$\0005\5 \0005\6\31\0=\6!\0055\6\"\0=\6#\5=\5%\0045\5'\0005\6&\0=\6(\0053\6)\0009\a*\0003\t+\0B\a\2\0012\0\0ÄK\0\1\0\0\20on_server_ready\0\ngopls\1\0\0\1\0\1\fgofumpt\2\tyaml\1\0\0\vformat\1\0\1\venable\2\15customTags\1\0\0\0011\0\0\16!And scalar\17!And mapping\18!And sequence\15!If scalar\16!If mapping\17!If sequence\16!Not scalar\17!Not mapping\18!Not sequence\19!Equals scalar\20!Equals mapping\21!Equals sequence\15!Or scalar\16!Or mapping\17!Or sequence\22!FindInMap scalar\24!FindInMap mappping\24!FindInMap sequence\19!Base64 scalar\20!Base64 mapping\21!Base64 sequence\17!Cidr scalar\18!Cidr mapping\19!Cidr sequence\16!Ref scalar\17!Ref mapping\18!Ref sequence\16!Sub scalar\17!Sub mapping\18!Sub sequence\19!GetAtt scalar\20!GetAtt mapping\21!GetAtt sequence\19!GetAZs scalar\20!GetAZs mapping\21!GetAZs sequence\24!ImportValue scalar\25!ImportValue mapping\26!ImportValue sequence\19!Select scalar\20!Select mapping\21!Select sequence\18!Split scalar\19!Split mapping\20!Split sequence\17!Join scalar\18!Join mapping\19!Join sequence\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\bvim\1\0\1\fversion\vLuaJIT\0\finstall\16Installing \nprint\17is_installed\15get_server\npairs\1\20\0\0\vbashls\ncssls\rdockerls\relixirls\nember\rerlangls\ngopls\fgraphql\thtml\vjsonls\16sumneko_lua\15solargraph\vsvelte\16tailwindcss\16terraformls\rtsserver\nvimls\nvuels\vyamlls\23nvim-lsp-installer\frequire\0" },
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
  ["nvim-notify"] = {
    config = { "\27LJ\2\n_\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0006\1\0\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\bvim\1\0\1\14max_width\3<\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n˚\15\0\0\v\0_\0Ô\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0004\4\0\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\14\0005\5\f\0005\6\v\0=\6\r\5=\5\15\4=\4\16\0035\4\17\0004\5\0\0=\5\18\4=\4\19\0035\4\20\0004\5\0\0=\5\21\4=\4\22\0035\4\23\0005\5\24\0004\6\"\0005\a\26\0005\b\25\0=\b\27\a\18\b\0\0'\n\28\0B\b\2\2=\b\29\a>\a\1\0065\a\31\0005\b\30\0=\b\27\a\18\b\0\0'\n \0B\b\2\2=\b\29\a>\a\2\0065\a!\0\18\b\0\0'\n\"\0B\b\2\2=\b\29\a>\a\3\0065\a#\0\18\b\0\0'\n$\0B\b\2\2=\b\29\a>\a\4\0065\a%\0\18\b\0\0'\n&\0B\b\2\2=\b\29\a>\a\5\0065\a'\0\18\b\0\0'\n(\0B\b\2\2=\b\29\a>\a\6\0065\a)\0\18\b\0\0'\n*\0B\b\2\2=\b\29\a>\a\a\0065\a+\0\18\b\0\0'\n,\0B\b\2\2=\b\29\a>\a\b\0065\a-\0\18\b\0\0'\n.\0B\b\2\2=\b\29\a>\a\t\0065\a/\0\18\b\0\0'\n.\0B\b\2\2=\b\29\a>\a\n\0065\a0\0\18\b\0\0'\n1\0B\b\2\2=\b\29\a>\a\v\0065\a2\0\18\b\0\0'\n3\0B\b\2\2=\b\29\a>\a\f\0065\a4\0\18\b\0\0'\n5\0B\b\2\2=\b\29\a>\a\r\0065\a6\0\18\b\0\0'\n7\0B\b\2\2=\b\29\a>\a\14\0065\a8\0\18\b\0\0'\n9\0B\b\2\2=\b\29\a>\a\15\0065\a:\0\18\b\0\0'\n;\0B\b\2\2=\b\29\a>\a\16\0065\a<\0\18\b\0\0'\n=\0B\b\2\2=\b\29\a>\a\17\0065\a>\0\18\b\0\0'\n?\0B\b\2\2=\b\29\a>\a\18\0065\a@\0\18\b\0\0'\nA\0B\b\2\2=\b\29\a>\a\19\0065\aB\0\18\b\0\0'\nC\0B\b\2\2=\b\29\a>\a\20\0065\aD\0\18\b\0\0'\nE\0B\b\2\2=\b\29\a>\a\21\0065\aF\0\18\b\0\0'\nG\0B\b\2\2=\b\29\a>\a\22\0065\aH\0\18\b\0\0'\nI\0B\b\2\2=\b\29\a>\a\23\0065\aJ\0\18\b\0\0'\nK\0B\b\2\2=\b\29\a>\a\24\0065\aL\0\18\b\0\0'\nM\0B\b\2\2=\b\29\a>\a\25\0065\aN\0\18\b\0\0'\nO\0B\b\2\2=\b\29\a>\a\26\0065\aP\0\18\b\0\0'\nQ\0B\b\2\2=\b\29\a>\a\27\0065\aR\0\18\b\0\0'\nS\0B\b\2\2=\b\29\a>\a\28\0065\aT\0\18\b\0\0'\nU\0B\b\2\2=\b\29\a>\a\29\0065\aV\0\18\b\0\0'\n\"\0B\b\2\2=\b\29\a>\a\30\0065\aW\0\18\b\0\0'\n\22\0B\b\2\2=\b\29\a>\a\31\0065\aX\0\18\b\0\0'\nY\0B\b\2\2=\b\29\a>\a \0065\aZ\0\18\b\0\0'\n[\0B\b\2\2=\b\29\a>\a!\6=\6\\\5=\5]\4=\4^\3B\1\2\1K\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\ag?\nclose\1\0\1\bkey\6q\1\0\1\bkey\6o\1\0\1\bkey\6s\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\23toggle_git_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-]>\acb\tedit\bkey\1\0\0\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\1\0\1\16custom_only\1\1\0\2\nwidth\3\30\tside\tleft\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\venable\2\15update_cwd\1\factions\14open_file\1\0\0\18window_picker\1\0\0\1\0\1\venable\1\16diagnostics\1\0\1\venable\2\23hijack_directories\1\0\2\venable\2\14auto_open\2\23ignore_ft_on_setup\1\0\6\18hijack_cursor\1\17hijack_netrw\2\16open_on_tab\1\18open_on_setup\1\15update_cwd\1\18disable_netrw\1\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
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
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nc\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\2\17auto_preview\1\25preview_bg_highlight\16NormalFloat\20symbols_outline\6g\bvim\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
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
    config = { "\27LJ\2\n„\3\0\0\b\0\29\0,6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\r\0005\5\a\0005\6\5\0005\a\4\0=\a\6\6=\6\b\0055\6\n\0009\a\t\0=\a\v\6=\6\f\5=\5\14\4=\4\16\0035\4\18\0005\5\17\0=\5\19\0045\5\20\0=\5\21\4=\4\22\0035\4\24\0005\5\23\0=\5\25\4=\4\26\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\25\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\28\0B\1\2\1K\0\1\0\16media_files\19load_extension\15extensions\bfzf\1\0\0\1\0\4\nfuzzy\2\25override_file_sorter\2\14case_mode\15smart_case\28override_generic_sorter\2\fpickers\15find_files\1\0\1\vhidden\2\17file_browser\1\0\0\1\0\1\vhidden\2\rdefaults\1\0\0\rmappings\1\0\0\6n\n<C-c>\1\0\0\nclose\6i\1\0\0\n<C-b>\1\0\0\1\2\1\0\n<esc>\ttype\fcommand\nsetup\14telescope\22telescope.actions\frequire\0" },
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
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\nØ\f\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0è\f                call wilder#setup({'modes': [':']})\n                call wilder#set_option('use_python_remote_plugin', 0)\n                call wilder#set_option('pipeline', [\n                    \\   wilder#branch(\n                    \\     wilder#cmdline_pipeline({\n                    \\       'fuzzy': 1,\n                    \\       'fuzzy_filter': wilder#lua_fzy_filter(),\n                    \\     }),\n                    \\     wilder#vim_search_pipeline(),\n                    \\   ),\n                    \\ ])\n\n                call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({\n                    \\ 'apply_incsearch_fix': 0,\n                    \\ 'highlighter': wilder#lua_fzy_highlighter(),\n                    \\ 'left': [\n                    \\   ' ',\n                    \\   wilder#popupmenu_devicons(),\n                    \\   wilder#popupmenu_buffer_flags({\n                    \\     'flags': ' a + ',\n                    \\     'icons': {'+': 'Ô£™', 'a': 'Ôúì', 'h': 'Ôú£'},\n                    \\   }),\n                    \\ ],\n                    \\ 'right': [\n                    \\   ' ', wilder#popupmenu_scrollbar(),\n                    \\ ],\n                    \\ 'highlights': {\n                    \\   'border': 'FloatBorder',\n                    \\   'default': 'Normal',\n                    \\   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#D08770'}]),\n                    \\ },\n                    \\ 'border': 'rounded',\n                    \\ })))\n            \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/alex/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\nu\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\15extensions\1\0\0\1\0\1\atf\14terraform\nsetup\rfiletype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n_\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0006\1\0\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\bvim\1\0\1\14max_width\3<\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: lspactions
time([[Config for lspactions]], true)
try_loadstring("\27LJ\2\n∫\1\0\0\4\0\n\0\0236\0\0\0009\0\1\0006\1\3\0'\3\4\0B\1\2\0029\1\2\1=\1\2\0006\0\0\0009\0\1\0006\1\3\0'\3\4\0B\1\2\0029\1\5\1=\1\5\0006\0\0\0009\0\6\0009\0\a\0006\1\3\0'\3\4\0B\1\2\0029\1\t\1=\1\b\0K\0\1\0\15codeaction\28textDocument/codeAction\rhandlers\blsp\ninput\15lspactions\frequire\vselect\aui\bvim\0", "config", "lspactions")
time([[Config for lspactions]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n˚\15\0\0\v\0_\0Ô\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0004\4\0\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\14\0005\5\f\0005\6\v\0=\6\r\5=\5\15\4=\4\16\0035\4\17\0004\5\0\0=\5\18\4=\4\19\0035\4\20\0004\5\0\0=\5\21\4=\4\22\0035\4\23\0005\5\24\0004\6\"\0005\a\26\0005\b\25\0=\b\27\a\18\b\0\0'\n\28\0B\b\2\2=\b\29\a>\a\1\0065\a\31\0005\b\30\0=\b\27\a\18\b\0\0'\n \0B\b\2\2=\b\29\a>\a\2\0065\a!\0\18\b\0\0'\n\"\0B\b\2\2=\b\29\a>\a\3\0065\a#\0\18\b\0\0'\n$\0B\b\2\2=\b\29\a>\a\4\0065\a%\0\18\b\0\0'\n&\0B\b\2\2=\b\29\a>\a\5\0065\a'\0\18\b\0\0'\n(\0B\b\2\2=\b\29\a>\a\6\0065\a)\0\18\b\0\0'\n*\0B\b\2\2=\b\29\a>\a\a\0065\a+\0\18\b\0\0'\n,\0B\b\2\2=\b\29\a>\a\b\0065\a-\0\18\b\0\0'\n.\0B\b\2\2=\b\29\a>\a\t\0065\a/\0\18\b\0\0'\n.\0B\b\2\2=\b\29\a>\a\n\0065\a0\0\18\b\0\0'\n1\0B\b\2\2=\b\29\a>\a\v\0065\a2\0\18\b\0\0'\n3\0B\b\2\2=\b\29\a>\a\f\0065\a4\0\18\b\0\0'\n5\0B\b\2\2=\b\29\a>\a\r\0065\a6\0\18\b\0\0'\n7\0B\b\2\2=\b\29\a>\a\14\0065\a8\0\18\b\0\0'\n9\0B\b\2\2=\b\29\a>\a\15\0065\a:\0\18\b\0\0'\n;\0B\b\2\2=\b\29\a>\a\16\0065\a<\0\18\b\0\0'\n=\0B\b\2\2=\b\29\a>\a\17\0065\a>\0\18\b\0\0'\n?\0B\b\2\2=\b\29\a>\a\18\0065\a@\0\18\b\0\0'\nA\0B\b\2\2=\b\29\a>\a\19\0065\aB\0\18\b\0\0'\nC\0B\b\2\2=\b\29\a>\a\20\0065\aD\0\18\b\0\0'\nE\0B\b\2\2=\b\29\a>\a\21\0065\aF\0\18\b\0\0'\nG\0B\b\2\2=\b\29\a>\a\22\0065\aH\0\18\b\0\0'\nI\0B\b\2\2=\b\29\a>\a\23\0065\aJ\0\18\b\0\0'\nK\0B\b\2\2=\b\29\a>\a\24\0065\aL\0\18\b\0\0'\nM\0B\b\2\2=\b\29\a>\a\25\0065\aN\0\18\b\0\0'\nO\0B\b\2\2=\b\29\a>\a\26\0065\aP\0\18\b\0\0'\nQ\0B\b\2\2=\b\29\a>\a\27\0065\aR\0\18\b\0\0'\nS\0B\b\2\2=\b\29\a>\a\28\0065\aT\0\18\b\0\0'\nU\0B\b\2\2=\b\29\a>\a\29\0065\aV\0\18\b\0\0'\n\"\0B\b\2\2=\b\29\a>\a\30\0065\aW\0\18\b\0\0'\n\22\0B\b\2\2=\b\29\a>\a\31\0065\aX\0\18\b\0\0'\nY\0B\b\2\2=\b\29\a>\a \0065\aZ\0\18\b\0\0'\n[\0B\b\2\2=\b\29\a>\a!\6=\6\\\5=\5]\4=\4^\3B\1\2\1K\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\ag?\nclose\1\0\1\bkey\6q\1\0\1\bkey\6o\1\0\1\bkey\6s\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\23toggle_git_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-]>\acb\tedit\bkey\1\0\0\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\1\0\1\16custom_only\1\1\0\2\nwidth\3\30\tside\tleft\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\venable\2\15update_cwd\1\factions\14open_file\1\0\0\18window_picker\1\0\0\1\0\1\venable\1\16diagnostics\1\0\1\venable\2\23hijack_directories\1\0\2\venable\2\14auto_open\2\23ignore_ft_on_setup\1\0\6\18hijack_cursor\1\17hijack_netrw\2\16open_on_tab\1\18open_on_setup\1\15update_cwd\1\18disable_netrw\1\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÉ\5\0\0\5\0\31\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\4\25always_divide_middle\2\ntheme\tauto\18icons_enabled\2\17globalstatus\1\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nî\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\agV\21node_incremental\agv\21node_decremental\agd\19init_selection\agv\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\fendwise\1\0\1\venable\2\21ensure_installed\1\0\0\1$\0\0\tbash\ncmake\fcomment\bcss\15dockerfile\beex\velixir\belm\verlang\ago\ngomod\fgraphql\bhcl\theex\nhjson\thtml\tjava\15javascript\njsdoc\tjson\njson5\blua\tmake\rmarkdown\vpython\truby\trust\tscss\vsvelte\ttoml\btsx\15typescript\bvim\bvue\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n„\3\0\0\b\0\29\0,6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\r\0005\5\a\0005\6\5\0005\a\4\0=\a\6\6=\6\b\0055\6\n\0009\a\t\0=\a\v\6=\6\f\5=\5\14\4=\4\16\0035\4\18\0005\5\17\0=\5\19\0045\5\20\0=\5\21\4=\4\22\0035\4\24\0005\5\23\0=\5\25\4=\4\26\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\25\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\27\1'\3\28\0B\1\2\1K\0\1\0\16media_files\19load_extension\15extensions\bfzf\1\0\0\1\0\4\nfuzzy\2\25override_file_sorter\2\14case_mode\15smart_case\28override_generic_sorter\2\fpickers\15find_files\1\0\1\vhidden\2\17file_browser\1\0\0\1\0\1\vhidden\2\rdefaults\1\0\0\rmappings\1\0\0\6n\n<C-c>\1\0\0\nclose\6i\1\0\0\n<C-b>\1\0\0\1\2\1\0\n<esc>\ttype\fcommand\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\2\17auto_preview\1\25preview_bg_highlight\16NormalFloat\20symbols_outline\6g\bvim\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nú\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\1\0\3\19use_treesitter\2\28show_first_indent_level\1\tchar\b‚îÇ\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nÈ\1\0\2\6\1\v\0\0226\2\0\0'\4\1\0B\2\2\0029\2\2\0025\4\3\0005\5\4\0=\5\5\4B\2\2\0016\2\0\0'\4\6\0B\2\2\0029\2\2\2\18\4\0\0B\2\2\1-\2\0\0009\2\a\2\a\2\b\0X\2\3Ä9\2\t\0+\3\2\0=\3\n\2K\0\1\0\0¿\24document_formatting\26resolved_capabilities\vyamlls\tname\15illuminate\17handler_opts\1\0\1\vborder\vsingle\1\0\1\tbind\2\14on_attach\18lsp_signature\frequireπ\2\1\1\5\0\17\0\0266\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0026\2\4\0'\4\5\0B\2\2\0029\2\6\2\18\4\1\0B\2\2\2\18\1\2\0009\2\a\0019\2\b\0029\2\t\2+\3\2\0=\3\n\0029\2\a\0015\3\f\0=\3\v\0025\2\r\0=\1\14\0023\3\15\0=\3\16\0022\0\0ÄL\2\2\0\14on_attach\0\17capabilities\1\0\0\1\0\1\24dynamicRegistration\1\18colorProvider\19snippetSupport\19completionItem\15completion\17textDocument\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvimg\0\1\3\0\3\0\a9\1\0\0+\2\1\0=\2\1\0019\1\0\0+\2\1\0=\2\2\1K\0\1\0\30document_range_formatting\24document_formatting\26resolved_capabilitiesÙ\1\1\1\6\4\f\0!-\1\0\0\18\3\0\0B\1\2\0029\2\0\0\a\2\1\0X\2\2Ä-\2\1\0=\2\2\0019\2\0\0\a\2\3\0X\2\2Ä-\2\2\0=\2\2\0019\2\0\0\a\2\4\0X\2\2Ä5\2\6\0=\2\5\0019\2\0\0\a\2\a\0X\2\2Ä-\2\3\0=\2\2\0019\2\0\0\a\2\b\0X\2\2Ä3\2\n\0=\2\t\1\18\4\0\0009\2\v\0\18\5\1\0B\2\3\1K\0\1\0\2¿\3¿\4¿\5¿\nsetup\0\14on_attach\rtsserver\ngopls\1\0\1\risNeovim\2\17init_options\nvimls\vyamlls\rsettings\16sumneko_lua\tnameL\0\1\4\1\3\0\b-\1\0\0\18\3\0\0B\1\2\0016\1\0\0009\1\1\1'\3\2\0B\1\2\1K\0\1\0\6¿\31 do User LspAttachBuffers \bcmd\bvim˘\v\1\0\r\0,\0O6\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0\18\4\1\0B\2\2\4H\5\18Ä9\a\4\0\18\t\6\0B\a\2\3\15\0\a\0X\t\rÄ\18\v\b\0009\t\5\bB\t\2\2\14\0\t\0X\t\bÄ6\t\6\0'\v\a\0\18\f\6\0&\v\f\vB\t\2\1\18\v\b\0009\t\b\bB\t\2\1F\5\3\3R\5Ï\1273\2\t\0005\3\29\0005\4\16\0005\5\n\0006\6\v\0009\6\f\0066\b\r\0009\b\14\b'\t\15\0B\6\3\2=\6\14\5=\5\17\0045\5\19\0005\6\18\0=\6\20\5=\5\21\0045\5\26\0004\6\0\b6\a\v\0009\a\22\a9\a\23\a'\t\24\0B\a\2\2+\b\2\0<\b\a\0066\a\v\0009\a\22\a9\a\23\a'\t\25\0B\a\2\2+\b\2\0<\b\a\6=\6\27\5=\5\28\4=\4\30\0035\4$\0005\5 \0005\6\31\0=\6!\0055\6\"\0=\6#\5=\5%\0045\5'\0005\6&\0=\6(\0053\6)\0009\a*\0003\t+\0B\a\2\0012\0\0ÄK\0\1\0\0\20on_server_ready\0\ngopls\1\0\0\1\0\1\fgofumpt\2\tyaml\1\0\0\vformat\1\0\1\venable\2\15customTags\1\0\0\0011\0\0\16!And scalar\17!And mapping\18!And sequence\15!If scalar\16!If mapping\17!If sequence\16!Not scalar\17!Not mapping\18!Not sequence\19!Equals scalar\20!Equals mapping\21!Equals sequence\15!Or scalar\16!Or mapping\17!Or sequence\22!FindInMap scalar\24!FindInMap mappping\24!FindInMap sequence\19!Base64 scalar\20!Base64 mapping\21!Base64 sequence\17!Cidr scalar\18!Cidr mapping\19!Cidr sequence\16!Ref scalar\17!Ref mapping\18!Ref sequence\16!Sub scalar\17!Sub mapping\18!Sub sequence\19!GetAtt scalar\20!GetAtt mapping\21!GetAtt sequence\19!GetAZs scalar\20!GetAZs mapping\21!GetAZs sequence\24!ImportValue scalar\25!ImportValue mapping\26!ImportValue sequence\19!Select scalar\20!Select mapping\21!Select sequence\18!Split scalar\19!Split mapping\20!Split sequence\17!Join scalar\18!Join mapping\19!Join sequence\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\bvim\1\0\1\fversion\vLuaJIT\0\finstall\16Installing \nprint\17is_installed\15get_server\npairs\1\20\0\0\vbashls\ncssls\rdockerls\relixirls\nember\rerlangls\ngopls\fgraphql\thtml\vjsonls\16sumneko_lua\15solargraph\vsvelte\16tailwindcss\16terraformls\rtsserver\nvimls\nvuels\vyamlls\23nvim-lsp-installer\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: diaglist.nvim
time([[Config for diaglist.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\rdiaglist\frequire\0", "config", "diaglist.nvim")
time([[Config for diaglist.nvim]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire™\1\0\2\5\1\b\0\15-\2\0\0009\2\1\0029\2\2\0029\3\0\0018\2\3\2'\3\3\0009\4\0\1&\2\4\2=\2\0\0015\2\5\0009\3\6\0009\3\a\0038\2\3\2=\2\4\1L\1\2\0\2¿\tname\vsource\1\0\4\tpath\v[path]\fluasnip\v[Snip]\vbuffer\r[Buffer]\rnvim_lsp\n[LSP]\tmenu\6 \fdefault\fpresets\tkindö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisible[\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\19expand_or_jump\23expand_or_jumpableÿ\a\1\0\r\0?\0m6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6\f\0005\a\t\0009\b\6\0009\b\a\b9\b\b\bB\b\1\2=\b\n\a9\b\6\0009\b\a\b9\b\b\bB\b\1\2=\b\v\a=\a\a\0065\a\14\0003\b\r\0=\b\15\a=\a\16\0065\a\18\0003\b\17\0=\b\19\a=\a\20\0065\a\21\0=\a\n\0069\a\22\0009\a\23\a=\a\24\0069\a\25\0009\a\26\a9\a\27\a5\t\29\0003\n\28\0=\n\30\t3\n\31\0=\n \t3\n!\0=\n\"\t9\n\6\0009\n#\n=\n$\t9\n\25\0009\n%\nB\n\1\2=\n&\t9\n\25\0009\n'\nB\n\1\2=\n(\t9\n\25\0009\n)\n)\f¸ˇB\n\2\2=\n*\t9\n\25\0009\n)\n)\f\4\0B\n\2\2=\n+\t9\n\25\0009\n,\n5\f-\0B\n\2\2=\n.\t9\n\25\0009\n,\n5\f/\0B\n\2\2=\n0\t9\n\25\0009\n1\nB\n\1\2=\n2\tB\a\2\2=\a\25\0064\a\5\0005\b3\0>\b\1\a5\b4\0>\b\2\a5\b5\0>\b\3\a5\b6\0>\b\4\a=\a7\6B\4\2\0019\0048\0\18\6\4\0009\0049\4'\a:\0009\b;\0035\n=\0005\v<\0=\v>\nB\b\2\0A\4\2\0012\0\0ÄK\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<C-e>\nclose\t<CR>\1\0\1\vselect\2\14<C-Space>\1\0\1\vselect\2\fconfirm\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\21select_prev_item\n<C-y>\fdisable\n<C-j>\0\f<S-Tab>\0\n<Tab>\1\0\0\0\vinsert\vpreset\fmapping\14preselect\tNone\18PreselectMode\1\0\1\16completeopt\26menu,menuone,noselect\15formatting\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\1\0\0\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\nsetup\"nvim-autopairs.completion.cmp\flspkind\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-lspfuzzy
time([[Config for nvim-lspfuzzy]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rjump_one\1\nsetup\rlspfuzzy\frequire\0", "config", "nvim-lspfuzzy")
time([[Config for nvim-lspfuzzy]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nl\0\1\4\0\2\0\0039\1\0\0005\3\1\0D\1\2\0\1\6\0\0\17.eslintrc.js\18.eslintrc.cjs\19.eslintrc.yaml\18.eslintrc.yml\19.eslintrc.json\18root_has_file±\6\1\0\b\0(\0m6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\2\3\0004\3\25\0009\4\4\0019\4\5\0049\4\6\0045\6\a\0=\2\b\0065\a\t\0=\a\n\6B\4\2\2>\4\1\0039\4\4\0019\4\v\4>\4\2\0039\4\f\0019\4\r\4>\4\3\0039\4\f\0019\4\14\4>\4\4\0039\4\f\0019\4\5\0049\4\6\0045\6\15\0=\2\b\0065\a\16\0=\a\n\6B\4\2\2>\4\5\0039\4\f\0019\4\17\4>\4\6\0039\4\f\0019\4\18\4>\4\a\0039\4\f\0019\4\19\4>\4\b\0039\4\f\0019\4\20\4>\4\t\0039\4\f\0019\4\v\0049\4\6\0045\6\21\0B\4\2\2>\4\n\0039\4\f\0019\4\22\4>\4\v\0039\4\f\0019\4\23\4>\4\f\0039\4\24\0019\4\5\0049\4\6\0045\6\25\0=\2\b\0065\a\26\0=\a\n\6B\4\2\2>\4\r\0039\4\24\0019\4\27\4>\4\14\0039\4\24\0019\4\28\4>\4\15\0039\4\24\0019\4\29\4>\4\16\0039\4\24\0019\4\30\4>\4\17\0039\4\24\0019\4\19\4>\4\18\0039\4\24\0019\4\31\0049\4\6\0045\6!\0005\a \0=\a\n\6B\4\2\2>\4\19\0039\4\24\0019\4\"\4>\4\20\0039\4\24\0019\4\20\4>\4\21\0039\4\24\0019\4#\4>\4\22\0039\4\24\0019\4\22\4>\4\23\0039\4\24\0019\4$\4>\4\24\0039\4%\0005\6&\0=\3'\6B\4\2\1K\0\1\0\fsources\1\0\0\nsetup\18terraform_fmt\nshfmt\rprettier\1\0\0\1\4\0\0\velixir\feelixir\theex\bmix\15lua_format\14goimports\fgofumpt\ffixjson\1\2\0\0\fgraphql\1\0\0\15formatting\ryamllint\14stylelint\1\0\1\23diagnostics_format\16#{m} [#{c}]\frubocop\17markdownlint\rhadolint\fgitlint\1\2\0\0\fgraphql\1\0\0\ncredo\talex\16diagnostics\15shellcheck\20extra_filetypes\1\2\0\0\fgraphql\14condition\1\0\0\twith\reslint_d\17code_actions\0\rbuiltins\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\nØ\f\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0è\f                call wilder#setup({'modes': [':']})\n                call wilder#set_option('use_python_remote_plugin', 0)\n                call wilder#set_option('pipeline', [\n                    \\   wilder#branch(\n                    \\     wilder#cmdline_pipeline({\n                    \\       'fuzzy': 1,\n                    \\       'fuzzy_filter': wilder#lua_fzy_filter(),\n                    \\     }),\n                    \\     wilder#vim_search_pipeline(),\n                    \\   ),\n                    \\ ])\n\n                call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({\n                    \\ 'apply_incsearch_fix': 0,\n                    \\ 'highlighter': wilder#lua_fzy_highlighter(),\n                    \\ 'left': [\n                    \\   ' ',\n                    \\   wilder#popupmenu_devicons(),\n                    \\   wilder#popupmenu_buffer_flags({\n                    \\     'flags': ' a + ',\n                    \\     'icons': {'+': 'Ô£™', 'a': 'Ôúì', 'h': 'Ôú£'},\n                    \\   }),\n                    \\ ],\n                    \\ 'right': [\n                    \\   ' ', wilder#popupmenu_scrollbar(),\n                    \\ ],\n                    \\ 'highlights': {\n                    \\   'border': 'FloatBorder',\n                    \\   'default': 'Normal',\n                    \\   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#D08770'}]),\n                    \\ },\n                    \\ 'border': 'rounded',\n                    \\ })))\n            \bcmd\bvim\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gpush lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpush", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gpull lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpull", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gstatus lua require("packer.load")({'vim-fugitive'}, { cmd = "Gstatus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gblame lua require("packer.load")({'vim-fugitive'}, { cmd = "Gblame", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
