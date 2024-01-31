local function _1_()
  return require("ocaml").update()
end

local function _2_()
  require("ocaml").setup()
  vim.cmd.hi("link @rapper_argument @parameter")
  vim.cmd.hi("link @rapper_return @type")
end

local function _3_(_opts)
  local cfgs = require("nvim-treesitter.configs")
  local parser_config = (require("nvim-treesitter.parsers")).get_parser_configs()

  cfgs.setup({indent = {enable = false}, playground = {enable = true}, highlight = {enable = true}, additional_vim_regex_highlighting = false})

  parser_config["nu"] = {install_info = {url = "https://github.com/LhKipp/tree-sitter-nu", files = {"src/parser.c", "src/scanner.c"}, branch = "main"}, filetype = "nu"}
  parser_config["roc"] = {install_info = {url = "https://github.com/faldor20/tree-sitter-roc", files = {"src/parser.c", "src/scanner.c"}}}
  vim.filetype.add({extension = {nu = "nu"}})
  vim.filetype.add({extension = {roc = "roc"}})
  vim.filetype.add({extension = {gren = "elm"}})
end

return {
  {"tjdevries/ocaml.nvim", build = _1_, config = _2_},
  {"nvim-treesitter/nvim-treesitter", dependencies = {
    {"nvim-treesitter/playground"},
    {"danielo515/nvim-treesitter-reason"}
  }, config = _3_, build = ":TSUpdate"}
}
