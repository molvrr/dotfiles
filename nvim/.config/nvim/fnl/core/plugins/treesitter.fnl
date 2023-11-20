[{1 "nvim-treesitter/nvim-treesitter"
   :dependencies ["nvim-treesitter/playground"]
   :config (fn [_opts]
             (let [cfgs (require :nvim-treesitter.configs)]
               (cfgs.setup {:indent {:enable true}
                            :playground {:enable true}
                            :highlight {:enable true}})))
   :build ":TSUpdate"}]
