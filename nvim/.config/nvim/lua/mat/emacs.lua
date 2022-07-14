--vim.keymap.set('i', '<C-a>', function () vim.fn.setcursorcharpos(vim.api.nvim_win_get_cursor(0)[1], 0) end)

local insert_maps = vim.api.nvim_get_keymap('i')

for i, v in ipairs(insert_maps) 
  do
  vim.api.nvim_del_keymap('i', v.lhs)
end

vim.keymap.set('i', '<C-a>', '<C-o>I')
vim.keymap.set('i', '<C-e>', '<C-o>A')
vim.keymap.set('i', '<C-f>', '<C-o>l')
vim.keymap.set('i', '<C-b>', '<C-o>h')
vim.keymap.set('i', '<C-n>', '<C-o>j')
vim.keymap.set('i', '<C-p>', '<C-o>k')
vim.keymap.set('i', '<C-p>', '<C-o>k')
vim.keymap.set('n', 'l', '<nop>')
vim.keymap.set('n', 'h', '<nop>')
vim.keymap.set('i', '<A-w>', '<C-o>yy')
vim.keymap.set('i', '<C-w>', '<C-o>D')
vim.keymap.set('n', 'h', '<nop>')
