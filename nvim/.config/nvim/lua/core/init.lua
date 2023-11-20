-- [nfnl] Compiled from core/init.fnl by https://github.com/Olical/nfnl, do not edit.
local opts = {clipboard = "unnamedplus", completeopt = "menuone,noselect", expandtab = true, fillchars = "eob: ", mouse = "", number = true, relativenumber = true, shell = "bash", shiftwidth = 2, signcolumn = "number", smartcase = true, smartindent = true, splitbelow = true, splitright = true, syntax = "off", tabstop = 2, undofile = true, hlsearch = false, swapfile = false, spell = false, backup = false}
local globals = {mapleader = " ", maplocalleader = "\\"}
for key, value in pairs(opts) do
  vim.opt[key] = value
end
for key, value in pairs(globals) do
  vim.g[key] = value
end
return nil
