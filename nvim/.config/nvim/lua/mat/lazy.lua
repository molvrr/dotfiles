local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          globalstatus = false,
          theme = 'gruvbox'
        },
        sections = {
          lualine_c = {
            {
              'filename',
              path = 3
            }
          }
        }
      })
    end,
    dependencies = { {'kyazdani42/nvim-web-devicons', lazy = true } }
  },
  'morhetz/gruvbox',
  'nvim-telescope/telescope-file-browser.nvim',
  {'nvim-telescope/telescope.nvim', config = function()
    require('telescope').setup({
      defaults = {
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
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
      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('fzf')
    end,
    dependencies = {
      'nvim-telescope/telescope-file-browser.nvim'
    }
  },
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        -- indent = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil
        },
        auto_install = true,
        highlight = { enable = true,
        additional_vim_regex_highlighting = false },
        incremental_selection = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
            }
          }

        },
      })
    end,
    build = ':TSUpdate',
    dependencies = 'nvim-treesitter/nvim-treesitter-textobjects'
  },
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'neovim/nvim-lspconfig',
  'sbdchd/neoformat',
  'mbbill/undotree',
  'mattn/emmet-vim',
  'ThePrimeAgen/harpoon',
  'ThePrimeAgen/vim-be-good',
  'leafo/moonscript-vim',
  'johngrib/vim-game-code-break',
  'johngrib/vim-game-snake',
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end
  },
  'f-person/git-blame.nvim',
  'vim-test/vim-test',
  'tpope/vim-rails',
  'tpope/vim-fugitive',
  'saadparwaiz1/cmp_luasnip',
  {'L3MON4D3/LuaSnip', config = function() require('luasnip.loaders.from_vscode').lazy_load() end},
  'rafamadriz/friendly-snippets',
  'lewis6991/impatient.nvim',
  'rhysd/vim-grammarous',
  'MunifTanjim/nui.nvim',
  'skanehira/denops-docker.vim',
  'tpope/vim-commentary',
  'Olical/conjure',
  'tpope/vim-dispatch',
  'clojure-vim/vim-jack-in',
  'radenling/vim-dispatch-neovim',
  'tpope/vim-surround',
  -- use 'tpope/vim-endwise'
  'purescript-contrib/purescript-vim',
  { 'williamboman/mason.nvim', config = function() require('mason').setup() end },
  { 'williamboman/mason-lspconfig.nvim', config = function() require('mason-lspconfig').setup() end },
  'rescript-lang/vim-rescript',
  'zah/nim.vim',
  { 'nvim-treesitter/nvim-treesitter-context', config = function() require('treesitter-context').setup({ default = { 'class', 'function', 'method', 'for', 'if', } }) end },
  'nvim-treesitter/playground',
  'airblade/vim-gitgutter',
  'nkrkv/nvim-treesitter-rescript',
  'p00f/nvim-ts-rainbow',
  'artanikin/vim-synthwave84',
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'mrshmllow/document-color.nvim', config = function()
      require("document-color").setup {
        mode = "background", -- "background" | "foreground" | "single"
      }
    end
  },
  'jubnzv/virtual-types.nvim',
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'thoughtbot/vim-rspec',
  'preservim/vimux',
  { 'windwp/nvim-projectconfig', config = function() require('nvim-projectconfig').setup() end},
  'tpope/vim-abolish',
  'vim-crystal/vim-crystal',
  'jubnzv/virtual-types.nvim',
  'RRethy/nvim-treesitter-endwise',
  'pbrisbin/vim-mkdir',
  'Olical/aniseed',
  'gennaro-tedesco/nvim-jqx',
  'gleam-lang/gleam.vim',

  -- {
    --   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --   config = function()
      --     require("lsp_lines").setup()
      --   end,
      -- }
})
