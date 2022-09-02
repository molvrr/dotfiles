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

M.has = function(x)
  return vim.fn.has(x) == 1
end

local get_root = function(bufnr)
  local parser = vim.treesitter.get_parser(bufnr, "javascript", {})
  local tree = parser:parse()[1]
  return tree:root()
end

M.clear_comments = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local results = vim.treesitter.parse_query('javascript', '(comment) @comment')
  for id, node in results:iter_captures(get_root(bufnr), bufnr, 0, -1) do
    local range = { node:range() }
    vim.api.nvim_buf_set_lines(bufnr, range[3], range[3] + 1, false, {})
  end
end

return M
