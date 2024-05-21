local M = {}
local keymap = require("legendary").keymap

function M.on_attach(args)
  local buffer = args.buf
  local client = vim.lsp.get_client_by_id(args.data.client_id)

  local self = M.new(client, buffer)

  self:map("<leader>dd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
  self:map("gd", "Telescope lsp_definitions jump_type=never fname_width=70", { desc = "Goto Definition" })
  self:map("gr", "Telescope lsp_references jump_type=never fname_width=70", { desc = "References" })
  self:map("gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
  self:map("gI", "Telescope lsp_implementation jump_type=nevers fname_width=90", { desc = "Goto Implementation" })
  self:map("gt", "Telescope lsp_type_definitions jump_type=never fname_width=90", { desc = "Goto Type Definition" })
  self:map("gK", vim.lsp.buf.signature_help, { desc = "Signature Help", has = "signatureHelp" })
  self:map("<c-k>", vim.lsp.buf.signature_help, { mode = "i", desc = "Signature Help", has = "signatureHelp" })
  -- self:map("]d", M.diagnostic_goto(true), { desc = "Next Diagnostic" })
  -- self:map("[d", M.diagnostic_goto(false), { desc = "Prev Diagnostic" })
  self:map("]e", M.diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
  self:map("[e", M.diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
  self:map("]w", M.diagnostic_goto(true, "WARNING"), { desc = "Next Warning" })
  self:map("[w", M.diagnostic_goto(false, "WARNING"), { desc = "Prev Warning" })
  self:map("<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", mode = { "n", "v" }, has = "codeAction" })

  local format = function()
    vim.lsp.buf.format({ timeout_ms = 10000 })
  end

  self:map("<leader>ff", format, { desc = "Format Document", has = "documentFormatting" })
  self:map("<leader>ff", format, { desc = "Format Range", mode = "v", has = "documentRangeFormatting" })
  self:map("<leader>rn", vim.lsp.buf.rename, { desc = "Rename", has = "rename" })
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

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M
