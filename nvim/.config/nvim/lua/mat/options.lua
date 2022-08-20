vim.opt.mouse = 'a'
vim.opt.spell = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = vim.opt.clipboard ^ { 'unnamed', 'unnamedplus' }
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false
vim.opt.listchars = 'space:·'
vim.opt.list = true
--vim.opt.so = 5
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wb = false
vim.opt.guicursor = 'i:block'
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  severity_sort = true
})
if require('mat.utils').has('wsl') then
  vim.g.python3_host_prog = '/home/illfate/.pyenv/shims/python3'
end
vim.g.mapleader = ' '
vim.g.gitblame_enabled = 1
vim.g.gitblame_date_format = '%d/%m/%y %H:%M'
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
