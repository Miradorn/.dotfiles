local M = {}
local keymap = require("legendary").keymap

function M.on_attach(args)
  local buffer = args.buf
  local client = vim.lsp.get_client_by_id(args.data.client_id)

  local self = M.new(client, buffer)

  self:map("<leader>dd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
  self:map("<leader>di", function()
    if vim.diagnostic.config().virtual_lines then
      vim.diagnostic.config { virtual_lines = false, virtual_text = true }
    else
      vim.diagnostic.config { virtual_lines = { current_line = true }, virtual_text = false }
    end
  end, { desc = "Line Diagnostics" })
  self:map("gd", function() Snacks.picker.lsp_definitions { auto_confirm = false } end, { desc = "Goto Definition" })
  self:map("gr", function() Snacks.picker.lsp_references() end, { desc = "Get References" })
  self:map("gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
  self:map("gI", function() Snacks.picker.lsp_implementations() end, { desc = "Get Implementation" })
  self:map("gt", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto Type definition" })
  self:map("gK", vim.lsp.buf.signature_help, { desc = "Signature Help", has = "signatureHelp" })
  self:map("<c-k>", vim.lsp.buf.signature_help, { mode = "i", desc = "Signature Help", has = "signatureHelp" })
  self:map("<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", mode = { "n", "v" }, has = "codeAction" })

  local format = function()
    vim.lsp.buf.format({ timeout_ms = 10000 })
  end

  self:map("<leader>ff", format, { desc = "Format Document", has = "documentFormatting" })
  self:map("<leader>ff", format, { desc = "Format Range", mode = "v", has = "documentRangeFormatting" })
  self:map("<leader>rn", vim.lsp.buf.rename, { desc = "Rename", has = "rename" })

  if self:has("inlayHint") then
    -- vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
    self:map("<leader>I",
      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 }) end,
      { desc = "Toggle Inlay Hints" })
  end
end

function M.new(client, buffer)
  return setmetatable({ client = client, buffer = buffer }, { __index = M })
end

function M:has(cap)
  return self.client.server_capabilities[cap .. "Provider"]
end

function M:map(lhs, rhs, opts)
  opts = opts or {}
  if opts.has and not self:has(opts.has) then
    return
  end
  keymap({
    lhs,
    type(rhs) == "string" and ("<cmd>%s<cr>"):format(rhs) or rhs,
    ---@diagnostic disable-next-line: no-unknown
    mode = opts.mode or "n",
    description = opts.desc,
    opts = { silent = true, buffer = self.buffer, expr = opts.expr },
  })
end

return M
