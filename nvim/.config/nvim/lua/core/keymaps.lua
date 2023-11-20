-- [nfnl] Compiled from core/keymaps.fnl by https://github.com/Olical/nfnl, do not edit.
local config_path = vim.fn.stdpath("config")
local builtin = require("telescope.builtin")
local find_files = builtin.find_files
local live_grep = builtin.live_grep
local help_tags = builtin.help_tags
local themes = require("telescope.themes")
local function _1_()
  return find_files(themes.get_dropdown({previewer = false}))
end
vim.keymap.set("n", "<Leader>f", _1_, {})
local function _2_()
  return live_grep(themes.get_dropdown({previewer = false}))
end
vim.keymap.set("n", "<Leader>/", _2_, {})
local function _3_()
  return help_tags(themes.get_dropdown({previewer = false}))
end
return vim.keymap.set("n", "<Leader>h", _3_, {})
