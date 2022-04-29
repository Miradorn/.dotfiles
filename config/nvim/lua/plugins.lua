--
-- Helpers
--
-- local utils = require "custom"
local vfn = vim.api.nvim_call_function
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

local packer = nil
local function init()
    if packer == nil then
        packer = require "packer"
        packer.init { disable_commands = true, max_jobs = 20 }
    end

    local use = packer.use

    packer.reset()

    use "jbyuki/instant.nvim"
    -- Packer can manage itself

    use "wbthomason/packer.nvim"

    -- General Purpose functions

    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"

    -- startup time
    use {
        "nathom/filetype.nvim",
        config = function()
            require "filetype".setup {
                overrides = { extensions = { ["tf"] = "terraform" } }
            }

        end
    }

    -- Visuals

    use {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require "nvim-web-devicons".setup {
                -- globally enable default icons (default to false)
                -- will get overriden by `get_icons` option
                default = true
            }
        end
    }
    use "ryanoasis/vim-devicons"

    use "folke/lsp-colors.nvim"

    -- use {"shaunsingh/nord.nvim", config = function() require("nord").set() end}
    use { "EdenEast/nightfox.nvim" }

    use {
        "norcalli/nvim-colorizer.lua",
        config = function() require "colorizer".setup() end
    }

    use {
        "petertriho/nvim-scrollbar",
        config = function() require("scrollbar").setup() end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "indent_blankline".setup {
                char = "│",
                show_first_indent_level = false,
                buftype_exclude = { "terminal" },
                use_treesitter = true
            }
        end
    }

    use {
        "rcarriga/nvim-notify",
        config = function()
            require "notify".setup({ max_width = 60 })
            vim.notify = require("notify")
        end
    }
    use {
        "akinsho/bufferline.nvim",
        config = function() require("bufferline").setup {} end
    }
    use {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {},
                    always_divide_middle = true,
                    globalstatus = false
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            }
        end
    }

    -- Undo tree
    use {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = function() vim.g.undotree_SetFocusWhenToggle = 1 end
    }

    -- snippets

    use "rafamadriz/friendly-snippets"

    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }
    use "saadparwaiz1/cmp_luasnip"

    --- completions

    use { "hrsh7th/nvim-cmp", config = require "plugins/cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-buffer" }
    use { "andersevenrud/cmp-tmux" }

    -- Languages / LSP

    use "williamboman/nvim-lsp-installer"
    use { "neovim/nvim-lspconfig", config = require "plugins/lspconfig" }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = require "plugins/null-ls",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" }
    }

    use {
        "simrat39/symbols-outline.nvim",
        config = function()
            vim.g.symbols_outline = {
                auto_preview = false,
                preview_bg_highlight = "NormalFloat"
            }
        end
    }

    use { "j-hui/fidget.nvim", config = function() require "fidget".setup {} end }

    use "ray-x/lsp_signature.nvim"
    use "RRethy/vim-illuminate"
    use {
        "RishabhRD/lspactions",
        requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
        config = require "plugins/lspactions"
    }
    use { 'weilbith/nvim-code-action-menu' }

    use 'ixru/nvim-markdown'

    -- diagnostics
    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
    use {
        'onsails/diaglist.nvim',
        config = function() require('diaglist').init() end
    }

    --[[ use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                {
                    mode = "lsp_document_diagnostics" -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
                }
            }
        end
    } ]]

    -- Treesitter

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = "RRethy/nvim-treesitter-endwise",
        config = require 'plugins/treesitter'
    }

    use "mattn/emmet-vim"

    -- Lua

    use "euclidianAce/BetterLua.vim"

    -- Elixir

    use "elixir-editors/vim-elixir"

    -- git
    use {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup() end
    }
    use {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" }
    }

    use "tpope/vim-rhubarb"

    -- File Management

    use "mhinz/vim-startify"

    use {
        "nvim-telescope/telescope.nvim",
        config = function()
            local actions = require("telescope.actions")

            require "telescope".setup {
                defaults = {
                    mappings = {
                        i = { ["<C-b>"] = { "<esc>", type = "command" } },
                        n = { ["<C-c>"] = actions.close }
                    }
                },
                pickers = {
                    -- Your special builtin config goes in here
                    file_browser = { hidden = true },
                    find_files = { hidden = true }
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            }

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("media_files")

        end
    }
    use "nvim-telescope/telescope-media-files.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    use { "kyazdani42/nvim-tree.lua", config = require "plugins/nvimTree" }
    -- use {'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps', config = require 'plugins/chadtree'}

    -- Navigation

    use {
        "numToStr/Navigator.nvim",
        config = function() require("Navigator").setup() end
    }
    use "terryma/vim-expand-region"
    use "kana/vim-textobj-user"
    use "kana/vim-textobj-line"
    use "kana/vim-textobj-entire"
    use "sgur/vim-textobj-parameter"

    use "wellle/targets.vim"

    use "justinmk/vim-sneak"

    -- FZF

    use "junegunn/fzf.vim"
    use { "junegunn/fzf", run = function() vfn("fzf#install", {}) end }

    -- Make LSP popups use fzf
    use {
        "ojroques/nvim-lspfuzzy",
        requires = {
            { "junegunn/fzf" }, { "junegunn/fzf.vim" } -- to enable preview (optional)
        },
        config = function() require("lspfuzzy").setup { jump_one = false } end
    }
    -- use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })

    -- Language Server Icons in completion menus
    use {
        "onsails/lspkind-nvim",
        config = function() require("lspkind").init({}) end
    }

    -- Tools

    use "editorconfig/editorconfig-vim"
    use "tpope/vim-sleuth"
    use "kassio/neoterm"
    use "vim-test/vim-test"

    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "AndrewRadev/splitjoin.vim"
    use "b3nj5m1n/kommentary"
    use "monaqa/dial.nvim"

    use {
        "gelguy/wilder.nvim",
        requires = { 'romgrk/fzy-lua-native' },
        config = function()
            vim.cmd [[
                call wilder#setup({'modes': [':']})
                call wilder#set_option('use_python_remote_plugin', 0)
                call wilder#set_option('pipeline', [
                    \   wilder#branch(
                    \     wilder#cmdline_pipeline({
                    \       'fuzzy': 1,
                    \       'fuzzy_filter': wilder#lua_fzy_filter(),
                    \     }),
                    \     wilder#vim_search_pipeline(),
                    \   ),
                    \ ])

                call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
                    \ 'apply_incsearch_fix': 0,
                    \ 'highlighter': wilder#lua_fzy_highlighter(),
                    \ 'left': [
                    \   ' ',
                    \   wilder#popupmenu_devicons(),
                    \   wilder#popupmenu_buffer_flags({
                    \     'flags': ' a + ',
                    \     'icons': {'+': '', 'a': '', 'h': ''},
                    \   }),
                    \ ],
                    \ 'right': [
                    \   ' ', wilder#popupmenu_scrollbar(),
                    \ ],
                    \ 'highlights': {
                    \   'border': 'FloatBorder',
                    \   'default': 'Normal',
                    \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#D08770'}]),
                    \ },
                    \ 'border': 'rounded',
                    \ })))
            ]]
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    if packer_bootstrap then packer.sync() end
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end
})

return plugins
