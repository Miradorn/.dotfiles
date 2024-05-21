return {
  {
    "rcarriga/nvim-notify",
    name = "notify",
    cmd = "Notifications",
    init = function()
      vim.notify = require("notify")
    end,
    opts = {
      max_width = 80,
      render = "wrapped-compact",
      animation = false,
      stages = "static"

    },
  },
}
