return {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  opts = {
    highlight_unlabeled_phase_one_targets = true,
  },
  keys = {
    { "z", "<Plug>(leap-forward-till)", mode = "o" },
    { "Z", "<Plug>(leap-backward-till)", mode = "o" },
  },
  config = function(plugin, opts)
    local leap = require("leap")

    leap.setup(opts)
    leap.add_default_mappings(true)
  end,
}
