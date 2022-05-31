--
-- Helpers
--
-- local utils = require "custom"
local vfn = vim.api.nvim_call_function
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap

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
        packer.init {
            disable_commands = true,
            max_jobs = 20,
            --[[ display = {
                open_fn = require('packer.util').float
            } ]]
        }
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
    use { 'stevearc/dressing.nvim', config = function()
        require('dressing').setup({
            select = {
                telescope = require 'telescope.themes'.get_cursor()
            }
        })
    end }

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
    -- use { "EdenEast/nightfox.nvim" }
    use { 'rmehri01/onenord.nvim', config = function()
        require('onenord').setup {
            styles = {
                comments = "italic",
                strings = "NONE",
                keywords = "NONE",
                functions = "italic",
                variables = "bold",
                diagnostics = "underline",
            },
        }
    end }



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
        config = require 'plugins/bufferline'
    }
    use {
        "nvim-lualine/lualine.nvim",
        config = require 'plugins.lualine'
    }

    -- Undo tree
    use {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = function() vim.g.undotree_SetFocusWhenToggle = 1 end
    }

    -- yank history
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            'nvim-telescope/telescope.nvim',
            { 'tami5/sqlite.lua', module = 'sqlite' },

        },
        config = require 'plugins/neoclip',
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
    use { "hrsh7th/cmp-cmdline" }


    -- Languages / LSP

    use "williamboman/nvim-lsp-installer"
    use { "neovim/nvim-lspconfig", config = require "plugins/lspconfig" }
    use "b0o/schemastore.nvim"
    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = require "plugins/null-ls",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" }
    }

    use {
        "stevearc/aerial.nvim",
        config = function()
            require('aerial').setup({
                min_width = 45,
                default_direction = "right",
                placement_editor_edge = true,
                close_behavior = "global",
                update_events = "TextChanged,InsertLeave,WinEnter,WinLeave",
            })
        end
    }

    use { "j-hui/fidget.nvim", config = function() require "fidget".setup {} end }

    use { "ray-x/lsp_signature.nvim", config = function()
        require "lsp_signature".setup({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "rounded"
            }
        })
    end }
    use "RRethy/vim-illuminate"

    use 'ixru/nvim-markdown'

    -- project Management
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {}
        end
    }

    --[[ use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                {
                    mode = "document_diagnostics"
                }
            }
        end
    } ]]
    use { "https://gitlab.com/yorickpeterse/nvim-pqf.git", config = function()
        require('pqf').setup()
    end }
    use "kevinhwang91/nvim-bqf"

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
        config = require 'plugins.telescope'
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

    use({
        'mrjones2014/dash.nvim',
        run = 'make install',
        config = function()
            require("dash").setup({ search_engine = "google", file_type_keywords = { elixir = { 'ex', 'elixir' } } })
        end
    })
    use "editorconfig/editorconfig-vim"
    use "tpope/vim-sleuth"
    use "kassio/neoterm"
    use "vim-test/vim-test"

    use "andymass/vim-matchup"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "AndrewRadev/splitjoin.vim"
    use "b3nj5m1n/kommentary"
    use "monaqa/dial.nvim"

    -- use { "gelguy/wilder.nvim", requires = { 'romgrk/fzy-lua-native' }, config = require 'plugins.wilder' }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
            require("nvim-autopairs").add_rules(require('nvim-autopairs.rules.endwise-elixir'))
            require("nvim-autopairs").add_rules(require('nvim-autopairs.rules.endwise-lua'))
            require("nvim-autopairs").add_rules(require('nvim-autopairs.rules.endwise-ruby'))
        end
    }

    if packer_bootstrap then packer.sync() end
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        if key == 'delete_snapshot' then
            init()
            snapshot = require 'packer.snapshot'
            snapshot.cfg(packer.config)
            return snapshot.delete
        else
            init()
            return packer[key]
        end
    end
})

return plugins
