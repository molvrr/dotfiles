[{1 "echasnovski/mini.pairs"
  :config (fn [] ((. (require :mini.pairs) :setup)))}
 {1 "echasnovski/mini.surround"
  :config (fn [] ((. (require :mini.surround) :setup)))}
 {1 "julienvincent/nvim-paredit" :opts {:use_default_keys true}}
 {1 "julienvincent/nvim-paredit-fennel"
  :opts {}
  :ft [:fennel]
  :dependencies [{1 "julienvincent/nvim-paredit"}]}
 {1 "ThePrimeAgen/harpoon" :branch "harpoon2" :dependencies [{1 "nvim-lua/plenary.nvim"}] :config (fn [] (local harpoon (require :harpoon)) (: harpoon :setup))}
 {1 "numToStr/Comment.nvim" :opts {}}
 {1 "stevearc/dressing.nvim" :opts {}}
 {1 "cshuaimin/ssr.nvim"}
 {1 "nvim-neorg/neorg"
 :build ":Neorg sync-parsers"
 :dependencies [{1 "nvim-lua/plenary.nvim"} {1 "laher/neorg-exec"}]
 :opts {:load {
             :core.defaults {}
             :core.concealer {}
             :external.exec {}
             :core.dirman {:config {:workspaces {:notes "~/notes-neorg"} :default_workspace :notes}}}}}
 {1 "gbprod/yanky.nvim" :opts {}}
 {1 "Olical/conjure" :enabled false}
 {1 "ctrlpvim/ctrlp.vim"}
 {1 "edgedb/edgedb-vim"}
 {1 "sourcegraph/sg.nvim"}]