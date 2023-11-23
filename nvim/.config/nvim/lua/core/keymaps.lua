-- [nfnl] Compiled from core/keymaps.fnl by https://github.com/Olical/nfnl, do not edit.
local config_path = vim.fn.stdpath("config")
local builtin = require("telescope.builtin")
local find_files = builtin.find_files
local live_grep = builtin.live_grep
local help_tags = builtin.help_tags
local themes = require("telescope.themes")
local function normal_map(lhs, rhs, fun, _3fopts)
  local opts = (_3fopts or {silent = true})
  return vim.keymap.set("n", lhs, rhs, fun, opts)
end
local function _1_()
  return find_files(themes.get_dropdown({previewer = false}))
end
normal_map("<Leader>f", _1_)
local function _2_()
  return live_grep(themes.get_dropdown({previewer = false}))
end
normal_map("<Leader>/", _2_)
local function _3_()
  return help_tags(themes.get_dropdown({previewer = false}))
end
normal_map("<Leader>h", _3_)
local function _4_()
  local mark = require("harpoon.mark")
  return mark.add_file()
end
normal_map("<Leader>a", _4_)
local function _5_()
  local ui = require("harpoon.ui")
  return ui.toggle_quick_menu()
end
normal_map("<C-e>", _5_)
local function _6_()
  local ui = require("harpoon.ui")
  return ui.nav_file(1)
end
normal_map("<Leader>1", _6_)
local function _7_()
  local ui = require("harpoon.ui")
  return ui.nav_file(2)
end
normal_map("<Leader>2", _7_)
local function _8_()
  local ui = require("harpoon.ui")
  return ui.nav_file(3)
end
normal_map("<Leader>3", _8_)
local function _9_()
  local ui = require("harpoon.ui")
  return ui.nav_file(4)
end
normal_map("<Leader>4", _9_)
local function _10_()
  local ui = require("harpoon.ui")
  return ui.nav_file(5)
end
normal_map("<Leader>5", _10_)
normal_map("<localleader>r", ":Neorg exec cursor<CR>")
normal_map("<C-n>", "<Plug>(YankyCycleForward)")
normal_map("<C-p>", "<Plug>(YankyCycleBackward)")
local function _11_()
  local ssr = require("ssr")
  return ssr.open()
end
vim.keymap.set({"n", "x"}, "<Leader>sr", _11_)
vim.keymap.set({"n", "x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n", "x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n", "x"}, "gp", "<Plug>(YankyGPutAfter)")
return vim.keymap.set({"n", "x"}, "gP", "<Plug>(YankyGPutBefore)")
