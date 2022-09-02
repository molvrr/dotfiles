local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      {'kyazdani42/nvim-web-devicons', opt = true},
    },
    config = function()
      require('lualine').setup({
        options = {
          globalstatus = false,
          theme = 'gruvbox',
        },
        sections = {
          lualine_c = {
            {
            'filename',
            path = 3
          }}
        }
      })
    end}
  use 'tjdevries/colorbuddy.vim'
  --use 'tjdevries/gruvbuddy.nvim'
  use 'tjdevries/train.nvim'
  use 'azadkuh/vim-cmus'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {'nvim-telescope/telescope.nvim', config = function()
    require('telescope').setup({
      defaults = {
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        },
      extensions = {
        fzy_native = {
          override_generic_sorter = true,
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
    require('telescope').load_extension('file_browser')
  end
  }
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup({}) end}
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        --indent = { enable = true },
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
    run = ':TSUpdate',
    requires = 'nvim-treesitter/nvim-treesitter-textobjects'
  }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'neovim/nvim-lspconfig'
  use 'morhetz/gruvbox'
  use {'sbdchd/neoformat', cmd = 'Neoformat'}
  use 'mbbill/undotree'
  use {'mattn/emmet-vim', ft = { 'html' } }
  use 'ThePrimeAgen/harpoon'
  use 'ThePrimeAgen/vim-be-good'
  use 'leafo/moonscript-vim'
  use 'johngrib/vim-game-code-break'
  use 'johngrib/vim-game-snake'
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' }
  }
  use 'f-person/git-blame.nvim'
  use 'vim-test/vim-test'
  use 'tpope/vim-rails'
  use 'tpope/vim-fugitive'
  use 'saadparwaiz1/cmp_luasnip'
  use {'L3MON4D3/LuaSnip', config = function() require('luasnip.loaders.from_vscode').lazy_load() end}
  use 'rafamadriz/friendly-snippets'
  use { 'mfussenegger/nvim-dap',
    requires = {{
      'suketa/nvim-dap-ruby',
      config = function ()
        require('dap-ruby').setup()
      end
    },
    {
        'jbyuki/one-small-step-for-vimkind',
        config = function ()
          local dap = require('dap')
          dap.configurations.lua = {
            {
              type = 'nlua',
              request = 'attach',
              name = "Attach to running Neovim instance",
              host = function()
                local value = vim.fn.input('Host [127.0.0.1]: ')
                if value ~= "" then
                  return value
                end
                return '127.0.0.1'
              end,
              port = function()
                local val = tonumber(vim.fn.input('Port: '))
                assert(val, "Please provide a port number")
                return val
              end,
            }
          }

          dap.adapters.nlua = function(callback, config)
            callback({ type = 'server', host = config.host, port = config.port })
          end
        end
      }
    }
  }
  use 'lewis6991/impatient.nvim'
  use 'rhysd/vim-grammarous'

  use 'MunifTanjim/nui.nvim'
  use 'skanehira/denops-docker.vim'
  use 'tpope/vim-commentary'
  use 'Olical/conjure'
  use 'tpope/vim-dispatch'
  use 'clojure-vim/vim-jack-in'
  use 'radenling/vim-dispatch-neovim'
  use 'tpope/vim-surround'
  use 'tpope/vim-endwise'
  use {'navarasu/onedark.nvim',
  config = function ()
    --require('onedark').setup({
    --  style = 'warmer',
    --  transparent = false,
    --})
    --require('onedark').load({})
  end}
  use 'purescript-contrib/purescript-vim'
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'tailwindcss' }
      })
    end
  }
  use 'rescript-lang/vim-rescript'
  use 'zah/nim.vim'
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        default = {
          'class',
          'function',
          'method',
          'for',
          'if',
        }
      })
    end
  }
  use 'nvim-treesitter/playground'

if Packer_bootstrap then
  require('packer').sync()
end
end)
