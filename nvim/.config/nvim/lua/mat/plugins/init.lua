local M = {
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    }
  },
  'mbbill/undotree',
  'mattn/emmet-vim',
  { 'ThePrimeAgen/harpoon', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'Olical/conjure', ft = { 'lisp', 'racket' } },
  'clojure-vim/vim-jack-in',
  'nvim-treesitter/playground',
  'airblade/vim-gitgutter',
  'nkrkv/nvim-treesitter-rescript',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'tpope/vim-dadbod',
  'tpope/vim-abolish',
  'tpope/vim-rails',
  'tpope/vim-fugitive',
  'tpope/vim-dispatch',
  'kristijanhusak/vim-dadbod-ui',
  'thoughtbot/vim-rspec',
  'preservim/vimux',
  { 'windwp/nvim-projectconfig', opts = {} },
  'pbrisbin/vim-mkdir',
  'Olical/aniseed',
  -- 'junegunn/vim-easy-align',
  'elixir-editors/vim-elixir',
  { 'folke/which-key.nvim',            opts = {} },
  'folke/zen-mode.nvim',
  {
    'nvim-neorg/neorg',
    ft = 'norg',
    opts = {
      load = {
        ["core.tangle"] = {},
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.export"] = {}
      }
    }
  },
  'folke/trouble.nvim',
  { 'numToStr/Comment.nvim', opts = {} },
  { 'folke/todo-comments.nvim', opts = { signs = false } }, -- zoa a tela inicial
  { 'echasnovski/mini.surround', config = function() require('mini.surround').setup() end },
  {
    'echasnovski/mini.pairs',
    enabled = false,
    config = function() require('mini.pairs').setup() end
  },
  {
    'windwp/nvim-autopairs',
    opts = {}
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- 'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    }
  },
  { 'TimUntersberger/neogit', opts = {} },
  --   'ThePrimeAgen/vim-be-good',
  --   'robertmeta/nofrils',
  --   'ryanpcmcquen/true-monochrome_vim',
  'eihigh/vim-aomi-grayscale',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  { 'echasnovski/mini.align', config = function() require('mini.align').setup() end },
  { 'windwp/nvim-ts-autotag' },
  { 'nvim-pack/nvim-spectre' },
  { 'navarasu/onedark.nvim' },
  -- { 'nvim-lualine/lualine.nvim', opts = {} },
  { 'wlangstroth/vim-racket' },
  { 'LnL7/vim-nix' },
  { 'scalameta/nvim-metals' },
  'danielo515/nvim-treesitter-reason',
  -- 'Exafunction/codeium.vim'
  'github/copilot.vim'
}

return M
