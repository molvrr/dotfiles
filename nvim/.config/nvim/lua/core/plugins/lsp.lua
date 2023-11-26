-- [nfnl] Compiled from core/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local servers = {{name = "rust_analyzer", opts = {}}, {name = "ocamllsp", opts = {}}, {name = "nushell", opts = {}}, {name = "omnisharp", opts = {cmd = {"OmniSharp"}}}}
local function normal_map(lhs, rhs, fun, _3fopts)
  local opts = (_3fopts or {silent = true})
  return vim.keymap.set("n", lhs, rhs, fun, opts)
end
local function on_attach(client, bufnr)
  local function _1_()
    return vim.lsp.buf.format()
  end
  vim.api.nvim_create_autocmd({"BufWritePre"}, {buffer = bufnr, callback = _1_})
  do end (require("virtualtypes")).on_attach(client, bufnr)
  normal_map("gd", vim.lsp.buf.definition)
  normal_map("<F2>", vim.lsp.buf.rename)
  normal_map("[d", vim.diagnostic.goto_prev)
  normal_map("]d", vim.diagnostic.goto_next)
  normal_map("K", vim.lsp.buf.hover)
  normal_map("<Leader>lf", vim.lsp.buf.format)
  return normal_map("<Leader>la", vim.lsp.buf.code_action)
end
local function setup_lsp()
  local lspconfig = require("lspconfig")
  local cmp = require("cmp")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local luasnip = require("luasnip")
  luasnip.config.setup({})
  local function _2_(_241)
    return luasnip.lsp_expand(_241.body)
  end
  local function _3_(_241)
    if cmp.visible() then
      return cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      return luasnip.expand_or_jump()
    else
      return _241()
    end
  end
  local function _5_(_241)
    if cmp.visible() then
      return cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      return luasnip.jump(-1)
    else
      return _241()
    end
  end
  cmp.setup({snippet = {expand = _2_}, mapping = cmp.mapping.preset.insert({["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<CR>"] = cmp.mapping.confirm({select = false}), ["<Tab>"] = cmp.mapping(_3_), ["<S-Tab>"] = cmp.mapping(_5_)}), sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "luasnip"}, {name = "conjure"}})})
  local capabilities = cmp_nvim_lsp.default_capabilities()
  for _, server in ipairs(servers) do
    lspconfig[server.name].setup(vim.tbl_extend("force", {capabilities = capabilities, on_attach = on_attach}, server.opts))
  end
  return nil
end
return {{"neovim/nvim-lspconfig", config = setup_lsp, dependencies = {{"j-hui/fidget.nvim", tag = "legacy", opts = {window = {blend = 0}, text = {spinner = "star"}}}, {"hrsh7th/nvim-cmp"}, {"hrsh7th/cmp-nvim-lsp"}, {"L3MON4D3/LuaSnip"}, {"saadparwaiz1/cmp_luasnip"}, {"PaterJason/cmp-conjure"}}}, {"jubnzv/virtual-types.nvim"}}
