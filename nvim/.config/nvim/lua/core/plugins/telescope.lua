-- [nfnl] Compiled from core/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local telescope = require("telescope")
  telescope.setup()
  telescope.load_extension("fzf")
  return telescope.load_extension("live_grep_args")
end
return {{"nvim-telescope/telescope.nvim", config = _1_, dependencies = {{"nvim-telescope/telescope-fzf-native.nvim", build = "make"}, "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim"}}}
