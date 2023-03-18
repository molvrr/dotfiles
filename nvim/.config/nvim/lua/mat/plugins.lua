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
    'nvim-lualine/lualine.nvim', -- TODO: Exibir caminho completo dos arquivos
    opts = {
        options = {
          theme = 'gruvbox'
        },
      },
    dependencies = { {'kyazdani42/nvim-web-devicons', lazy = true } }
  },
  'morhetz/gruvbox',
  'nvim-telescope/telescope-file-browser.nvim',
  {
    'nvim-telescope/telescope.nvim',
    config = function()
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
        indent = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil
        },
        auto_install = false,
        highlight = { enable = true },
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
        }
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
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      {'j-hui/fidget.nvim', opts = {}},
      'folke/neodev.nvim'
    }
  },
  -- 'sbdchd/neoformat',
  'mbbill/undotree',
  'mattn/emmet-vim',
  {
    'ThePrimeAgen/harpoon',
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 20,
      }
    }
  },
  'leafo/moonscript-vim',
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end
  },
  'vim-test/vim-test',
  'saadparwaiz1/cmp_luasnip',
  {'L3MON4D3/LuaSnip', config = function() require('luasnip.loaders.from_vscode').lazy_load() end},
  'rafamadriz/friendly-snippets',
  'MunifTanjim/nui.nvim',
  'skanehira/denops-docker.vim',
  { 'Olical/conjure', enabled = false },
  'clojure-vim/vim-jack-in',
  'radenling/vim-dispatch-neovim',
  'purescript-contrib/purescript-vim',
  'rescript-lang/vim-rescript',
  'zah/nim.vim',
  -- { 'nvim-treesitter/nvim-treesitter-context', config = function() require('treesitter-context').setup({ default = { 'class', 'function', 'method', 'for', 'if', } }) end },
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
  'tpope/vim-abolish',
  'tpope/vim-rails',
  'tpope/vim-fugitive',
  'tpope/vim-dispatch',
  -- 'tpope/vim-commentary',
  -- 'tpope/vim-surround',
  -- 'tpope/vim-endwise',
  'kristijanhusak/vim-dadbod-ui',
  'thoughtbot/vim-rspec',
  'preservim/vimux',
  { 'windwp/nvim-projectconfig', opts = {} },
  'vim-crystal/vim-crystal',
  'jubnzv/virtual-types.nvim',
  'pbrisbin/vim-mkdir',
  'Olical/aniseed',
  'junegunn/vim-easy-align',
  'elixir-editors/vim-elixir',
  'mfussenegger/nvim-dap',
  { 'rcarriga/nvim-dap-ui', opts = {} },
  { 'suketa/nvim-dap-ruby', opts = {} },
  { 'theHamsta/nvim-dap-virtual-text', opts = {} },
  { 'folke/which-key.nvim', opts = {} },
  'folke/zen-mode.nvim',
  {
    'nvim-neorg/neorg',
    ft = 'norg',
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.export"] = {}
      }}
  },
  {
    'nvim-orgmode/orgmode',
    enabled = false,
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup()
    end
  },
  'folke/trouble.nvim',
  'lervag/vimtex',
  { 'numToStr/Comment.nvim', opts = {} },
  { 'folke/todo-comments.nvim', opts = {} },
  { 'echasnovski/mini.surround', config = function() require('mini.surround').setup() end },
  { 'echasnovski/mini.pairs', config = function() require('mini.pairs').setup() end },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  {
    'echasnovski/mini.starter',
    version = false,
    opts = {
      header = table.concat({
          '⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⠖⠚⠛⠛⠛⠛⠒⠶⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⣠⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⢶⠒⠒⠒⠦⣄',
          '⠀⠀⠀⠀⢀⡞⠁⠀⠀⠀⠀⠀⠀⠀⡄⠐⡄⠀⠀⡏⠑⡄⠀⠑⣄⠀⠀⠸⡆',
          '⠀⠀⠀⢠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⣀⣵⠀⠀⢹⣤⣿⠀⠀⠈⢆⠀⢸⠇',
          '⠀⠀⢀⣏⠤⠂⠀⠀⠀⠀⠀⠀⠀⠀⠸⠻⠟⡄⠀⠀⡟⠋⠆⣀⣤⡈⣦⡞⠀',
          '⠀⣠⠟⠁⠀⠀⠀⠀⠀⠀⠀⣴⣶⣦⡄⠣⠴⠁⠀⢀⡌⠒⠀⠛⠛⠁⢸⠀⠀',
          '⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⢸⡇⠀',
          '⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⢔⣲⡿⠉⠛⠒⢄⠀⠀⠀⠀⠀⠀⢸⠀⠀',
          '⠸⣆⡀⠀⠀⠀⠀⢀⡀⢀⠔⠉⠀⠀⠀⠀⠀⠀⠀⠈⡆⠀⠀⠀⠀⢀⡟⠀⠀',
          '⠀⠀⠉⠻⣟⠋⠉⠉⡰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⢀⡾⠁⠀⠀',
          '⠀⠀⠀⠀⠙⢦⡀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⣠⠞⠁⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠙⢾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠁⠀⡠⢾⠏⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀⢠⠾⠴⠒⠉⢀⡞⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⢤⣄⣀⡠⠤⠚⠁⠀⠀⠀⣠⠟⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⠀⠀⠀⣀⡀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⣄⣀⣘⣯⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
        }, "\n"),
      footer = '',
    },
    config = function(opts)
      require('mini.starter').setup(opts.opts)
    end
  }
})
