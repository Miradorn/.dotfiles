return {
  {
    lazy = false,
    "mrjones2014/smart-splits.nvim",
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move one split left",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move one split up",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move one split right",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move one split down",
      },

      {
        "<A-h>",
        function()
          require("smart-splits").resize_left()
        end,
        desc = "Resize split left",
      },
      {
        "<A-k>",
        function()
          require("smart-splits").resize_up()
        end,
        desc = "Resize split up",
      },
      {
        "<A-l>",
        function()
          require("smart-splits").resize_right()
        end,
        desc = "Resize split right",
      },
      {
        "<A-j>",
        function()
          require("smart-splits").resize_down()
        end,
        desc = "Resize split down",
      },

      {
        "<A-w>",
        function()
          require("smart-splits").start_resize_mode()
        end,
        desc = "Start resize mode",
      },
      -- {
      --   "<A-H>",
      --   function()
      --     require("smart-splits").swap_buf_left()
      --   end,
      --   desc = "Move split left",
      -- },
      -- {
      --   "<A-K>",
      --   function()
      --     require("smart-splits").swap_buf_up()
      --   end,
      --   desc = "Move split up",
      -- },
      -- {
      --   "<A-L>",
      --   function()
      --     require("smart-splits").swap_buf_right()
      --   end,
      --   desc = "Move split right",
      -- },
      -- {
      --   "<A-J>",
      --   function()
      --     require("smart-splits").swap_buf_down()
      --   end,
      --   desc = "Move split down",
      -- },
    },
  },
}
