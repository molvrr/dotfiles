local opt = vim.opt

opt.mouse = nil
opt.spell = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.clipboard = 'unnamedplus'
opt.wrap = true
opt.linebreak = true
opt.splitbelow = true
opt.splitright = true
opt.foldmethod = 'indent'
opt.foldenable = false
opt.listchars:append('space:·')
opt.listchars:append('multispace:·------')
opt.listchars:append('precedes:<')
opt.listchars:append('extends:>')
opt.listchars:append('lead:*')
opt.listchars:append('trail:*')
opt.fillchars:append('eob: ')
opt.matchpairs:append('<:>')
opt.list = false
-- opt.scrolloff = 999
-- opt.sidescrolloff = 999
opt.hlsearch = false
opt.swapfile = false
opt.backup = false
opt.wb = false
opt.guicursor = 'i:block'
opt.updatetime = 100
opt.signcolumn = 'yes'
vim.g.diagnostic_enabled = true
vim.diagnostic.config({
  virtual_text = vim.g.diagnostic_enabled,
  signs = true,
  severity_sort = true
})
-- vim.opt.colorcolumn = {120}
opt.smartcase = true
opt.ignorecase = true
opt.termguicolors = true
-- opt.cmdheight = 0
opt.fillchars:append("eob: ")
vim.g.mapleader = ' '
vim.g.localleader = ','
vim.g.loaded_python3_provider = 1
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
-- vim.g.neoformat_verbose = 1
vim.g['aniseed#env'] = true
vim.g['conjure#log#hud#enabled'] = false
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_compiler_latexmk = { options = { '-shell-escape' } }

vim.g.ftplugin_sql_omni_key = '<nop>'

vim.g.zig_fmt_autosave = false
