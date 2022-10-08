vim.opt.mouse = nil
vim.opt.spell = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false
vim.opt.listchars = 'space:·'
vim.opt.list = false
--vim.opt.so = 5
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wb = false
vim.opt.guicursor = 'i:block'
vim.opt.updatetime = 100
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  severity_sort = true
})
vim.opt.colorcolumn = {120}
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.g.localleader = ','
vim.g.gitblame_enabled = 1
vim.g.gitblame_date_format = '%d/%m/%y %H:%M'
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
-- vim.g.neoformat_verbose = 1
vim.g.netrw_banner = 0
-- vim.g.netrw_browse_split = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_winsize = 90
vim.g.netrw_altv = 1
