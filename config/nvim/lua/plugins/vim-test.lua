-- vim-test
local tt
local ttt
import("toggleterm", function(t) tt = t end)
import("toggleterm.terminal", function(t) ttt = t end)

vim.g["test#custom_strategies"] = {
  tterm = function(cmd)
    tt.exec(cmd)
  end,

  tterm_close = function(cmd)
    local term_id = 0
    tt.exec(cmd, term_id)
    ttt.get_or_create_term(term_id):close()
  end,
}

vim.g["test#strategy"] = "tterm"
