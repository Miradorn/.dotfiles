return {
  {
    "rcarriga/nvim-notify",
    name = "notify",
    cmd = "Notifications",
    init = function()
      vim.notify = require("notify")
    end,
    config = function()
      require("notify").setup({
        max_width = 80,
        render = "wrapped-compact",
        animation = false,
        stages = "static"
      })
      require 'telescope'.load_extension("notify")
    end,
    keys = {
      {
        "<Leader>tm",
        function()
          require("telescope").extensions.notify.notify()
        end,
        desc = "Telescope notify",
      },
    }
  },
}