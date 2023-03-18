local map = function(mode, lhs, rhs, opts)
  local default_opts = { silent = true }

  if opts then
    opts = vim.tbl_extend("keep", opts, default_opts)
  else
    opts = default_opts
  end

  vim.keymap.set(mode, lhs, rhs, opts)
end

local nmap = function(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

local CONFIG_PATH = vim.fn.stdpath('config')

nmap('<Leader>u', function() vim.cmd.UndotreeToggle() end, { desc = 'Toggle Undotree' })
nmap('<C-e>', require("harpoon.ui").toggle_quick_menu, { desc = 'Toggle Harpoon quick menu' })
nmap('Q', '<nop>')
nmap('<Leader>a', require("harpoon.mark").add_file)
nmap('<Leader>ff', '<cmd>Telescope find_files <CR>')
nmap('<Leader>fe', '<cmd>Telescope file_browser<CR>')
nmap('<Leader>fg', '<cmd>Telescope live_grep<CR>')
nmap('<Leader>fb', '<cmd>Telescope buffers<CR>')
nmap('<Leader>si', function() vim.cmd.e(CONFIG_PATH .. '/init.lua') end, { desc = 'Edit init.lua' })
nmap('<Leader>sp', ':e ~/.config/nvim/lua/mat/plugins.lua<CR>', { desc = 'Edit plugins' })
nmap('<Leader>sk', ':e ~/.config/nvim/lua/mat/keymapping.lua<CR>', { desc = 'Edit keymaps' })
nmap('<Leader>so', ':e ~/.config/nvim/lua/mat/options.lua<CR>', { desc = 'Edit vim options' })
nmap('<Leader>sl', ':e ~/.config/nvim/lua/mat/lsp.lua<CR>', { desc = 'Edit LSP settings' })
nmap('<Leader>st', function() require('telescope.builtin').colorscheme() end)
-- nmap('<Leader>tn', ':call RunNearestSpec()<CR>')
-- nmap('<Leader>tf', ':call RunCurrentSpecFile()<CR>')
nmap('<Leader>p', '"_dP')
nmap('<Leader>1', function() require("harpoon.ui").nav_file(1) end, { desc = 'Navigate to Harpoon file 1' })
nmap('<Leader>2', function() require("harpoon.ui").nav_file(2) end, { desc = 'Navigate to Harpoon file 2' })
nmap('<Leader>3', function() require("harpoon.ui").nav_file(3) end, { desc = 'Navigate to Harpoon file 3' })
nmap('<Leader>4', function() require("harpoon.ui").nav_file(4) end, { desc = 'Navigate to Harpoon file 4' })
nmap('<Leader>5', function() require("harpoon.ui").nav_file(5) end, { desc = 'Navigate to Harpoon file 5' })
nmap('<Leader>6', function() require("harpoon.ui").nav_file(6) end, { desc = 'Navigate to Harpoon file 6' })
nmap('<Leader>td', function() vim.cmd.TodoTelescope() end)
nmap('ss', 'ggVG')
nmap('<Leader>zi', '<C-w>_<bar><C-w>|')
nmap('<Leader>zo', '<C-w>=')
nmap('ga', '<Plug>(EasyAlign)')
nmap('<F1>', function() require('dap').toggle_breakpoint() end)
nmap('<F5>', function() require('dap').continue() end)
nmap('<F6>', function() require('dap').step_over() end)
nmap('<F3>', function() require('dap').step_into() end)
nmap('<F4>', function()
  vim.diagnostic.config({ virtual_text = not vim.g.diagnostic_enabled })
  vim.g.diagnostic_enabled = not vim.g.diagnostic_enabled
  require('dapui').toggle()
end)


nmap('<Leader>te', function ()
  require('harpoon.cmd-ui').toggle_quick_menu()
end)

nmap('<Leader>t1', function()
  require('harpoon.tmux').sendCommand('right', 1)
end)
