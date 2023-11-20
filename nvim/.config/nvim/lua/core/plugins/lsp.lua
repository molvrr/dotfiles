-- [nfnl] Compiled from core/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local function normal_map(lhs, rhs, fun, _3fopts)
  local opts = (_3fopts or {silent = true})
  return vim.keymap.set("n", lhs, rhs, fun, opts)
end
local function on_attach(client, bufnr)
  normal_map("gd", vim.lsp.buf.definition)
  normal_map("<F2>", vim.lsp.buf.rename)
  normal_map("[d", vim.diagnostic.goto_prev)
  normal_map("]d", vim.diagnostic.goto_next)
  normal_map("K", vim.lsp.buf.hover)
  normal_map("<Leader>lf", vim.lsp.buf.format)
  return normal_map("<Leader>la", vim.lsp.buf.code_action)
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
local function _1_()
  local lspconfig = require("lspconfig")
  lspconfig.rust_analyzer.setup({capabilities = capabilities, on_attach = on_attach})
  return lspconfig.ocamllsp.setup({capabilities = capabilities, on_attach = on_attach})
end
return {{"neovim/nvim-lspconfig", config = _1_, dependencies = {{"j-hui/fidget.nvim", tag = "legacy", opts = {text = {spinner = "star"}}}}}}
