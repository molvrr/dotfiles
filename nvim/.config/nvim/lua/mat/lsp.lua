vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', {silent=true, desc = "Show diagnostic"})
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { silent = true })
  vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, { silent = true })
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, { silent = true })
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, { silent = true })

  if client.server_capabilities.colorProvider then
    require('document-color').buf_attach(bufnr)
  end
end

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<ESC>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path',
      option = {
        trailing_slash = true,
      }
    }
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
  'rust_analyzer',
  'solargraph',
  'ocamllsp',
  'hls',
  'tailwindcss',
  'clojure_lsp',
  'tsserver'
  -- 'ruby_ls'
}

for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
end
