-- require('mat.plugins')
require('mat.lazy')
require('mat.globals')
require('mat.options')
require('mat.keymapping')
require('mat.lsp')
require('mat.utils')
require('aniseed.env').init()

local function autocmd(event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

vim.cmd.colorscheme('gruvbox')

local cursor_line_group = vim.api.nvim_create_augroup('cursorline', { clear = true })
autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter' }, { pattern = '*', command = 'setlocal cursorline', group = cursor_line_group })
autocmd('WinLeave', { pattern = '*', command = 'setlocal nocursorline', group = cursor_line_group })

local packer_group = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
autocmd('BufWritePost', { pattern = 'plugins.lua', command = 'source <afile> | PackerCompile', group = packer_group })

local keymap_group = vim.api.nvim_create_augroup('keymappings', { clear = true })
autocmd('BufWritePost', { pattern = 'keymapping.lua', command = 'source <afile>', group = keymap_group })

-- local prettier_group = vim.api.nvim_create_augroup('prettier', { clear = true })
-- autocmd('BufWritePre', { pattern = '*.{tsx,jsx}', command = 'Neoformat prettier', group = prettier_group })

local cloju = vim.api.nvim_create_augroup('cloju', { clear = true })
autocmd('BufReadPost', { pattern = '*.clj', command = 'lua require("mat.cloj").start()',group = cloju })


vim.keymap.set('n', '<Leader>e', function()
end, { silent = true })
