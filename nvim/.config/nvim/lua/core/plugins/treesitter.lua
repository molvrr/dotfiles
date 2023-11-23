-- [nfnl] Compiled from core/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_opts)
  local cfgs = require("nvim-treesitter.configs")
  return cfgs.setup({indent = {enable = false}, playground = {enable = true}, highlight = {enable = true}, additional_vim_regex_highlighting = false})
end
return {{"nvim-treesitter/nvim-treesitter", dependencies = {{"nvim-treesitter/playground"}}, config = _1_, build = ":TSUpdate"}}
