local servers = {
    "bashls", "cssls", "dockerls", "elixirls", "ember", "erlangls", "gopls",
    "graphql", "html", "jsonls", "sumneko_lua", "solargraph", "svelte",
    "tailwindcss", "terraformls", "tsserver", "vimls", "volar", "yamlls"
}

import("nvim-lsp-installer",
    function(installer) installer.setup({ ensure_installed = servers, automatic_installation = true }) end)

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


local function make_config(server)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    import("cmp_nvim_lsp", function(cmp) capabilities = cmp.update_capabilities(capabilities) end)
    capabilities.textDocument.colorProvider = { dynamicRegistration = false }

    if server == "jsonls" then
        capabilities.textDocument.completion.completionItem.snippetSupport = true
    end

    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = function(client, bufnr)
            if server == "yamlls" then
                client.server_capabilities.documentFormattingProvider = true
            end

            -- if server == "tsserver" then
            --     client.server_capabilities.documentFormattingProvider = false
            --     client.server_capabilities.documentRangeFormattingProvider = false
            -- end


            if not vim.tbl_contains({ "null-ls", "tailwindcss", "ember" }, server) then
                require('aerial').on_attach(client, bufnr)

                -- vim.pretty_print(server)
                -- require'nvim-navic'.attach(client, bufnr)
            end
        end
    }
end

local function setup_server(server)
    local config = make_config(server)

    -- language specific config
    if server == "sumneko_lua" then
        -- Configure lua language server for neovim development

        config.settings = {
            Lua = {
                runtime = {
                    -- LuaJIT in the case of Neovim
                    version = "LuaJIT",
                    path = vim.split(package.path, ";")
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                    disable = { "lowercase-global", "need-check-nil" }
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                }
            }
        }
    end

    if server == "solargraph" then
        config.settings = {
            solargraph = {
                diagnostics = false
            }
        }
    end

    if server == "yamlls" then
        -- Configure yaml with CFN support
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
                    "!Join sequence", "!reference sequence"
                },
                format = { enable = true }
            }
        }
    end
    --[[ if server.name == "efm" then
            config = vim.tbl_extend("force", config, require "lsp/efm")
        end ]]
    if server == "vimls" then config.init_options = { isNeovim = true } end
    if server == "gopls" then config.settings = { gopls = { gofumpt = true } } end
    if server == "jsonls" then
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
    end

    return config
end

import("lspconfig", function(c)
    for _, lsp in pairs(servers) do
        c[lsp].setup(setup_server(lsp))
    end
end)
