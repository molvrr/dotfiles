require('mat.globals')
require('mat.options')
require('mat.lazy')
require('mat.keymapping')
require('mat.lsp')
-- require('mat.utils') -- REMOVIDO POR, IRONICAMENTE, SER INÚTIL
require('aniseed.env').init()

vim.cmd.colorscheme('gruvbox')

vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format()
end, {})

vim.api.nvim_buf_create_user_command(0, 'CodeEval', function()
  if vim.bo[0].filetype ~= 'markdown' then
    return
  end

  local x, y = unpack(vim.api.nvim_win_get_cursor(0))

  local parser = vim.treesitter.get_parser(0, 'markdown', {})
  local tree = parser:parse()[1]
  local root = tree:root()
  local query = vim.treesitter.parse_query('markdown',
  [[
    (fenced_code_block
      (info_string
        (language) @lang)
      (code_fence_content) @code (#eq? @lang "ruby"))
  ]])


  for id, node in query:iter_captures(root, 0, 0, -1) do
    local data = query.captures[id]
    print(data)
    print(node)
  end

  print(x, y)
end, {})

vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = {'*.gba', '*.nes'},
  callback = function(ev)
    vim.cmd('%!xxd')
    vim.o.ft = 'xxd'
  end
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern ={'*.gba', '*.nes'},
  callback = function(ev)
    vim.cmd('silent %!xxd -r')
  end
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern ={'*.gba', '*.nes'},
  callback = function(ev)
    vim.cmd('%!xxd')
  end
})

vim.api.nvim_create_autocmd('FileReadPost', {
  pattern = { '*.lisp' },
  callback = function(ev)
    require('plenary.job'):new({
      command = 'ros', args = {
        'run',
        '--eval',
        "'(ql:quickload :swank)'",
        '--eval',
        "'(swank:create-server :dont-close t)'"
      }
    }):sync()
  end
})
