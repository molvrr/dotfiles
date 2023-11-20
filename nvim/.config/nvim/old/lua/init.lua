local _2afile_2a = ".config/nvim/fnl/init.fnl"
local _2amodule_name_2a = "matfn"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local function concat(x, y)
  if ((x == nil) and (y == nil)) then
    return {}
  elseif (x == nil) then
    return y
  elseif (y == nil) then
    return x
  else
    local tbl = {}
    for k, v in pairs(x) do
      tbl[k] = v
    end
    for k, v in pairs(y) do
      tbl[k] = v
    end
    return tbl
  end
end
_2amodule_2a["concat"] = concat
local function map(mode, lhs, rhs, opts)
  return vim.keymap.set(mode, lhs, rhs, concat({silent = true}, opts))
end
_2amodule_2a["map"] = map
local function nmap(lhs, rhs, opts)
  return map("n", lhs, rhs, opts)
end
_2amodule_2a["nmap"] = nmap
local opts = {mouse = nil, tabstop = 2, shiftwidth = 2, expandtab = true, wrap = true, relativenumber = true, number = true, autoindent = true, spell = false}
for opt, tgl in pairs(opts) do
  vim.opt[opt] = tgl
end
return _2amodule_2a