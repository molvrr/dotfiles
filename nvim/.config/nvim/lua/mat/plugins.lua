vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tjdevries/colorbuddy.vim'
  use 'tjdevries/gruvbuddy.nvim'
  use 'tjdevries/train.nvim'
  use 'azadkuh/vim-cmus'
  use {'nvim-telescope/telescope.nvim', config = function()
    require('telescope').setup({
      defaults = {
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
          }
        },
      pickers = {
        find_files = {
          mappings = {
            n = {
              ["cd"] = function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                require("telescope.actions").close(prompt_bufnr)
                -- Depending on what you want put `cd`, `lcd`, `tcd`
                vim.cmd(string.format("silent lcd %s", dir))
              end
            }
          }
        }
      }
    })
  end}
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use {'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
  end}
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'neovim/nvim-lspconfig'
  use 'morhetz/gruvbox'
  use 'sbdchd/neoformat'
  use 'mbbill/undotree'
  use {'mattn/emmet-vim', ft = { 'html' } }
  use 'ThePrimeAgen/harpoon'
  use 'ThePrimeAgen/vim-be-good'
  use 'leafo/moonscript-vim'
  use 'johngrib/vim-game-code-break'
  use 'johngrib/vim-game-snake'
  use({ 'iamcco/markdown-preview.nvim', run = 'cd app && npm install', setup = function() vim.g.mkdp_filetypes = { 'markdown' } end, ft = { 'markdown' }, })
  use 'f-person/git-blame.nvim'
  use 'metakirby5/codi.vim'
  use 'phaazon/hop.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-test/vim-test'
  use 'tpope/vim-rails'
  use 'tpope/vim-fugitive'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use '~/misc/neovim-plugins/cmusp.nvim/'
  use '~/misc/neovim-plugins/dock.nvim/'
end)

