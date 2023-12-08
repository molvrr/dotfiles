-- [nfnl] Compiled from core/plugins/editing.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return (require("mini.pairs")).setup()
end
local function _2_()
  return (require("mini.surround")).setup()
end
return {{"echasnovski/mini.pairs", config = _1_}, {"echasnovski/mini.surround", config = _2_}, {"julienvincent/nvim-paredit", opts = {}}, {"julienvincent/nvim-paredit-fennel", opts = {}, ft = {"fennel"}, dependencies = {{"julienvincent/nvim-paredit"}}}, {"ThePrimeAgen/harpoon", dependencies = {{"nvim-lua/plenary.nvim"}}}, {"numToStr/Comment.nvim", opts = {}}, {"stevearc/dressing.nvim", opts = {}}, {"cshuaimin/ssr.nvim"}, {"nvim-neorg/neorg", build = ":Neorg sync-parsers", dependencies = {{"nvim-lua/plenary.nvim"}, {"laher/neorg-exec"}}, config = {load = {["core.defaults"] = {}, ["core.concealer"] = {}, ["external.exec"] = {}, ["core.dirman"] = {config = {workspaces = {notes = "~/notes-neorg"}, default_workspace = "notes"}}}}}, {"gbprod/yanky.nvim", opts = {}}, {"Olical/conjure"}, {"ctrlpvim/ctrlp.vim"}, {"edgedb/edgedb-vim"}}
