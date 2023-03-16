require('mat.plugins')
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

autocmd('BufWritePost', {pattern = 'keymapping.lua', command = 'source <afile>', group = vim.api.nvim_create_augroup('keymappings', {clear = true})})
-- autocmd('BufWritePre', {pattern = '*.{tsx,jsx}', command = 'Neoformat prettier', group = vim.api.nvim_create_augroup('prettier', {clear = true})})
autocmd('BufWritePost', {pattern = '*.norg', command = 'Neorg tangle current-file', group = vim.api.nvim_create_augroup('tangle', {clear=true})})
