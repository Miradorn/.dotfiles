return {
  "ggandor/leap.nvim",
  lazy = false,
  config = function(plugin, opts)
    local leap = require("leap")
    leap.opts.highlight_unlabeled_phase_one_targets = true

    local keymap = require("legendary").keymap
    keymap({ "z", "<Plug>(leap-forward-till)", description = "Leap forward", mode = { "n", "x", "o" } })
    keymap({ "Z", "<Plug>(leap-backward-till)", description = "Leap backward", mode = { "n", "x", "o" } })
  end,
}
