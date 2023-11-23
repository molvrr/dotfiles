[{1 "nvim-treesitter/nvim-treesitter"
  :dependencies [{1 "nvim-treesitter/playground"}]
  :config (fn [_opts]
            (let [cfgs (require :nvim-treesitter.configs)]
              (cfgs.setup {:indent {:enable false}
                           :playground {:enable true}
                           :highlight {:enable true}
                           :additional_vim_regex_highlighting false})))
  :build ":TSUpdate"}]
