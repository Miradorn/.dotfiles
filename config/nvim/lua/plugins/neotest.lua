local map = vim.keymap.set
local silent = { silent = true }

import({ "neotest", "neotest-elixir", "neotest-jest" }, function(modules)
    local neotest = modules.neotest
    local elixir = modules["neotest-elixir"]
    local jest = modules["neotest-jest"]

    neotest.setup {
        adapters = {
            elixir, jest
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
            running = "勒",
            running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
            skipped = "ﰸ",
            unknown = "?"
        },
        quickfix = {
            open = false
        }
    }

    map("n", "<Leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, silent)
    map("n", "<Leader>tn", neotest.run.run, silent)
    map("n", "<Leader>tl", neotest.run.run_last, silent)
    map("n", "<Leader>ta", neotest.run.attach, silent)
    map("n", "<Leader>ts", neotest.summary.toggle, silent)
    map("n", "<Leader>ta", neotest.run.attach, silent)
    map("n", "<Leader>tD", neotest.output_panel.toggle, silent)
    map("n", "<Leader>to", function() neotest.output.open({ enter = true }) end, silent)

end)
