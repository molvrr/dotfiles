require('mat.globals')
require('mat.options')
require('mat.neovide')
require('mat.keymapping')
require('mat.plugins')
require('mat.lsp')
require('mat.utils')

vim.opt.guifont = "FiraCode"

local function autocmd(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

autocmd('vimenter', { pattern = '*', command = 'colorscheme gruvbox', nested = true })
autocmd('FileType', { pattern = '*', command = 'set formatoptions-=cro' })

local cursor_line_group = vim.api.nvim_create_augroup('cursorline', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter' }, { pattern = '*', command = 'setlocal cursorline', group = cursor_line_group })
vim.api.nvim_create_autocmd('WinLeave', { pattern = '*', command = 'setlocal nocursorline', group = cursor_line_group })

local packer_group = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { pattern = 'plugins.lua', command = 'source <afile> | PackerCompile', group = packer_group })

local keymap_group = vim.api.nvim_create_augroup('keymappings', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { pattern = 'keymapping.lua', command = 'source <afile>', group = keymap_group })

local prettier_group = vim.api.nvim_create_augroup('prettier', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { pattern = '*.jsx', command = 'Neoformat prettier', group = prettier_group })
