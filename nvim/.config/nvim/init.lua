require('mat.plugins')
require('mat.globals')
require('mat.options')
require('mat.keymapping')
require('mat.lsp')
-- require('mat.utils') -- REMOVIDO POR, IRONICAMENTE, SER INÚTIL
require('aniseed.env').init()

vim.cmd.colorscheme('gruvbox')

vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format()
end, {})
