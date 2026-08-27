vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/nvim-neotest/neotest',
  'https://github.com/jfpedroza/neotest-elixir',
  'https://github.com/nvim-neotest/neotest-jest',
  'https://github.com/tpope/vim-projectionist',
  'https://github.com/tpope/vim-sleuth',
  'https://github.com/tpope/vim-eunuch',
  'https://github.com/tpope/vim-repeat',
  'https://github.com/qvalentin/helm-ls.nvim',
})

-- Neotest
local neotest_elixir = require("neotest-elixir")
local neotest_elixir_build_spec = neotest_elixir.build_spec

neotest_elixir.build_spec = function(args)
  local spec = neotest_elixir_build_spec(args)
  local position = args.tree:data()
  spec.cwd = require("neotest-elixir.core").mix_root(position.path)
  return spec
end

require("neotest").setup({
  adapters = {
    neotest_elixir,
    require("neotest-jest")({
      jestCommand = "yarn test",
      jestConfigFile = "jest.config.js",
      cwd = function()
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
    running = "",
    running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
    skipped = "",
    unknown = "?",
  },
  quickfix = { open = false },
})

local map = vim.keymap.set
map("n", "<Leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Test file" })
map("n", "<Leader>tn", function() require("neotest").run.run() end, { desc = "Test nearest spec" })
map("n", "<Leader>tl", function() require("neotest").run.run_last() end, { desc = "Test last spec" })
map("n", "<Leader>ta", function() require("neotest").run.attach() end, { desc = "Attach to running spec" })
map("n", "<Leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })
map("n", "<Leader>tD", function() require("neotest").output_panel.toggle() end, { desc = "Toggle test output_panel" })
map("n", "<Leader>tO", function() require("neotest").output_panel.toggle() end, { desc = "Toggle test output_panel" })
map("n", "<Leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "Open test output" })

-- Helm-ls
require("helm-ls").setup({
  conceal_templates = { enabled = false },
  indent_hints = { enabled = false, only_for_current_line = false },
})
