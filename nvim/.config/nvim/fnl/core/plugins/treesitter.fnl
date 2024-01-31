[{1 "tjdevries/ocaml.nvim" :build #(. (require :ocaml) :update)
    :config #(do
               (. (require :ocaml) :setup)
               (vim.cmd.hi "link @rapper_argument @parameter")
               (vim.cmd.hi "link @rapper_return @type"))}
 {1 "nvim-treesitter/nvim-treesitter"
  :dependencies [{1 "nvim-treesitter/playground"} {1 "danielo515/nvim-treesitter-reason"}
                    ]
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

(tset parser-config :roc {
      :install_info {:url "https://github.com/faldor20/tree-sitter-roc" :files ["src/parser.c" "src/scanner.c"]}
      })
              (vim.filetype.add {:extension {:nu :nu}})
              (vim.filetype.add {:extension {:roc :roc}})
              (vim.filetype.add {:extension {:gren :elm}})
              ))
  :build ":TSUpdate"}]
