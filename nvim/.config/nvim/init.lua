require('mat.globals')
require('mat.options')
require('mat.lazy')
require('mat.keymapping')
require('mat.lsp')
-- require('aniseed.env').init()

local themes = {'gruvbox', 'nofrils-dark', 'aomi-grayscale'}
local theme = themes[math.floor(math.random() * #themes) + 1]

-- vim.cmd.colorscheme('matheme')
vim.cmd.colorscheme('cake16')

vim.cmd.highlight('MiniStarterHeader guifg=#aa00aa')

vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format()
end, {})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.typ',
  callback = function()
    vim.bo.ft = 'typst'
  end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.ml',
  callback = function()
    vim.bo.indentexpr = nil
  end
})

local function create_job(args)
  args = args or {}

  vim.fn.jobstart(args.cmd, {
    on_stdout = function(job, data)
      print(vim.inspect(data))
    end,
    stdout_buffered = true
  })
end

vim.api.nvim_create_user_command('Rm', function(e)
  local args = e.fargs

  print(vim.inspect(args))

  for _, v in ipairs(args) do
    local file = vim.fn.expand(v)
  end
end, { nargs = '+', bang = true })

vim.cmd.hi('LspReferenceText guibg=#393737 guifg=#D8D8D8')
vim.cmd.hi('link LspReferenceRead LspReferenceText')
vim.cmd.hi('link LspReferenceWrite LspReferenceText')

vim.api.nvim_create_user_command('Tonote', function(e)
  print(vim.inspect(e))
end, { range = true })


-- %f

local function status_line()
  local file = ' %f'
  local line = '%50(%l:%c %)'

  local branch = vim.fn.system('git branch --show-current')
  branch = string.sub(branch, 1, #branch - 1)

  local t = { file, '%=', line, branch }

  vim.wo.stl = table.concat(t)
end

local id = vim.api.nvim_create_augroup('StlBoa', {})

vim.api.nvim_create_autocmd({ 'WinEnter', 'WinLeave', 'VimEnter', 'BufEnter' }, {
  group = id,
  callback = function()
    status_line()
  end
})

