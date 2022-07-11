autocmd vimenter * ++nested colorscheme gruvbox
autocmd BufEnter *.md ++nested set spell
autocmd BufLeave *.md ++nested set spell
set spelllang=pt_br,en
set mouse=a
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set rnu
set clipboard^=unnamed,unnamedplus
set wrap linebreak
set splitbelow
set splitright
set foldmethod=indent
set nofoldenable
set listchars=space:·
set list
set so=5
set nohlsearch
autocmd FileType * set formatoptions-=cro

let g:python3_host_prog = '/home/illfate/.pyenv/versions/nvim/bin/python'
let g:ruby_host_prog = '/home/illfate/.asdf/installs/ruby/3.1.1/bin/ruby'
let g:mapleader = ' '
let g:gitblame_enabled = 1
let g:gitblame_date_format = '%d/%m/%y %H:%M'
let g:codi#virtual_text = 0

augroup CursorLine
au!
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline
augroup END

nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap <Leader>h <cmd>UndotreeShow<cr>
nmap <Leader>ff <cmd>Telescope find_files<cr>
nmap <Leader>fg <cmd>Telescope live_grep<cr>
nmap <Leader>fb <cmd>Telescope buffers<cr>
nmap <Leader>w <cmd>HopWord<cr>
nmap <Leader>l <cmd>HopLine<cr>
nmap <Leader>s <cmd>Codi javascript<cr>
nnoremap <silent> Q <nop>
nmap <silent> <Leader>1 :TestFile<CR>
nmap <silent> <Leader>2 :TestNearest<CR>
nmap <silent> <Leader>3 :TestLast<CR>
nmap <silent> <Leader>4 :TestSuite<CR>
map <Leader>o :call openai#Complete()<CR>

call plug#begin()
Plug 'azadkuh/vim-cmus'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'neovim/nvim-lspconfig'
Plug 'morhetz/gruvbox'
Plug 'sbdchd/neoformat'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'ThePrimeAgen/harpoon'
Plug 'windwp/nvim-autopairs'
Plug 'ThePrimeAgen/vim-be-good'
Plug 'leafo/moonscript-vim'
Plug 'johngrib/vim-game-code-break'
Plug 'johngrib/vim-game-snake'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'f-person/git-blame.nvim'
Plug 'metakirby5/codi.vim'
Plug 'phaazon/hop.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug '~/misc/neovim-plugins/cmusp.nvim/'

" DESATIVADOS
"Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
"Plug 'nvim-lua/lsp_extensions.nvim'
"Plug 'navarasu/onedark.nvim'
"Plug 'github/copilot.vim'
"Plug 'thoughtbot/vim-rspec'
"Plug 'akinsho/bufferline.nvim'
"Plug 'rmagatti/auto-session'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'hrsh7th/vim-vsnip'
call plug#end()

lua << EOF
require('globals')
require('luasnip.loaders.from_vscode').lazy_load()
require('hop').setup()
require('nvim-treesitter.configs').setup({ 
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  additional_vim_regex_highlighting = false,
})
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<ESC>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path',
      option = {
          trailing_slash = true,

        }
    }
  })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'solargraph', 'ocamllsp', 'sorbet'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

require('lspconfig').sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
      debounce_text_changes = 150,
    },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        },
      diagnostics = {
        globals = {'vim'}
        },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        },
      telemetry = {
        enable = false,
        }
    }
  }
})

require('nvim-autopairs').setup{}
require('telescope').setup({
  defaults = {
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    },
  extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
        }
    }
})

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  severity_sort = true
})

EOF
runtime openai.vim
