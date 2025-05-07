return {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
        hint = { enable = true },
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
  }
