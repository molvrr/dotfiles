vim.opt.spelllang = 'pt_br', 'en'
vim.opt.mouse = 'a'
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
vim.opt.so=5
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wb = false
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  severity_sort = true
})
