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
nmap <leader>ff <cmd>Telescope find_files<cr>
nmap <leader>fg <cmd>Telescope live_grep<cr>
nmap <leader>fb <cmd>Telescope buffers<cr>
nmap <leader>w <cmd>HopWord<cr>
nmap <leader>l <cmd>HopLine<cr>
nmap <leader>s <cmd>Codi javascript<cr>
nnoremap Q <nop>
nnoremap q: <nop>
tnoremap <Esc> <C-\><C-n>
nmap <silent> <Leader>1 :TestFile<CR>
nmap <silent> <Leader>2 :TestNearest<CR>
nmap <silent> <Leader>3 :TestLast<CR>
nmap <silent> <Leader>4 :TestSuite<CR>
map <Leader>o :call openai#Complete()<CR>

call plug#begin()
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'morhetz/gruvbox'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'hrsh7th/cmp-buffer'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'ThePrimeAgen/harpoon'
Plug 'windwp/nvim-autopairs'
Plug 'ThePrimeAgen/vim-be-good'
Plug 'leafo/moonscript-vim'
Plug 'johngrib/vim-game-code-break'
Plug 'johngrib/vim-game-snake'
Plug 'tpope/vim-rails'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'f-person/git-blame.nvim'
Plug 'metakirby5/codi.vim'
Plug 'phaazon/hop.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-test/vim-test'

" DESATIVADOS
"Plug 'navarasu/onedark.nvim'
"Plug 'github/copilot.vim'
"Plug 'thoughtbot/vim-rspec'
"Plug 'akinsho/bufferline.nvim'
"Plug 'rmagatti/auto-session'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'saadparwaiz1/cmp_luasnip'
call plug#end()

lua << EOF
require('hop').setup()
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}
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

local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'solargraph', 'nimls', 'ocamllsp'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
end
require('nvim-autopairs').setup{}
EOF

runtime openai.vim
