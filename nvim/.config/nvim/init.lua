vim.g.python3_host_prog = '/home/illfate/.pyenv/versions/nvim/bin/python'
vim.g.ruby_host_prog = '/home/illfate/.asdf/installs/ruby/3.1.1/bin/ruby'
vim.g.mapleader = ' '
vim.g.gitblame_enabled = 1
vim.g.gitblame_date_format = '%d/%m/%y %H:%M'

require('globals')
require('mat.keymapping')
require('mat.options')
require('mat.plugins')
require('mat.lsp')
require('luasnip.loaders.from_vscode').lazy_load()
require('hop').setup()

local function autocmd(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

autocmd('vimenter', { pattern = '*', command = 'colorscheme gruvbox', nested = true })
autocmd('FileType', { pattern = '*', command = 'set formatoptions-=cro' })
autocmd({'BufEnter', 'BufLeave'}, { pattern = '*.md', command = 'set spell', nested = true })
vim.cmd([[
  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END
]])

