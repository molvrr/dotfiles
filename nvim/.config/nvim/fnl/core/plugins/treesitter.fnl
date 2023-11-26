[{1 "nvim-treesitter/nvim-treesitter"
  :dependencies [{1 "nvim-treesitter/playground"}]
  :config (fn [_opts]
            (let [cfgs (require :nvim-treesitter.configs)
                  parser-config ((. (require :nvim-treesitter.parsers) :get_parser_configs))]
              (cfgs.setup {:indent {:enable false}
                           :playground {:enable true}
                           :highlight {:enable true}
                           :additional_vim_regex_highlighting false})
              (tset parser-config :nu {
                    :install_info {:url "https://github.com/LhKipp/tree-sitter-nu"
                                   :files ["src/parser.c" "src/scanner.c"]
                                   :branch "main"}
                    :filetype :nu})
              (vim.filetype.add {:extension {:nu :nu}})))
  :build ":TSUpdate"}]
