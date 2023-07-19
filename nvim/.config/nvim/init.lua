require('mat.globals')
require('mat.options')
require('mat.lazy')
require('mat.keymapping')
require('mat.lsp')
-- require('aniseed.env').init()

local themes = {'gruvbox', 'nofrils-dark', 'aomi-grayscale'}
local theme = themes[math.floor(math.random() * #themes) + 1]

vim.cmd.colorscheme('gruvbox')

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
  pattern = '*.re',
  callback = function()
    vim.bo.ft = 'reason'
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

vim.cmd.hi('LspReferenceText guibg=#393737 guifg=#D8D8D8')
vim.cmd.hi('link LspReferenceRead LspReferenceText')
vim.cmd.hi('link LspReferenceWrite LspReferenceText')

vim.api.nvim_create_user_command('ToggleFormat', function(e)
  vim.g.format_on_save = not vim.g.format_on_save
end, {})

vim.api.nvim_create_autocmd({'BufWritePre'}, {
  callback = function(e)
    if not vim.g.format_on_save then
      return nil
    end

    vim.lsp.buf.format({ bufnr = e.buf })
  end
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.nu = {
  install_info = {
    url = "https://github.com/nushell/tree-sitter-nu",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "nu",
}

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.nu',
  callback = function()
    vim.bo.ft = 'nu'
  end
})
