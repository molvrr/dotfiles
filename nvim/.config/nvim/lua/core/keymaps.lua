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
  return (((require("telescope")).extensions).projects).projects({})
end
normal_map("<Leader>pf", _1_)
local function _2_()
  return find_files(themes.get_dropdown({previewer = false}))
end
normal_map("<Leader>f", _2_)
local function _3_()
  return live_grep(themes.get_dropdown({previewer = false}))
end
normal_map("<Leader>/", _3_)
local function _4_()
  return help_tags(themes.get_dropdown({previewer = false}))
end
normal_map("<Leader>h", _4_)
local function _5_()
  local git = require("neogit")
  return git.open({kind = "replace"})
end
normal_map("<Leader>g", _5_)
local function _6_()
  local oil = require("oil")
  return oil.open_float()
end
normal_map("<Leader>e", _6_)
normal_map("<Leader>x", ":Neorg exec cursor<CR>")
do
  local harpoon = require("harpoon")
  local function _7_()
    return harpoon:list():append()
  end
  normal_map("<Leader>a", _7_)
  local function _8_()
    return (harpoon.ui):toggle_quick_menu(harpoon:list())
  end
  normal_map("<C-e>", _8_)
  local function _9_()
    return harpoon:list():select(1)
  end
  normal_map("<Leader>1", _9_)
  local function _10_()
    return harpoon:list():select(2)
  end
  normal_map("<Leader>2", _10_)
  local function _11_()
    return harpoon:list():select(3)
  end
  normal_map("<Leader>3", _11_)
  local function _12_()
    return harpoon:list():select(4)
  end
  normal_map("<Leader>4", _12_)
end
normal_map("<localleader>r", ":Neorg exec cursor<CR>")
normal_map("<C-n>", "<Plug>(YankyCycleForward)")
normal_map("<C-p>", "<Plug>(YankyCycleBackward)")
local function _13_()
  local ssr = require("ssr")
  return ssr.open()
end
vim.keymap.set({"n", "x"}, "<Leader>sr", _13_)
vim.keymap.set({"n", "x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n", "x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n", "x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n", "x"}, "gP", "<Plug>(YankyGPutBefore)")
local pulapula = require("pulapula")
normal_map("<C-h>", pulapula.move_left)
normal_map("<C-l>", pulapula.move_right)
normal_map("<C-j>", pulapula.move_down)
normal_map("<C-k>", pulapula.move_up)
return normal_map("<C-w>o", pulapula.maximize)
