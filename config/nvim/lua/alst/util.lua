local M = {}

function M.get_visual_selection()
  vim.cmd('noau normal! "vy"')
  return vim.fn.getreg("v")
end

function M.remove_line_breaks(text)
  print(text)
  text = string.gsub(text, "\n", "")
  print(text)
  if #text > 0 then
    return text
  else
    return ""
  end
end

return M
