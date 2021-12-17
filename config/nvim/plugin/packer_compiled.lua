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
local package_path_str = "/Users/alsc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/alsc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/alsc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/alsc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/alsc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/BetterLua.vim",
    url = "https://github.com/euclidianAce/BetterLua.vim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nç\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0005\3\6\0B\0\3\1K\0\1\0\1\2\0\0\6_\ball\20filetype_extend\fluasnip\14lazy_load\"luasnip.loaders.from_snipmate\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/Navigator.nvim",
    url = "https://github.com/numToStr/Navigator.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tmux"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfeline\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/famiu/feline.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nú\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\1\0\3\tchar\b‚îÇ\19use_treesitter\2\28show_first_indent_level\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  neoterm = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/neoterm",
    url = "https://github.com/kassio/neoterm"
  },
  ["nord.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bset\tnord\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nã\5\0\0\6\0\30\0X6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\2\26\0009\3\3\0019\3\4\3>\3\1\0029\3\3\0019\3\5\3>\3\2\0029\3\3\0019\3\6\3>\3\3\0029\3\3\0019\3\a\3>\3\4\0029\3\b\0019\3\t\3>\3\5\0029\3\b\0019\3\4\3>\3\6\0029\3\b\0019\3\n\3>\3\a\0029\3\b\0019\3\v\3>\3\b\0029\3\b\0019\3\f\3>\3\t\0029\3\b\0019\3\a\0039\3\r\0035\5\14\0B\3\2\2>\3\n\0029\3\b\0019\3\15\3>\3\v\0029\3\b\0019\3\16\3>\3\f\0029\3\b\0019\3\17\3>\3\r\0029\3\18\0019\3\4\3>\3\14\0029\3\18\0019\3\19\3>\3\15\0029\3\18\0019\3\20\3>\3\16\0029\3\18\0019\3\21\3>\3\17\0029\3\18\0019\3\22\3>\3\18\0029\3\18\0019\3\v\3>\3\19\0029\3\18\0019\3\23\3>\3\20\0029\3\18\0019\3\24\3>\3\21\0029\3\18\0019\3\f\3>\3\22\0029\3\18\0019\3\25\3>\3\23\0029\3\18\0019\3\15\3>\3\24\0029\3\18\0019\3\26\3>\3\25\0029\3\27\0005\5\28\0=\2\29\5B\3\2\1K\0\1\0\fsources\1\0\0\nsetup\18terraform_fmt\nshfmt\rprettier\bmix\15lua_format\14goimports\fgofumpt\ffixjson\15formatting\ryamllint\15write_good\14stylelint\1\0\1\23diagnostics_format\16#{m} [#{c}]\twith\frubocop\17markdownlint\rhadolint\ncredo\16diagnostics\15shellcheck\rgitsigns\14gitrebase\reslint_d\17code_actions\rbuiltins\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire∂\1\0\2\5\1\b\0\15-\2\0\0009\2\1\0029\2\2\0029\3\0\0018\2\3\2'\3\3\0009\4\0\1&\2\4\2=\2\0\0015\2\5\0009\3\6\0009\3\a\0038\2\3\2=\2\4\1L\1\2\0\2¿\tname\vsource\1\0\5\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\ttmux\v[tmux]\fluasnip\v[Snip]\tpath\v[path]\tmenu\6 \fdefault\fpresets\tkindö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisibleß\6\1\0\v\0002\0Q6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6\t\0005\a\a\0005\b\6\0=\b\b\a=\a\n\0065\a\f\0003\b\v\0=\b\r\a=\a\14\0065\a\16\0003\b\15\0=\b\17\a=\a\18\0065\a\19\0=\a\20\0069\a\21\0009\a\22\a=\a\23\0065\a\25\0003\b\24\0=\b\26\a3\b\27\0=\b\28\a9\b\29\0009\b\30\b=\b\31\a9\b \0009\b!\bB\b\1\2=\b\"\a9\b \0009\b#\bB\b\1\2=\b$\a9\b \0009\b%\b)\n¸ˇB\b\2\2=\b&\a9\b \0009\b%\b)\n\4\0B\b\2\2=\b'\a9\b \0009\b(\bB\b\1\2=\b)\a9\b \0009\b*\bB\b\1\2=\b+\a=\a \0064\a\6\0005\b,\0>\b\1\a5\b-\0>\b\2\a5\b.\0>\b\3\a5\b/\0>\b\4\a5\b0\0>\b\5\a=\a1\6B\4\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\ttmux\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\21select_prev_item\fmapping\n<C-y>\fdisable\vconfig\f<S-Tab>\0\n<Tab>\1\0\0\0\14preselect\tNone\18PreselectMode\15completion\1\0\1\16completeopt\26menu,menuone,noselect\15formatting\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\18documentation\1\0\0\vborder\1\0\0\1\t\0\0\b‚ï≠\b‚îÄ\b‚ïÆ\b‚îÇ\b‚ïØ\b‚îÄ\b‚ï∞\b‚îÇ\nsetup\"nvim-autopairs.completion.cmp\flspkind\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nÈ\1\0\2\6\1\v\0\0226\2\0\0'\4\1\0B\2\2\0029\2\2\0025\4\3\0005\5\4\0=\5\5\4B\2\2\0016\2\0\0'\4\6\0B\2\2\0029\2\2\2\18\4\0\0B\2\2\1-\2\0\0009\2\a\2\a\2\b\0X\2\3Ä9\2\t\0+\3\2\0=\3\n\2K\0\1\0\0¿\24document_formatting\26resolved_capabilities\vyamlls\tname\15illuminate\17handler_opts\1\0\1\vborder\vsingle\1\0\1\tbind\2\14on_attach\18lsp_signature\frequireπ\2\1\1\5\0\17\0\0266\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0026\2\4\0'\4\5\0B\2\2\0029\2\6\2\18\4\1\0B\2\2\2\18\1\2\0009\2\a\0019\2\b\0029\2\t\2+\3\2\0=\3\n\0029\2\a\0015\3\f\0=\3\v\0025\2\r\0=\1\14\0023\3\15\0=\3\16\0022\0\0ÄL\2\2\0\14on_attach\0\17capabilities\1\0\0\1\0\1\24dynamicRegistration\1\18colorProvider\19snippetSupport\19completionItem\15completion\17textDocument\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvimg\0\1\3\0\3\0\a9\1\0\0+\2\1\0=\2\1\0019\1\0\0+\2\1\0=\2\2\1K\0\1\0\30document_range_formatting\24document_formatting\26resolved_capabilitiesÙ\1\1\1\6\4\f\0!-\1\0\0\18\3\0\0B\1\2\0029\2\0\0\a\2\1\0X\2\2Ä-\2\1\0=\2\2\0019\2\0\0\a\2\3\0X\2\2Ä-\2\2\0=\2\2\0019\2\0\0\a\2\4\0X\2\2Ä5\2\6\0=\2\5\0019\2\0\0\a\2\a\0X\2\2Ä-\2\3\0=\2\2\0019\2\0\0\a\2\b\0X\2\2Ä3\2\n\0=\2\t\1\18\4\0\0009\2\v\0\18\5\1\0B\2\3\1K\0\1\0\2¿\3¿\4¿\5¿\nsetup\0\14on_attach\rtsserver\ngopls\1\0\1\risNeovim\2\17init_options\nvimls\vyamlls\rsettings\16sumneko_lua\tnameL\0\1\4\1\3\0\b-\1\0\0\18\3\0\0B\1\2\0016\1\0\0009\1\1\1'\3\2\0B\1\2\1K\0\1\0\6¿\31 do User LspAttachBuffers \bcmd\bvim˘\v\1\0\r\0,\0O6\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0\18\4\1\0B\2\2\4H\5\18Ä9\a\4\0\18\t\6\0B\a\2\3\15\0\a\0X\t\rÄ\18\v\b\0009\t\5\bB\t\2\2\14\0\t\0X\t\bÄ6\t\6\0'\v\a\0\18\f\6\0&\v\f\vB\t\2\1\18\v\b\0009\t\b\bB\t\2\1F\5\3\3R\5Ï3\2\t\0005\3\29\0005\4\16\0005\5\n\0006\6\v\0009\6\f\0066\b\r\0009\b\14\b'\t\15\0B\6\3\2=\6\14\5=\5\17\0045\5\19\0005\6\18\0=\6\20\5=\5\21\0045\5\26\0004\6\0\b6\a\v\0009\a\22\a9\a\23\a'\t\24\0B\a\2\2+\b\2\0<\b\a\0066\a\v\0009\a\22\a9\a\23\a'\t\25\0B\a\2\2+\b\2\0<\b\a\6=\6\27\5=\5\28\4=\4\30\0035\4$\0005\5 \0005\6\31\0=\6!\0055\6\"\0=\6#\5=\5%\0045\5'\0005\6&\0=\6(\0053\6)\0009\a*\0003\t+\0B\a\2\0012\0\0ÄK\0\1\0\0\20on_server_ready\0\ngopls\1\0\0\1\0\1\fgofumpt\2\tyaml\1\0\0\vformat\1\0\1\venable\2\15customTags\1\0\0\0011\0\0\16!And scalar\17!And mapping\18!And sequence\15!If scalar\16!If mapping\17!If sequence\16!Not scalar\17!Not mapping\18!Not sequence\19!Equals scalar\20!Equals mapping\21!Equals sequence\15!Or scalar\16!Or mapping\17!Or sequence\22!FindInMap scalar\24!FindInMap mappping\24!FindInMap sequence\19!Base64 scalar\20!Base64 mapping\21!Base64 sequence\17!Cidr scalar\18!Cidr mapping\19!Cidr sequence\16!Ref scalar\17!Ref mapping\18!Ref sequence\16!Sub scalar\17!Sub mapping\18!Sub sequence\19!GetAtt scalar\20!GetAtt mapping\21!GetAtt sequence\19!GetAZs scalar\20!GetAZs mapping\21!GetAZs sequence\24!ImportValue scalar\25!ImportValue mapping\26!ImportValue sequence\19!Select scalar\20!Select mapping\21!Select sequence\18!Split scalar\19!Split mapping\20!Split sequence\17!Join scalar\18!Join mapping\19!Join sequence\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\bvim\1\0\1\fversion\vLuaJIT\0\finstall\16Installing \nprint\17is_installed\15get_server\npairs\1\20\0\0\vbashls\ncssls\rdockerls\relixirls\nember\rerlangls\ngopls\fgraphql\thtml\vjsonls\16sumneko_lua\15solargraph\vsvelte\16tailwindcss\16terraformls\rtsserver\nvimls\nvuels\vyamlls\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rjump_one\1\nsetup\rlspfuzzy\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy",
    url = "https://github.com/ojroques/nvim-lspfuzzy"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n∆\15\0\0\v\0Y\0È\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0004\4\0\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0004\5\0\0=\5\f\4=\4\r\0035\4\14\0004\5\0\0=\5\15\4=\4\16\0035\4\17\0005\5\18\0004\6\"\0005\a\20\0005\b\19\0=\b\21\a\18\b\0\0'\n\22\0B\b\2\2=\b\23\a>\a\1\0065\a\25\0005\b\24\0=\b\21\a\18\b\0\0'\n\26\0B\b\2\2=\b\23\a>\a\2\0065\a\27\0\18\b\0\0'\n\28\0B\b\2\2=\b\23\a>\a\3\0065\a\29\0\18\b\0\0'\n\30\0B\b\2\2=\b\23\a>\a\4\0065\a\31\0\18\b\0\0'\n \0B\b\2\2=\b\23\a>\a\5\0065\a!\0\18\b\0\0'\n\"\0B\b\2\2=\b\23\a>\a\6\0065\a#\0\18\b\0\0'\n$\0B\b\2\2=\b\23\a>\a\a\0065\a%\0\18\b\0\0'\n&\0B\b\2\2=\b\23\a>\a\b\0065\a'\0\18\b\0\0'\n(\0B\b\2\2=\b\23\a>\a\t\0065\a)\0\18\b\0\0'\n(\0B\b\2\2=\b\23\a>\a\n\0065\a*\0\18\b\0\0'\n+\0B\b\2\2=\b\23\a>\a\v\0065\a,\0\18\b\0\0'\n-\0B\b\2\2=\b\23\a>\a\f\0065\a.\0\18\b\0\0'\n/\0B\b\2\2=\b\23\a>\a\r\0065\a0\0\18\b\0\0'\n1\0B\b\2\2=\b\23\a>\a\14\0065\a2\0\18\b\0\0'\n3\0B\b\2\2=\b\23\a>\a\15\0065\a4\0\18\b\0\0'\n5\0B\b\2\2=\b\23\a>\a\16\0065\a6\0\18\b\0\0'\n7\0B\b\2\2=\b\23\a>\a\17\0065\a8\0\18\b\0\0'\n9\0B\b\2\2=\b\23\a>\a\18\0065\a:\0\18\b\0\0'\n;\0B\b\2\2=\b\23\a>\a\19\0065\a<\0\18\b\0\0'\n=\0B\b\2\2=\b\23\a>\a\20\0065\a>\0\18\b\0\0'\n?\0B\b\2\2=\b\23\a>\a\21\0065\a@\0\18\b\0\0'\nA\0B\b\2\2=\b\23\a>\a\22\0065\aB\0\18\b\0\0'\nC\0B\b\2\2=\b\23\a>\a\23\0065\aD\0\18\b\0\0'\nE\0B\b\2\2=\b\23\a>\a\24\0065\aF\0\18\b\0\0'\nG\0B\b\2\2=\b\23\a>\a\25\0065\aH\0\18\b\0\0'\nI\0B\b\2\2=\b\23\a>\a\26\0065\aJ\0\18\b\0\0'\nK\0B\b\2\2=\b\23\a>\a\27\0065\aL\0\18\b\0\0'\nM\0B\b\2\2=\b\23\a>\a\28\0065\aN\0\18\b\0\0'\nO\0B\b\2\2=\b\23\a>\a\29\0065\aP\0\18\b\0\0'\n\28\0B\b\2\2=\b\23\a>\a\30\0065\aQ\0\18\b\0\0'\n\16\0B\b\2\2=\b\23\a>\a\31\0065\aR\0\18\b\0\0'\nS\0B\b\2\2=\b\23\a>\a \0065\aT\0\18\b\0\0'\nU\0B\b\2\2=\b\23\a>\a!\6=\6V\5=\5W\4=\4X\3B\1\2\1K\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\ag?\nclose\1\0\1\bkey\6q\1\0\1\bkey\6o\1\0\1\bkey\6s\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-]>\acb\tedit\bkey\1\0\0\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\1\0\1\16custom_only\1\1\0\3\tside\tleft\16auto_resize\1\nwidth\3\30\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\1\venable\2\16diagnostics\1\0\1\venable\2\22update_to_buf_dir\1\0\2\venable\2\14auto_open\2\23ignore_ft_on_setup\1\0\a\18disable_netrw\1\18open_on_setup\1\17hijack_netrw\2\16open_on_tab\1\18hijack_cursor\1\15update_cwd\1\15auto_close\2\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n™\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\26incremental_selection\fkeymaps\1\0\4\21node_incremental\agv\22scope_incremental\agV\19init_selection\agv\21node_decremental\agd\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n±\3\0\0\b\0\25\0(6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\v\0005\4\t\0005\5\a\0005\6\5\0009\a\4\0=\a\6\6=\6\b\5=\5\n\4=\4\f\0035\4\14\0005\5\r\0=\5\15\0045\5\16\0=\5\17\4=\4\18\0035\4\20\0005\5\19\0=\5\21\4=\4\22\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\23\1'\3\21\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\23\1'\3\24\0B\1\2\1K\0\1\0\16media_files\19load_extension\15extensions\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\nfuzzy\2\25override_file_sorter\2\28override_generic_sorter\2\fpickers\15find_files\1\0\1\vhidden\2\17file_browser\1\0\0\1\0\1\vhidden\2\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\n<C-c>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nb\0\0\4\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\3\0>\3\1\2B\0\2\1K\0\1\0\1\0\1\tmode\29lsp_document_diagnostics\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0 undotree_SetFocusWhenToggle\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-elixir",
    url = "https://github.com/elixir-editors/vim-elixir"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-textobj-line",
    url = "https://github.com/kana/vim-textobj-line"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter",
    url = "https://github.com/sgur/vim-textobj-parameter"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/alsc/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire∂\1\0\2\5\1\b\0\15-\2\0\0009\2\1\0029\2\2\0029\3\0\0018\2\3\2'\3\3\0009\4\0\1&\2\4\2=\2\0\0015\2\5\0009\3\6\0009\3\a\0038\2\3\2=\2\4\1L\1\2\0\2¿\tname\vsource\1\0\5\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\ttmux\v[tmux]\fluasnip\v[Snip]\tpath\v[path]\tmenu\6 \fdefault\fpresets\tkindö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisibleß\6\1\0\v\0002\0Q6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6\t\0005\a\a\0005\b\6\0=\b\b\a=\a\n\0065\a\f\0003\b\v\0=\b\r\a=\a\14\0065\a\16\0003\b\15\0=\b\17\a=\a\18\0065\a\19\0=\a\20\0069\a\21\0009\a\22\a=\a\23\0065\a\25\0003\b\24\0=\b\26\a3\b\27\0=\b\28\a9\b\29\0009\b\30\b=\b\31\a9\b \0009\b!\bB\b\1\2=\b\"\a9\b \0009\b#\bB\b\1\2=\b$\a9\b \0009\b%\b)\n¸ˇB\b\2\2=\b&\a9\b \0009\b%\b)\n\4\0B\b\2\2=\b'\a9\b \0009\b(\bB\b\1\2=\b)\a9\b \0009\b*\bB\b\1\2=\b+\a=\a \0064\a\6\0005\b,\0>\b\1\a5\b-\0>\b\2\a5\b.\0>\b\3\a5\b/\0>\b\4\a5\b0\0>\b\5\a=\a1\6B\4\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\ttmux\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\21select_prev_item\fmapping\n<C-y>\fdisable\vconfig\f<S-Tab>\0\n<Tab>\1\0\0\0\14preselect\tNone\18PreselectMode\15completion\1\0\1\16completeopt\26menu,menuone,noselect\15formatting\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\18documentation\1\0\0\vborder\1\0\0\1\t\0\0\b‚ï≠\b‚îÄ\b‚ïÆ\b‚îÇ\b‚ïØ\b‚îÄ\b‚ï∞\b‚îÇ\nsetup\"nvim-autopairs.completion.cmp\flspkind\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nç\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0005\3\6\0B\0\3\1K\0\1\0\1\2\0\0\6_\ball\20filetype_extend\fluasnip\14lazy_load\"luasnip.loaders.from_snipmate\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n±\3\0\0\b\0\25\0(6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\v\0005\4\t\0005\5\a\0005\6\5\0009\a\4\0=\a\6\6=\6\b\5=\5\n\4=\4\f\0035\4\14\0005\5\r\0=\5\15\0045\5\16\0=\5\17\4=\4\18\0035\4\20\0005\5\19\0=\5\21\4=\4\22\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\23\1'\3\21\0B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\23\1'\3\24\0B\1\2\1K\0\1\0\16media_files\19load_extension\15extensions\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\nfuzzy\2\25override_file_sorter\2\28override_generic_sorter\2\fpickers\15find_files\1\0\1\vhidden\2\17file_browser\1\0\0\1\0\1\vhidden\2\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\n<C-c>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\4\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\3\0>\3\1\2B\0\2\1K\0\1\0\1\0\1\tmode\29lsp_document_diagnostics\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nÈ\1\0\2\6\1\v\0\0226\2\0\0'\4\1\0B\2\2\0029\2\2\0025\4\3\0005\5\4\0=\5\5\4B\2\2\0016\2\0\0'\4\6\0B\2\2\0029\2\2\2\18\4\0\0B\2\2\1-\2\0\0009\2\a\2\a\2\b\0X\2\3Ä9\2\t\0+\3\2\0=\3\n\2K\0\1\0\0¿\24document_formatting\26resolved_capabilities\vyamlls\tname\15illuminate\17handler_opts\1\0\1\vborder\vsingle\1\0\1\tbind\2\14on_attach\18lsp_signature\frequireπ\2\1\1\5\0\17\0\0266\1\0\0009\1\1\0019\1\2\0019\1\3\1B\1\1\0026\2\4\0'\4\5\0B\2\2\0029\2\6\2\18\4\1\0B\2\2\2\18\1\2\0009\2\a\0019\2\b\0029\2\t\2+\3\2\0=\3\n\0029\2\a\0015\3\f\0=\3\v\0025\2\r\0=\1\14\0023\3\15\0=\3\16\0022\0\0ÄL\2\2\0\14on_attach\0\17capabilities\1\0\0\1\0\1\24dynamicRegistration\1\18colorProvider\19snippetSupport\19completionItem\15completion\17textDocument\24update_capabilities\17cmp_nvim_lsp\frequire\29make_client_capabilities\rprotocol\blsp\bvimg\0\1\3\0\3\0\a9\1\0\0+\2\1\0=\2\1\0019\1\0\0+\2\1\0=\2\2\1K\0\1\0\30document_range_formatting\24document_formatting\26resolved_capabilitiesÙ\1\1\1\6\4\f\0!-\1\0\0\18\3\0\0B\1\2\0029\2\0\0\a\2\1\0X\2\2Ä-\2\1\0=\2\2\0019\2\0\0\a\2\3\0X\2\2Ä-\2\2\0=\2\2\0019\2\0\0\a\2\4\0X\2\2Ä5\2\6\0=\2\5\0019\2\0\0\a\2\a\0X\2\2Ä-\2\3\0=\2\2\0019\2\0\0\a\2\b\0X\2\2Ä3\2\n\0=\2\t\1\18\4\0\0009\2\v\0\18\5\1\0B\2\3\1K\0\1\0\2¿\3¿\4¿\5¿\nsetup\0\14on_attach\rtsserver\ngopls\1\0\1\risNeovim\2\17init_options\nvimls\vyamlls\rsettings\16sumneko_lua\tnameL\0\1\4\1\3\0\b-\1\0\0\18\3\0\0B\1\2\0016\1\0\0009\1\1\1'\3\2\0B\1\2\1K\0\1\0\6¿\31 do User LspAttachBuffers \bcmd\bvim˘\v\1\0\r\0,\0O6\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0\18\4\1\0B\2\2\4H\5\18Ä9\a\4\0\18\t\6\0B\a\2\3\15\0\a\0X\t\rÄ\18\v\b\0009\t\5\bB\t\2\2\14\0\t\0X\t\bÄ6\t\6\0'\v\a\0\18\f\6\0&\v\f\vB\t\2\1\18\v\b\0009\t\b\bB\t\2\1F\5\3\3R\5Ï3\2\t\0005\3\29\0005\4\16\0005\5\n\0006\6\v\0009\6\f\0066\b\r\0009\b\14\b'\t\15\0B\6\3\2=\6\14\5=\5\17\0045\5\19\0005\6\18\0=\6\20\5=\5\21\0045\5\26\0004\6\0\b6\a\v\0009\a\22\a9\a\23\a'\t\24\0B\a\2\2+\b\2\0<\b\a\0066\a\v\0009\a\22\a9\a\23\a'\t\25\0B\a\2\2+\b\2\0<\b\a\6=\6\27\5=\5\28\4=\4\30\0035\4$\0005\5 \0005\6\31\0=\6!\0055\6\"\0=\6#\5=\5%\0045\5'\0005\6&\0=\6(\0053\6)\0009\a*\0003\t+\0B\a\2\0012\0\0ÄK\0\1\0\0\20on_server_ready\0\ngopls\1\0\0\1\0\1\fgofumpt\2\tyaml\1\0\0\vformat\1\0\1\venable\2\15customTags\1\0\0\0011\0\0\16!And scalar\17!And mapping\18!And sequence\15!If scalar\16!If mapping\17!If sequence\16!Not scalar\17!Not mapping\18!Not sequence\19!Equals scalar\20!Equals mapping\21!Equals sequence\15!Or scalar\16!Or mapping\17!Or sequence\22!FindInMap scalar\24!FindInMap mappping\24!FindInMap sequence\19!Base64 scalar\20!Base64 mapping\21!Base64 sequence\17!Cidr scalar\18!Cidr mapping\19!Cidr sequence\16!Ref scalar\17!Ref mapping\18!Ref sequence\16!Sub scalar\17!Sub mapping\18!Sub sequence\19!GetAtt scalar\20!GetAtt mapping\21!GetAtt sequence\19!GetAZs scalar\20!GetAZs mapping\21!GetAZs sequence\24!ImportValue scalar\25!ImportValue mapping\26!ImportValue sequence\19!Select scalar\20!Select mapping\21!Select sequence\18!Split scalar\19!Split mapping\20!Split sequence\17!Join scalar\18!Join mapping\19!Join sequence\bLua\1\0\0\14workspace\flibrary\1\0\0\28$VIMRUNTIME/lua/vim/lsp\20$VIMRUNTIME/lua\vexpand\afn\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\6;\tpath\fpackage\nsplit\bvim\1\0\1\fversion\vLuaJIT\0\finstall\16Installing \nprint\17is_installed\15get_server\npairs\1\20\0\0\vbashls\ncssls\rdockerls\relixirls\nember\rerlangls\ngopls\fgraphql\thtml\vjsonls\16sumneko_lua\15solargraph\vsvelte\16tailwindcss\16terraformls\rtsserver\nvimls\nvuels\vyamlls\23nvim-lsp-installer\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nord.nvim
time([[Config for nord.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bset\tnord\frequire\0", "config", "nord.nvim")
time([[Config for nord.nvim]], false)
-- Config for: nvim-lspfuzzy
time([[Config for nvim-lspfuzzy]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rjump_one\1\nsetup\rlspfuzzy\frequire\0", "config", "nvim-lspfuzzy")
time([[Config for nvim-lspfuzzy]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfeline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nã\5\0\0\6\0\30\0X6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\2\26\0009\3\3\0019\3\4\3>\3\1\0029\3\3\0019\3\5\3>\3\2\0029\3\3\0019\3\6\3>\3\3\0029\3\3\0019\3\a\3>\3\4\0029\3\b\0019\3\t\3>\3\5\0029\3\b\0019\3\4\3>\3\6\0029\3\b\0019\3\n\3>\3\a\0029\3\b\0019\3\v\3>\3\b\0029\3\b\0019\3\f\3>\3\t\0029\3\b\0019\3\a\0039\3\r\0035\5\14\0B\3\2\2>\3\n\0029\3\b\0019\3\15\3>\3\v\0029\3\b\0019\3\16\3>\3\f\0029\3\b\0019\3\17\3>\3\r\0029\3\18\0019\3\4\3>\3\14\0029\3\18\0019\3\19\3>\3\15\0029\3\18\0019\3\20\3>\3\16\0029\3\18\0019\3\21\3>\3\17\0029\3\18\0019\3\22\3>\3\18\0029\3\18\0019\3\v\3>\3\19\0029\3\18\0019\3\23\3>\3\20\0029\3\18\0019\3\24\3>\3\21\0029\3\18\0019\3\f\3>\3\22\0029\3\18\0019\3\25\3>\3\23\0029\3\18\0019\3\15\3>\3\24\0029\3\18\0019\3\26\3>\3\25\0029\3\27\0005\5\28\0=\2\29\5B\3\2\1K\0\1\0\fsources\1\0\0\nsetup\18terraform_fmt\nshfmt\rprettier\bmix\15lua_format\14goimports\fgofumpt\ffixjson\15formatting\ryamllint\15write_good\14stylelint\1\0\1\23diagnostics_format\16#{m} [#{c}]\twith\frubocop\17markdownlint\rhadolint\ncredo\16diagnostics\15shellcheck\rgitsigns\14gitrebase\reslint_d\17code_actions\rbuiltins\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n∆\15\0\0\v\0Y\0È\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\1\4\0015\3\5\0004\4\0\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0004\5\0\0=\5\f\4=\4\r\0035\4\14\0004\5\0\0=\5\15\4=\4\16\0035\4\17\0005\5\18\0004\6\"\0005\a\20\0005\b\19\0=\b\21\a\18\b\0\0'\n\22\0B\b\2\2=\b\23\a>\a\1\0065\a\25\0005\b\24\0=\b\21\a\18\b\0\0'\n\26\0B\b\2\2=\b\23\a>\a\2\0065\a\27\0\18\b\0\0'\n\28\0B\b\2\2=\b\23\a>\a\3\0065\a\29\0\18\b\0\0'\n\30\0B\b\2\2=\b\23\a>\a\4\0065\a\31\0\18\b\0\0'\n \0B\b\2\2=\b\23\a>\a\5\0065\a!\0\18\b\0\0'\n\"\0B\b\2\2=\b\23\a>\a\6\0065\a#\0\18\b\0\0'\n$\0B\b\2\2=\b\23\a>\a\a\0065\a%\0\18\b\0\0'\n&\0B\b\2\2=\b\23\a>\a\b\0065\a'\0\18\b\0\0'\n(\0B\b\2\2=\b\23\a>\a\t\0065\a)\0\18\b\0\0'\n(\0B\b\2\2=\b\23\a>\a\n\0065\a*\0\18\b\0\0'\n+\0B\b\2\2=\b\23\a>\a\v\0065\a,\0\18\b\0\0'\n-\0B\b\2\2=\b\23\a>\a\f\0065\a.\0\18\b\0\0'\n/\0B\b\2\2=\b\23\a>\a\r\0065\a0\0\18\b\0\0'\n1\0B\b\2\2=\b\23\a>\a\14\0065\a2\0\18\b\0\0'\n3\0B\b\2\2=\b\23\a>\a\15\0065\a4\0\18\b\0\0'\n5\0B\b\2\2=\b\23\a>\a\16\0065\a6\0\18\b\0\0'\n7\0B\b\2\2=\b\23\a>\a\17\0065\a8\0\18\b\0\0'\n9\0B\b\2\2=\b\23\a>\a\18\0065\a:\0\18\b\0\0'\n;\0B\b\2\2=\b\23\a>\a\19\0065\a<\0\18\b\0\0'\n=\0B\b\2\2=\b\23\a>\a\20\0065\a>\0\18\b\0\0'\n?\0B\b\2\2=\b\23\a>\a\21\0065\a@\0\18\b\0\0'\nA\0B\b\2\2=\b\23\a>\a\22\0065\aB\0\18\b\0\0'\nC\0B\b\2\2=\b\23\a>\a\23\0065\aD\0\18\b\0\0'\nE\0B\b\2\2=\b\23\a>\a\24\0065\aF\0\18\b\0\0'\nG\0B\b\2\2=\b\23\a>\a\25\0065\aH\0\18\b\0\0'\nI\0B\b\2\2=\b\23\a>\a\26\0065\aJ\0\18\b\0\0'\nK\0B\b\2\2=\b\23\a>\a\27\0065\aL\0\18\b\0\0'\nM\0B\b\2\2=\b\23\a>\a\28\0065\aN\0\18\b\0\0'\nO\0B\b\2\2=\b\23\a>\a\29\0065\aP\0\18\b\0\0'\n\28\0B\b\2\2=\b\23\a>\a\30\0065\aQ\0\18\b\0\0'\n\16\0B\b\2\2=\b\23\a>\a\31\0065\aR\0\18\b\0\0'\nS\0B\b\2\2=\b\23\a>\a \0065\aT\0\18\b\0\0'\nU\0B\b\2\2=\b\23\a>\a!\6=\6V\5=\5W\4=\4X\3B\1\2\1K\0\1\0\tview\rmappings\tlist\16toggle_help\1\0\1\bkey\ag?\nclose\1\0\1\bkey\6q\1\0\1\bkey\6o\1\0\1\bkey\6s\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-]>\acb\tedit\bkey\1\0\0\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\1\0\1\16custom_only\1\1\0\3\tside\tleft\16auto_resize\1\nwidth\3\30\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\1\venable\2\16diagnostics\1\0\1\venable\2\22update_to_buf_dir\1\0\2\venable\2\14auto_open\2\23ignore_ft_on_setup\1\0\a\18disable_netrw\1\18open_on_setup\1\17hijack_netrw\2\16open_on_tab\1\18hijack_cursor\1\15update_cwd\1\15auto_close\2\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nú\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\1\0\3\tchar\b‚îÇ\19use_treesitter\2\28show_first_indent_level\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n™\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\26incremental_selection\fkeymaps\1\0\4\21node_incremental\agv\22scope_incremental\agV\19init_selection\agv\21node_decremental\agd\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gstatus lua require("packer.load")({'vim-fugitive'}, { cmd = "Gstatus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gblame lua require("packer.load")({'vim-fugitive'}, { cmd = "Gblame", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gpush lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpush", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gpull lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpull", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
