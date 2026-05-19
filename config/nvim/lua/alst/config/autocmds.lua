vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("DisableIndentScope", { clear = true }),
  callback = function()
    if vim.bo.filetype == "snacks_dashboard" then
      vim.b.miniindentscope_disable = true
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("Yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})


vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FullWidthQF", { clear = true }),
  pattern = { "qf" },
  command = "if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif",
})

vim.api.nvim_create_autocmd('LspProgress', {
  callback = function(ev)
    local value = ev.data.params.value
    vim.api.nvim_echo({ { value.message or 'done' } }, false, {
      id = 'lsp.' .. ev.data.client_id,
      kind = 'progress',
      source = 'vim.lsp',
      title = value.title,
      status = value.kind ~= 'end' and 'running' or 'success',
      percent = value.percentage,
    })
  end,
})
