return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "jfpedroza/neotest-elixir",
      "nvim-lua/plenary.nvim",
      "haydenmeade/neotest-jest",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    opts = function()
      return {
        adapters = {
          require("neotest-elixir"),
          require("neotest-jest")({
            jestCommand = "yarn test",
            jestConfigFile = "jest.config.js",
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        },
        discovery = {
          concurrent = 2,
          enabled = false,
        },
        floating = {
          max_height = 0.9,
          max_width = 0.9,
        },
        strategies = {
          integrated = {
            width = 240,
            height = 80,
          },
        },
        icons = {
          child_indent = "│",
          child_prefix = "├",
          collapsed = "─",
          expanded = "╮",
          failed = "✖",
          final_child_indent = " ",
          final_child_prefix = "╰",
          non_collapsible = "─",
          passed = "✔",
          running = "",
          running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
          skipped = "",
          unknown = "?",
        },
        quickfix = {
          open = false,
        },
      }
    end,
    keys = {
      {
        "<Leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Test file",
      },
      {
        "<Leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Test nearest spec",
      },
      {
        "<Leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Test last spec",
      },

      {
        "<Leader>ta",
        function()
          require("neotest").run.attach()
        end,
        desc = "Attach to running spec",
      },
      {
        "<Leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle test summary",
      },
      {
        "<Leader>tD",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle test output_panel",
      },
      {
        "<Leader>tO",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle test output_panel",
      },
      {
        "<Leader>to",
        function()
          require("neotest").output.open({ enter = true })
        end,
      },
    },
  },
}
