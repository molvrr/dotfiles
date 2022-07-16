local M = {}

M.fit_window = function()
  local win_number = #vim.api.nvim_tabpage_list_wins(vim.api.nvim_get_current_tabpage())
  if win_number > 1 then
    local low = vim.fn.line('$')
    local high = vim.fn.line('w0')
    vim.api.nvim_win_set_cursor(0, {high, 0})
    vim.api.nvim_win_set_height(0, low - high)
  end
end

return M
