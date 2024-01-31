local config_path = vim.fn.stdpath('config')
local builtin = require('telescope.builtin')
local find_files = builtin.find_files
local live_grep = builtin.live_grep
local help_tags = builtin.help_tags
local themes = require('telescope.themes')

local normal_map = function(lhs, rhs, fun, opts)
  local opts = opts or {silent = true}

  vim.keymap.set('n', lhs, rhs, fun, opts)
end

normal_map("<Leader>f", function() find_files(themes.get_dropdown {previewer = false}) end)
normal_map("<Leader>/", function() live_grep(themes.get_dropdown {previewer = false}) end)
normal_map("<Leader>h", function() help_tags(themes.get_dropdown {previewer = false}) end)
