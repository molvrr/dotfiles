local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

map('n', '<C-s>', ':w<CR>', {silent = true})
map('n', '<Leader>h', '<cmd>UndotreeShow<cr>', {})
map('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', {silent = true})
map('n', 'Q', '<nop>', {silent = true, noremap = true})
map('n', '<Leader>a', ':lua require("harpoon.mark").add_file()<CR>', {silent = true})
map('n', '<Leader>ff', '<cmd>Telescope find_files hidden=true<CR>', {})
map('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', {})
map('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', {})
map('n', '<Leader>1', ':TestFile<CR>', {silent = true})
map('n', '<Leader>2', ':TestNearest<CR>', {silent = true})
map('n', '<Leader>3', ':TestLast<CR>', {silent = true})
map('n', '<Leader>4', ':TestSuite<CR>', {silent = true})
map('n', '<C-TAB>', 'gT', {silent=true})
map('n', '<S-TAB>', 'gt', {silent=true})
map('n', '.t', '<Plug>PlenaryTestFile', {silent = true})
map('n', '<Leader>si', ':e ~/.config/nvim/init.lua<CR>', {silent=true})
map('n', '<Leader>sp', ':e ~/.config/nvim/lua/mat/plugins.lua<CR>', {silent=true})
map('n', '<Leader>sk', ':e ~/.config/nvim/lua/mat/keymapping.lua<CR>', {silent=true})
map('n', '<Leader>so', ':e ~/.config/nvim/lua/mat/options.lua<CR>', {silent=true})
map('n', 'j', 'gj', {})
map('n', 'k', 'gk', {})
map('n', '$', 'g$', {})
map('n', '0', 'g0', {})
if vim.g.neovide then map('n', '<C-V>', 'p', {silent=true}) end
