local schemas = require("schemastore").json.schemas()

return {
  bashls = {},
  cssls = {},
  dockerls = {},
  -- elixirls = {
  --   settings = {
  --     elixirls = {
  --       dialyzerEnabled = false,
  --       enableTestLenses = false,
  --       suggestSpecs = true,
  --       fetchDeps = true,
  --     }
  --   }
  -- },
  erlangls = {},
  graphql = {},
  html = {},
  -- shellcheck = {},
  -- shfmt = {},
  -- stylua = {},
  -- tailwindcss = {},
  terraformls = {},
  ts_ls = {},
  jsonls = {
    settings = {
      json = {
        schemas = schemas,
        validate = { enable = true },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
        telemetry = { enable = false },
        diagnostics = {
          disable = { "missing-fields" },
        },
        format = {
          enabled = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
          },
        },
      },
    },
  },
  solargraph = {
    settings = { solargraph = { diagnostics = false } },
  },
  yamlls = {
    settings = {
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
          "!reference sequence",
          "!reference scalar",
        },
        format = { enable = true },
      },
    },
  },
  vimls = {
    init_options = { isNeovim = true },
  },
  gopls = { settings = { { gopls = { gofumpt = true } } } },
}
