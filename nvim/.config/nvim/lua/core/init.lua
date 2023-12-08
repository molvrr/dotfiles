-- [nfnl] Compiled from core/init.fnl by https://github.com/Olical/nfnl, do not edit.
local opts = {autoindent = true, clipboard = "unnamedplus", completeopt = "menuone,noselect", expandtab = true, fillchars = "eob: ", ignorecase = true, mouse = "", number = true, relativenumber = true, shell = "bash", shiftwidth = 2, signcolumn = "number", smartcase = true, smartindent = true, splitbelow = true, splitright = true, syntax = "off", tabstop = 2, undofile = true, updatetime = 700, swapfile = false, hlsearch = false, wrap = false, spell = false, backup = false}
vim.diagnostic.config({virtual_text = true})
local globals = {mapleader = " ", maplocalleader = "\\", ["conjure#filetypes"] = {"clojure", "fennel", "janet", "hy", "julia", "racket", "scheme", "lua", "lisp", "python", "sql"}, ["conjure#client#scheme#stdio#command"] = "petite", ["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"}
for key, value in pairs(opts) do
  vim.opt[key] = value
end
for key, value in pairs(globals) do
  vim.g[key] = value
end
local function _1_()
  vim.o["ft"] = "koka"
  return nil
end
vim.api.nvim_create_autocmd({"BufEnter"}, {pattern = {"*.kk"}, callback = _1_})
local function _2_()
  vim.o["ft"] = "roc"
  return nil
end
vim.api.nvim_create_autocmd({"BufEnter"}, {pattern = {"*.roc"}, callback = _2_})
local function _3_()
  vim.o["ft"] = "ocaml"
  return nil
end
return vim.api.nvim_create_autocmd({"BufEnter"}, {pattern = {"*.mlx"}, callback = _3_})
