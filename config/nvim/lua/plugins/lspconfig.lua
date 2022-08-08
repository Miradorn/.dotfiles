local servers = {
    "bashls", "cssls", "dockerls", "elixirls", "ember", "erlangls", "gopls",
    "graphql", "html", "jsonls", "sumneko_lua", "solargraph", "svelte",
    "tailwindcss", "terraformls", "tsserver", "vimls", "volar", "yamlls"
}

import("nvim-lsp-installer",
    function(installer) installer.setup({ ensure_installed = servers, automatic_installation = true }) end)

local function make_config(server)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    import("cmp_nvim_lsp", function(cmp) capabilities = cmp.update_capabilities(capabilities) end)
    capabilities.textDocument.colorProvider = { dynamicRegistration = false }

    return {
        -- enable snippet support
        capabilities = capabilities,
        -- map buffer local keybindings when the language server attaches
        on_attach = function(client, bufnr)
            import('illuminate', function(ill)
                ill.on_attach(client)
            end)
            import('aerial', function(aerial)
                aerial.on_attach(client, bufnr)
            end)


            if server == "yamlls" then
                client.server_capabilities.document_formatting = true
            end

            if server == "tsserver" then
                client.server_capabilities.document_formatting = false
                client.server_capabilities.document_range_formatting = false
            end


            if not vim.tbl_contains({ "null-ls", "tailwindcss", "ember" }, server) then
                -- vim.pretty_print(server)
                -- require'nvim-navic'.attach(client, bufnr)
            end
        end
    }
end

-- Configure lua language server for neovim development
local lua_settings = {
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

-- Configure yaml with CFN support
local yaml_settings = {
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
            "!Join sequence"
        },
        format = { enable = true }
    }
}

local ruby_settings = {
    solargraph = {
        diagnostics = false
    }
}

local go_settings = { gopls = { gofumpt = true } }

local schemas
import("schemastore", function(s) schemas = s end)
assert(schemas)

local json_settings = {
    json = {
        schemas = schemas
    }
}

local function setup_server(server)
    local config = make_config(server)

    -- language specific config
    if server == "sumneko_lua" then config.settings = lua_settings end
    if server == "solargraph" then config.settings = ruby_settings end
    if server == "yamlls" then config.settings = yaml_settings end
    --[[ if server.name == "efm" then
            config = vim.tbl_extend("force", config, require "lsp/efm")
        end ]]
    if server == "vimls" then config.init_options = { isNeovim = true } end
    if server == "gopls" then config.settings = go_settings end
    if server == "jsonls" then config.settings = json_settings end

    return config
end

import("lspconfig", function(c)
    for _, lsp in pairs(servers) do
        c[lsp].setup(setup_server(lsp))
    end
end)
