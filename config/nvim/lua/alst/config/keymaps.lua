local map = Snacks.keymap.set

-- General
map("n", "<C-w>f", "<C-w>vgf", { desc = "GoTo File in vSplit" })
map("n", "<C-w>F", "<C-w>vgf", { desc = "GoTo File:Line in vSplit" })
map("n", "<BS>", "<C-6>", { desc = "Goto previous buffer" })
map("n", "<leader><leader>", "V", { desc = "Linewise Visual Mode" })
map("n", "<leader>,", ":noh<CR>", { desc = "Clear search highlight" })
map("n", "<leader>w", ":silent w<CR>", { desc = "Write" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>Q", ":q!<CR>", { desc = "Force Quit" })
map("n", "<leader>x", ":bd!<CR>", { desc = "Delete Buffer" })
map("n", "<leader>e", ":e<CR>", { desc = "Reload" })
map("n", "<leader>E", ":e!<CR>", { desc = "Force reload" })

-- Emacs-like movement in insert/cmdline
map({ "i", "c" }, "<C-b>", "<left>", { desc = "Char back" })
map({ "i", "c" }, "<C-f>", "<right>", { desc = "Char forward" })
map({ "i", "c" }, "<C-e>", "<End>", { desc = "End of line" })
map({ "i", "c" }, "<C-a>", "<Home>", { desc = "Beginning of line" })
map({ "i", "c" }, "<C-p>", "<up>", { desc = "Line up" })
map({ "i", "c" }, "<C-n>", "<down>", { desc = "Line down" })
map({ "i", "c" }, "<A-b>", "<S-Left>", { desc = "Word back" })
map({ "i", "c" }, "<A-f>", "<S-Right>", { desc = "Word forward" })

-- Screenline-wise navigation
map("n", "j", "gj")
map("n", "k", "gk")

-- Plugin management
map("n", "<leader>lu", "<cmd>lua vim.pack.update()<cr>", { desc = "Update plugins" })

-- Edit configs
map("n", "<leader>et", ":vsplit ~/.config/zellij/config.kdl<cr>", { desc = "Edit zellij config" })
map("n", "<leader>ez", ":vsplit ~/.zshrc<cr>", { desc = "Edit zshrc" })
map("n", "<leader>ek", ":vsplit ~/.config/kitty/kitty.conf<cr>", { desc = "Edit kitty config" })
map("n", "<leader>eg", ":vsplit ~/.config/ghostty/config<cr>", { desc = "Edit ghostty config" })

-- Move Lines
map("n", "<A-S-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-S-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-J>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-K>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Resize splits
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-j>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-k>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })

-- LSP keymaps (replaces lsp-attach.lua)
local format = function() vim.lsp.buf.format({ timeout_ms = 10000 }) end

map("n", "<leader>dd", vim.diagnostic.open_float, { lsp = {}, desc = "Line Diagnostics" })
map("n", "<leader>di", function()
  if vim.diagnostic.config().virtual_lines then
    vim.diagnostic.config { virtual_lines = false, virtual_text = true }
  else
    vim.diagnostic.config { virtual_lines = { current_line = true }, virtual_text = false }
  end
end, { lsp = {}, desc = "Toggle Inline Diagnostics" })
map("n", "gd", function() Snacks.picker.lsp_definitions { auto_confirm = false } end, { lsp = { method = "textDocument/definition" }, desc = "Goto Definition" })
map("n", "gr", function() Snacks.picker.lsp_references() end, { lsp = { method = "textDocument/references" }, desc = "Get References" })
map("n", "gD", function() Snacks.picker.lsp_declarations() end, { lsp = { method = "textDocument/declaration" }, desc = "Goto Declaration" })
map("n", "gI", function() Snacks.picker.lsp_implementations() end, { lsp = { method = "textDocument/implementation" }, desc = "Get Implementation" })
map("n", "gt", function() Snacks.picker.lsp_type_definitions() end, { lsp = { method = "textDocument/typeDefinition" }, desc = "Goto Type definition" })
map("n", "gK", vim.lsp.buf.signature_help, { lsp = { method = "textDocument/signatureHelp" }, desc = "Signature Help" })
map("i", "<c-k>", vim.lsp.buf.signature_help, { lsp = { method = "textDocument/signatureHelp" }, desc = "Signature Help" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { lsp = { method = "textDocument/codeAction" }, desc = "Code Action" })
map("n", "<leader>ff", format, { lsp = { method = "textDocument/formatting" }, desc = "Format Document" })
map("v", "<leader>ff", format, { lsp = { method = "textDocument/rangeFormatting" }, desc = "Format Range" })
map("n", "<leader>rn", vim.lsp.buf.rename, { lsp = { method = "textDocument/rename" }, desc = "Rename" })
map("n", "<leader>I", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, { lsp = { method = "textDocument/inlayHint" }, desc = "Toggle Inlay Hints" })
