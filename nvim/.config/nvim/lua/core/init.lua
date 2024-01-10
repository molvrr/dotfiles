-- [nfnl] Compiled from core/init.fnl by https://github.com/Olical/nfnl, do not edit.
local opts = {autoindent = true, clipboard = "unnamedplus", completeopt = "menuone,noselect", expandtab = true, fillchars = "eob: ", ignorecase = true, mouse = "", number = true, relativenumber = true, shell = "bash", shiftwidth = 2, smartcase = true, smartindent = true, splitbelow = true, splitright = true, syntax = "off", tabstop = 2, undofile = true, updatetime = 700, spell = false, wrap = false, backup = false, swapfile = false, hlsearch = false}
local globals = {mapleader = " ", maplocalleader = "\\", ["conjure#filetypes"] = {"fennel", "janet", "hy", "julia", "racket", "scheme", "lua", "lisp", "python", "sql"}, ["conjure#client#scheme#stdio#command"] = "petite", ["conjure#client#scheme#stdio#prompt_pattern"] = "> $?", clipboard = {name = "xsel_override", copy = {["+"] = "xsel --input --clipboard", ["*"] = "xsel --input --primary"}, paste = {["+"] = "xsel --output --clipboard", ["*"] = "xsel --output --primary"}, cache_enabled = 1}, zig_fmt_autosave = false}
local extensions = {koka = "*.kk", roc = "*.roc", ocaml = "*.mlx"}
vim.diagnostic.config({virtual_text = true})
for key, value in pairs(opts) do
  vim.opt[key] = value
end
for key, value in pairs(globals) do
  vim.g[key] = value
end
for filetype, extension in pairs(extensions) do
  local function _1_()
    vim.o["ft"] = filetype
    return nil
  end
  vim.api.nvim_create_autocmd({"BufEnter"}, {pattern = {extension}, callback = _1_})
end
return nil
