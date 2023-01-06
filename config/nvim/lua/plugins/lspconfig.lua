import("neodev", function(neodev)
    neodev.setup {
        override = function(_, library)
            library.enabled = true
            library.plugins = true
        end
    }
end)

import('lspconfig.ui.windows', function(ui) ui.default_options.border = 'single' end)

local non_navic_servers = {
    "graphql", "tailwindcss"
}

local servers = vim.tbl_extend("keep", {
    "bashls", "cssls", "dockerls", "elixirls", "erlangls", "gopls", "html", "jsonls", "sumneko_lua",
    "solargraph", "terraformls", "tsserver", "vimls", "yamlls",
}, non_navic_servers)

import("nlspsettings", function(nlsp)
    nlsp.setup({
        config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
        local_settings_dir = ".nlsp-settings",
        local_settings_root_markers = { '.git' },
        append_default_schemas = true,
        loader = 'json',
        nvim_notify = {
            enable = true
        }
    })
end)

local overrides = {
    ["sumneko_lua"] = function(config)
        -- Configure lua language server for neovim development
        config.settings = {
            Lua = {
                completion = {
                    callSnippet = "Both",
                },
                format = {
                    enabled = true,
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = "2",
                    }
                }
                -- runtime = {
                --     -- LuaJIT in the case of Neovim
                --     version = "LuaJIT",
                --     path = vim.split(package.path, ";")
                -- },
                -- diagnostics = {
                --     -- Get the language server to recognize the `vim` global
                --     globals = { "vim" },
                --     disable = { "lowercase-global", "need-check-nil" }
                -- },
                -- workspace = {
                --     -- Make the server aware of Neovim runtime files
                --     library = {
                --         [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                --         [vim.fn.stdpath('config') .. '/lua'] = true,
                --     },
                -- }
            }
        }

        return config
    end,
    ["solargraph"] = function(config)
        config.settings = {
            solargraph = {
                diagnostics = false
            }
        }

        return config
    end,
    ["jsonls"] = function(config)
        local schemas
        import("schemastore", function(s) schemas = s.json.schemas() end)
        assert(schemas)

        config.settings = {
            json = {
                schemas = schemas,
                validate = {
                    enable = true
                }
            }
        }
        config.capabilities.textDocument.completion.completionItem.snippetSupport = true

        return config
    end,
    ["yamlls"] = function(config)
        config.settings = {
            yaml = {
                customTags = {
                    "!And scalar", "!And mapping", "!And sequence", "!If scalar",
                    "!If mapping", "!If sequence", "!Not scalar", "!Not mapping",
                    "!Not sequence", "!Equals scalar", "!Equals mapping",
                    "!Equals sequence", "!Or scalar", "!Or mapping", "!Or sequence",
                    "!FindInMap scalar", "!FindInMap mappping",
                    "!FindInMap sequence", "!Base64 scalar", "!Base64 mapping",
                    "!Base64 sequence", "!Cidr scalar", "!Cidr mapping",
                    "!Cidr sequence", "!Ref scalar", "!Ref mapping",
                    "!Ref sequence", "!Sub scalar", "!Sub mapping", "!Sub sequence",
                    "!GetAtt scalar", "!GetAtt mapping", "!GetAtt sequence",
                    "!GetAZs scalar", "!GetAZs mapping", "!GetAZs sequence",
                    "!ImportValue scalar", "!ImportValue mapping",
                    "!ImportValue sequence", "!Select scalar", "!Select mapping",
                    "!Select sequence", "!Split scalar", "!Split mapping",
                    "!Split sequence", "!Join scalar", "!Join mapping",
                    "!Join sequence", "!reference sequence", "!reference scalar"
                },
                format = { enable = true }
            }
        }

        local prev_attach = config.on_attach
        config.on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = true
            prev_attach(client, bufnr)
        end

        return config
    end,
    ["vimls"] = function(config)
        config.init_options = { isNeovim = true }

        return config
    end,
    ["gopls"] = function(config)
        config.settings = { gopls = { gofumpt = true } }

        return config
    end
}

local function make_config(server_name)
    local capabilities = nil
    import("cmp_nvim_lsp", function(cmp) capabilities = cmp.default_capabilities() end)
    capabilities.textDocument.colorProvider = { dynamicRegistration = false }

    local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider and not vim.tbl_contains(non_navic_servers, server_name) then
            import("nvim-navic", function(navic)
                navic.attach(client, bufnr)
            end)
        end
    end

    return {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

import("mason", function(mason) mason.setup() end)
import({ "mason-lspconfig", "lspconfig" }, function(modules)
    local mason_config = modules["mason-lspconfig"]
    local lspconfig = modules.lspconfig

    mason_config.setup {
        ensure_installed = servers,
    }

    mason_config.setup_handlers {
        function(server_name)
            local base_config = make_config(server_name)

            if overrides[server_name] then
                lspconfig[server_name].setup(overrides[server_name](base_config))
            else
                lspconfig[server_name].setup(base_config)
            end
        end,
    }
end)
