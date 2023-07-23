vim.keymap.set('n', '<Leader>h', '<cmd>lua vim.diagnostic.open_float()<CR>', { silent = true, desc = 'Show diagnostic' })
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { silent = true, desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { silent = true, desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<Leader>d', function() vim.cmd.Trouble() end, { silent = true })

local on_attach = function(_, bufnr)
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { silent = true })
  vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, { silent = true })
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, { silent = true })
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, { silent = true })
  vim.keymap.set('n', '<Leader>q', function() vim.lsp.buf.code_action() end, { silent = true })
  vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format() end, { silent = true })

  -- vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
  --   buffer = bufnr,
  --   callback = function()
  --     vim.lsp.buf.document_highlight()
  --   end
  -- })
  --
  -- vim.api.nvim_create_autocmd({'CursorMoved'}, {
  --   buffer = bufnr,
  --   callback = function()
  --     vim.lsp.buf.clear_references()
  --   end
  -- })
end

local cmp = require('cmp')
local luasnip = require('luasnip')
luasnip.config.setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<ESC>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local configs = require('lspconfig.configs')

configs.typst_lsp = {
  default_config = {
    cmd = {'typst-lsp'},
    filetypes = {'sql'},
    root_dir = function (_)
      return nil
    end,
    single_file_support = true,
    settings = {}
  }
}

local servers = {
  elixirls = {},
  zls = {},
  volar = {},
  rescriptls = {},
  rust_analyzer = {},
  solargraph = {},
  ocamllsp = {},
  clojure_lsp = {},
  tsserver = {},
  rnix = {},
}

require('mason').setup()
local mason_lspconfig = require('mason-lspconfig')

--[[ mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers)
})
]]
-- mason_lspconfig.setup_handlers({
--   function(server_name)
--     require('lspconfig')[server_name].setup({ capabilities = capabilities, on_attach = on_attach, settings = servers[server_name] })
--   end
-- })
--

local lspconfig = require('lspconfig')

for server, settings in pairs(servers) do
  lspconfig[server].setup({ capabilities = capabilities, on_attach = on_attach })
end
