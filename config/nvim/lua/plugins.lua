--
-- Helpers
--
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
    use "miversen33/import.nvim"
    -- Packer can manage itself

    use "wbthomason/packer.nvim"

    -- General Purpose functions

    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"

    -- startup time
    use {
        "nathom/filetype.nvim",
        config = function()
            import("filetype", function(filetype)
                filetype.setup {
                    overrides = { extensions = { ["tf"] = "terraform" } }
                }
            end)
        end
    }

    -- Visuals
    use { 'stevearc/dressing.nvim', config = function()
        import('dressing', function(dressing)
            import('telescope.themes', function(theme)
                dressing.setup({
                    select = {
                        telescope = theme.get_dropdown()
                    },
                    input = {
                        relative = "editor"
                    }
                })
            end)
        end)
    end }

    use {
        "kyazdani42/nvim-web-devicons",
        config = function()

            import("nvim-web-devicons", function(devicons)
                devicons.setup {
                    -- globally enable default icons (default to false)
                    -- will get overriden by `get_icons` option
                    default = true
                }
            end)
        end
    }
    use "ryanoasis/vim-devicons"

    -- use "folke/lsp-colors.nvim"

    -- use {"shaunsingh/nord.nvim", config = function() require("nord").set() end}
    -- use { "EdenEast/nightfox.nvim" }
    -- use { 'rmehri01/onenord.nvim', config = function()
    --     import('onenord', function(onenord)
    --         onenord.setup {
    --             styles = {
    --                 comments = "italic",
    --                 strings = "NONE",
    --                 keywords = "NONE",
    --                 functions = "italic",
    --                 variables = "bold",
    --                 diagnostics = "underline",
    --             },
    --         }
    --     end)
    -- end }
    use { "catppuccin/nvim", as = "catppuccin", config = function()
        vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

        import({ "catppuccin", "catppuccin.palettes" }, function(modules)
            local colors = modules["catppuccin.palettes"].get_palette()

            modules.catppuccin.setup {
                styles = {
                    comments = { "italic" },
                },
                custom_highlights = {
                    Comment = { fg = colors.subtext0 },

                },
                integrations = {
                    leap = true,
                    aerial = true,
                    gitsigns = true,
                    illuminate = true,
                    markdown = true,
                    neotest = true,
                    notify = true,
                    nvimtree = true,
                    telescope = true,
                    treesitter = true,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false,
                    },
                    native_lsp = {
                        enabled = true,
                    },
                    navic = {
                        enabled = true,
                        -- custom_bg = "NONE",
                    },
                }
            }
        end)

        vim.api.nvim_command "colorscheme catppuccin"

    end }



    use {
        "norcalli/nvim-colorizer.lua",
        config = function() import("colorizer", function(colorizer) colorizer.setup() end) end
    }

    use {
        "petertriho/nvim-scrollbar",
        config = function() import("scrollbar", function(scrollbar) scrollbar.setup() end) end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            import("indent_blankline", function(ib)
                ib.setup {
                    char = "│",
                    show_first_indent_level = false,
                    show_current_context_start = true,
                    show_current_context = true,
                    buftype_exclude = { "terminal" },
                    filetype_exclude = { "aerial", "neotest-summary", "noice" },
                    use_treesitter = true,
                }
            end)
        end
    }

    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
        config = function()
            import("ufo", function(ufo)
                local handler = function(virtText, lnum, endLnum, width, truncate)
                    local newVirtText = {}
                    local suffix = ('  %d '):format(endLnum - lnum)
                    local sufWidth = vim.fn.strdisplaywidth(suffix)
                    local targetWidth = width - sufWidth
                    local curWidth = 0
                    for _, chunk in ipairs(virtText) do
                        local chunkText = chunk[1]
                        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        if targetWidth > curWidth + chunkWidth then
                            table.insert(newVirtText, chunk)
                        else
                            chunkText = truncate(chunkText, targetWidth - curWidth)
                            local hlGroup = chunk[2]
                            table.insert(newVirtText, { chunkText, hlGroup })
                            chunkWidth = vim.fn.strdisplaywidth(chunkText)
                            -- str width returned from truncate() may less than 2nd argument, need padding
                            if curWidth + chunkWidth < targetWidth then
                                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                            end
                            break
                        end
                        curWidth = curWidth + chunkWidth
                    end
                    table.insert(newVirtText, { suffix, 'MoreMsg' })
                    return newVirtText
                end

                ufo.setup {
                    fold_virt_text_handler = handler,
                    provider_selector = function()
                        return { 'treesitter', 'indent' }
                    end
                }
                vim.keymap.set('n', 'zR', ufo.openAllFolds)
                vim.keymap.set('n', 'zM', ufo.closeAllFolds)
            end)
        end
    }

    use {
        "rcarriga/nvim-notify",
        config = function()
            import("notify", function(notify)
                notify.setup({ max_width = 60 })
                vim.notify = notify
            end)
        end
    }
    use {
        "akinsho/bufferline.nvim",
        config = function() import('plugins/bufferline') end
    }
    use {
        "nvim-lualine/lualine.nvim",
        config = function() import('plugins.lualine') end
    }

    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
        config = function()
            require 'nvim-navic'.setup {
                highlight = true
            }
        end
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
        config = function() import('plugins/neoclip') end,
    }
    -- snippets

    use "rafamadriz/friendly-snippets"

    use {
        "L3MON4D3/LuaSnip",
        config = function()
            import("luasnip.loaders.from_vscode", function(loader) loader.lazy_load() end)
        end
    }
    use "saadparwaiz1/cmp_luasnip"

    --- completions

    use { "hrsh7th/nvim-cmp", config = function() import("plugins/cmp") end }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-buffer" }
    use { "andersevenrud/cmp-tmux" }
    use { "hrsh7th/cmp-cmdline" }

    use { "folke/noice.nvim",
        -- event = "VimEnter",
        config = function() import("plugins/noice") end,
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        } }

    -- Languages / LSP

    use {
        "neovim/nvim-lspconfig",
        requires = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "folke/neodev.nvim"
        },
        config = function()
            import("plugins/lspconfig")
        end,
    }

    use "tamago324/nlsp-settings.nvim"
    use "b0o/schemastore.nvim"
    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function() import("plugins/null-ls") end,
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" }
    }

    use {
        "stevearc/aerial.nvim",
        config = function()
            import('aerial', function(aerial)
                aerial.setup({
                    layout = {
                        placement_editor_edge = true,
                        min_width = 45,
                        default_direction = "right",
                    },
                    attach_mode = "global",
                    update_events = "TextChanged,InsertLeave,WinEnter,WinLeave",
                    filter_kind = false,
                })
            end)
        end
    }

    -- use { "j-hui/fidget.nvim",
    --     config = function() import("fidget",
    --             function(fidget) fidget.setup { window = { blend = 0, border = "double", }, } end)
    --     end }

    -- use { "ray-x/lsp_signature.nvim", config = function()
    --     import("lsp_signature", function(sig)
    --         sig.setup({
    --             bind = true, -- This is mandatory, otherwise border config won't get registered.
    --             handler_opts = {
    --                 border = "rounded"
    --             }
    --         })
    --     end)
    -- end }
    use "RRethy/vim-illuminate"

    use 'ixru/nvim-markdown'

    -- project Management
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            import("project_nvim", function(p) p.setup {} end)
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
        import('pqf', function(pqf) pqf.setup() end)
    end }
    use { "kevinhwang91/nvim-bqf", config = function()
        import('bqf', function(bqf)
            bqf.setup {
                preview = {
                    wrap = true
                }
            }
        end)
    end }

    -- Treesitter

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = "RRethy/nvim-treesitter-endwise",
        config = function() import('plugins/treesitter') end
    }

    use "mattn/emmet-vim"

    -- Lua

    -- use "euclidianAce/BetterLua.vim"

    -- Elixir

    use "elixir-editors/vim-elixir"

    -- git
    use {
        "lewis6991/gitsigns.nvim",
        config = function() import("gitsigns", function(gitsigns) gitsigns.setup() end) end
    }
    use {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gwrite", "GBrowse" }
    }

    use {
        "shumphrey/fugitive-gitlab.vim",
        requires = { "tpope/vim-fugitive" }
    }
    use "tpope/vim-rhubarb"

    -- File Management


    use "mhinz/vim-startify"
    -- use {
    --     'goolord/alpha-nvim',
    --     requires = { 'kyazdani42/nvim-web-devicons' },
    --     config = function()
    --         import('alpha', function(alpha)
    --             import('alpha.themes.startify', function(theme)
    --                 alpha.setup(theme.config)
    --             end)
    --         end)
    --     end
    -- }

    use {
        "nvim-telescope/telescope.nvim",
        config = function() import('plugins.telescope') end
    }
    use "nvim-telescope/telescope-media-files.nvim"
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    use "tpope/vim-eunuch"
    use { "nvim-tree/nvim-tree.lua", config = function() import("plugins/nvimTree") end }
    -- use {'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps', config = require 'plugins/chadtree'}

    -- Navigation

    -- use {
    --     "numToStr/Navigator.nvim",
    --     config = function() import("Navigator", function(nav) nav.setup() end) end
    -- }
    use {
        "mrjones2014/smart-splits.nvim",
        config = function()
            import("smart-splits", function(smart_split)
                local map = vim.keymap.set

                smart_split.setup {}

                map("n", "<C-h>", smart_split.move_cursor_left)
                map("n", "<C-k>", smart_split.move_cursor_up)
                map("n", "<C-l>", smart_split.move_cursor_right)
                map("n", "<C-j>", smart_split.move_cursor_down)

                map("n", "<A-h>", smart_split.resize_left)
                map("n", "<A-k>", smart_split.resize_up)
                map("n", "<A-l>", smart_split.resize_right)
                map("n", "<A-j>", smart_split.resize_down)

                map("n", "<A-r>", smart_split.start_resize_mode)
            end)
        end

    }
    -- use "terryma/vim-expand-region"
    -- use "olambo/vi-viz"
    use "kana/vim-textobj-user"
    -- use "kana/vim-textobj-line"
    -- use "kana/vim-textobj-entire"
    use "sgur/vim-textobj-parameter"

    use "wellle/targets.vim"

    -- use "justinmk/vim-sneak"
    -- use {'mrjones2014/legendary.nvim', config = function ()
    --     import("plugins/legandary")
    -- end}

    use { "ggandor/leap.nvim", config = function()
        import('leap', function(leap)
            leap.setup {
                highlight_unlabeled_phase_one_targets = true
            }
            leap.add_default_mappings()
            vim.keymap.set('o', 'z', '<Plug>(leap-forward-to)')
            vim.keymap.set('o', 'Z', '<Plug>(leap-backward-to)')
        end)
    end }

    -- FZF

    use "junegunn/fzf.vim"
    use { "junegunn/fzf", run = function() vfn("fzf#install", {}) end }

    -- Make LSP popups use fzf
    use {
        "ojroques/nvim-lspfuzzy",
        requires = {
            { "junegunn/fzf" }, { "junegunn/fzf.vim" } -- to enable preview (optional)
        },
        config = function() import("lspfuzzy", function(fzy) fzy.setup { jump_one = false } end) end
    }
    -- use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })

    -- Language Server Icons in completion menus
    use {
        "onsails/lspkind-nvim",
        config = function() import("lspkind", function(kind) kind.init({}) end) end
    }

    -- Tools

    use({
        'mrjones2014/dash.nvim',
        run = 'make install',
        config = function()
            import("dash", function(dash)
                dash.setup({ search_engine = "google", file_type_keywords = { elixir = { 'ex', 'elixir' } } })
            end)
        end
    })
    use "editorconfig/editorconfig-vim"
    use "tpope/vim-sleuth"
    use { "akinsho/toggleterm.nvim", config = function()
        import("toggleterm", function(tt)
            tt.setup {
                -- shade_terminals = false,
                start_in_insert = false,
                auto_scroll = false,
            }
        end)
    end }
    use "antoinemadec/FixCursorHold.nvim"
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- "vim-test/vim-test",
            "jfpedroza/neotest-elixir",
            "haydenmeade/neotest-jest",
        },
        config = function()
            import("plugins/neotest")
        end
    }

    use "andymass/vim-matchup"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "AndrewRadev/splitjoin.vim"
    -- use "b3nj5m1n/kommentary"
    use {
        'numToStr/Comment.nvim',
        config = function()
            import('Comment', function(c) c.setup() end)
        end
    }
    use "monaqa/dial.nvim"

    -- use { "gelguy/wilder.nvim", requires = { 'romgrk/fzy-lua-native' }, config = require 'plugins.wilder' }

    use {
        "windwp/nvim-autopairs",
        config = function()
            import("nvim-autopairs", function(p) p.setup {} end)
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
