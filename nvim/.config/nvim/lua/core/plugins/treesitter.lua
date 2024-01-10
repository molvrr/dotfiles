-- [nfnl] Compiled from core/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_opts)
  local cfgs = require("nvim-treesitter.configs")
  local parser_config = (require("nvim-treesitter.parsers")).get_parser_configs()
  cfgs.setup({indent = {enable = false}, playground = {enable = true}, highlight = {enable = true}, additional_vim_regex_highlighting = false})
  do end (parser_config)["nu"] = {install_info = {url = "https://github.com/LhKipp/tree-sitter-nu", files = {"src/parser.c", "src/scanner.c"}, branch = "main"}, filetype = "nu"}
  parser_config["roc"] = {install_info = {url = "https://github.com/faldor20/tree-sitter-roc", files = {"src/parser.c", "src/scanner.c"}}}
  vim.filetype.add({extension = {nu = "nu"}})
  vim.filetype.add({extension = {roc = "roc"}})
  return vim.filetype.add({extension = {gren = "elm"}})
end
return {{"nvim-treesitter/nvim-treesitter", dependencies = {{"nvim-treesitter/playground"}, {"danielo515/nvim-treesitter-reason"}}, config = _1_, build = ":TSUpdate"}}
