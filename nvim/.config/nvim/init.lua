require('mat.plugins')
require('mat.globals')
require('mat.options')
require('mat.keymapping')
require('mat.lsp')
-- require('aniseed.env').init()

vim.cmd.colorscheme('gruvbox')
vim.cmd.highlight('MiniStarterHeader guifg=#ff00ff')

vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format()
end, {})

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, { pattern = '*.typ', callback = function()
  vim.bo.ft = 'typst'
end})
