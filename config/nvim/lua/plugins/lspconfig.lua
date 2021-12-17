return function()
    local lsp_installer = require("nvim-lsp-installer")

    local servers = {
        "bashls",
        "cssls",
        "dockerls",
        "elixirls",
        "ember",
        "erlangls",
        "gopls",
        "graphql",
        "html",
        "jsonls",
        "sumneko_lua",
        "solargraph",
        "svelte",
        "tailwindcss",
        "terraformls",
        "tsserver",
        "vimls",
        "vuels",
        "yamlls",
    }

    for _, name in pairs(servers) do
        local ok, server = lsp_installer.get_server(name)
        -- Check that the server is supported in nvim-lsp-installer
        if ok then
            if not server:is_installed() then
                print("Installing " .. name)
                server:install()
            end
        end
    end

    local function make_config(server)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.colorProvider = { dynamicRegistration = false }

        return {
            -- enable snippet support
            capabilities = capabilities,
            -- map buffer local keybindings when the language server attaches
            on_attach = function(client, bufnr)
                require"lsp_signature".on_attach({
                    bind = true, -- This is mandatory, otherwise border config won't get registered.
                    handler_opts = { border = "single" },
                })

                require"illuminate".on_attach(client)

                if server.name == "yamlls" then
                    client.resolved_capabilities.document_formatting = true
                end
            end,
        }
    end

    -- Configure lua language server for neovim development
    local lua_settings = {
        Lua = {
            runtime = {
                -- LuaJIT in the case of Neovim
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    }

    -- Configure yaml with CFN support
    local yaml_settings = {
        yaml = {
            customTags = {
                "!And scalar",
                "!And mapping",
                "!And sequence",
                "!If scalar",
                "!If mapping",
                "!If sequence",
                "!Not scalar",
                "!Not mapping",
                "!Not sequence",
                "!Equals scalar",
                "!Equals mapping",
                "!Equals sequence",
                "!Or scalar",
                "!Or mapping",
                "!Or sequence",
                "!FindInMap scalar",
                "!FindInMap mappping",
                "!FindInMap sequence",
                "!Base64 scalar",
                "!Base64 mapping",
                "!Base64 sequence",
                "!Cidr scalar",
                "!Cidr mapping",
                "!Cidr sequence",
                "!Ref scalar",
                "!Ref mapping",
                "!Ref sequence",
                "!Sub scalar",
                "!Sub mapping",
                "!Sub sequence",
                "!GetAtt scalar",
                "!GetAtt mapping",
                "!GetAtt sequence",
                "!GetAZs scalar",
                "!GetAZs mapping",
                "!GetAZs sequence",
                "!ImportValue scalar",
                "!ImportValue mapping",
                "!ImportValue sequence",
                "!Select scalar",
                "!Select mapping",
                "!Select sequence",
                "!Split scalar",
                "!Split mapping",
                "!Split sequence",
                "!Join scalar",
                "!Join mapping",
                "!Join sequence",
            },
            format = { enable = true },
        },
    }

    local go_settings = { gopls = { gofumpt = true } }

    local function setup_server(server)
        local config = make_config(server)

        -- language specific config
        if server.name == "sumneko_lua" then config.settings = lua_settings end
        if server.name == "yamlls" then config.settings = yaml_settings end
        --[[ if server.name == "efm" then
            config = vim.tbl_extend("force", config, require "lsp/efm")
        end ]]
        if server.name == "vimls" then config.init_options = { isNeovim = true } end
        if server.name == "gopls" then config.settings = go_settings end
        if server.name == "tsserver" then
            config.on_attach = function(client)
                client.resolved_capabilities.document_formatting = false
                client.resolved_capabilities.document_range_formatting = false
            end
        end

        server:setup(config)
    end

    -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
    lsp_installer.on_server_ready(function(server)
        setup_server(server) -- reload installed servers
        -- vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
        vim.cmd [[ do User LspAttachBuffers ]]
    end)
end
