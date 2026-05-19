-- Inline search count shown as virtual text at end of current line
local ns = vim.api.nvim_create_namespace("inline_search_count")

local function clear()
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end

local function update()
  clear()
  if vim.v.hlsearch == 0 then return end

  local ok, result = pcall(vim.fn.searchcount, { maxcount = 999999 })
  if not ok or result.total == 0 then return end

  local text
  if result.incomplete == 1 then
    text = string.format("[?/%d+]", result.total)
  elseif result.incomplete == 2 then
    text = string.format("[%d/%d+]", result.current, result.total)
  else
    text = string.format("[%d/%d]", result.current, result.total)
  end

  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  vim.api.nvim_buf_set_extmark(0, ns, row, 0, {
    virt_text = { { " " .. text, "InlineSearchCount" } },
    virt_text_pos = "eol",
    priority = 200,
  })
end

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  callback = update,
})
