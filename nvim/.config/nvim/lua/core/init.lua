-- [nfnl] Compiled from core/init.fnl by https://github.com/Olical/nfnl, do not edit.
local opts = {autoindent = true, clipboard = "unnamedplus", completeopt = "menuone,noselect", expandtab = true, fillchars = "eob: ", ignorecase = true, mouse = "", number = true, relativenumber = true, shell = "bash", shiftwidth = 2, signcolumn = "number", smartcase = true, smartindent = true, splitbelow = true, splitright = true, syntax = "off", tabstop = 2, undofile = true, updatetime = 700, wrap = false, backup = false, swapfile = false, hlsearch = false, spell = false}
vim.diagnostic.config({virtual_text = true})
local globals = {mapleader = " ", maplocalleader = "\\", ["conjure#filetypes"] = {"clojure", "fennel", "janet", "hy", "julia", "racket", "scheme", "lua", "lisp", "python", "sql"}, ["conjure#client#scheme#stdio#command"] = "petite", ["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"}
for key, value in pairs(opts) do
  vim.opt[key] = value
end
for key, value in pairs(globals) do
  vim.g[key] = value
end
return nil
