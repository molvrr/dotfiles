vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { silent = true, desc = 'Show diagnostic' })
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
{ silent = true, desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { silent = true, desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<space>d', function() vim.cmd.Trouble() end, { silent = true })

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { silent = true })
  vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, { silent = true })
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, { silent = true })
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, { silent = true })
  vim.keymap.set('n', '<Leader>q', function() vim.lsp.buf.code_action() end, { silent = true })
  vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format() end, { silent = true })

  if client.server_capabilities.colorProvider then
    require('document-color').buf_attach(bufnr)
  end
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
    { name = 'luasnip' },
  })
})

require('neodev').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {
  rust_analyzer = {},
  solargraph = {},
  ocamllsp = {},
  -- hls = {},
  -- tailwindcss = {},
  clojure_lsp = {},
  tsserver = {},
  -- sorbet = {}
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false }
    }
  },
  gopls = {},
}

require('mason').setup()
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers)
})

mason_lspconfig.setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup(vim.tbl_deep_extend("keep", servers[server_name] or {},
    { capabilities = capabilities, on_attach = on_attach }))
  end
})
