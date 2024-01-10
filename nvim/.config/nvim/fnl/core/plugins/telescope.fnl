[{1 :nvim-telescope/telescope.nvim
  :config #(let [telescope (require :telescope)]
             (telescope.setup)
             (telescope.load_extension :fzf)
             (telescope.load_extension :live_grep_args)
             (telescope.load_extension :yank_history))
  :dependencies [{1 :nvim-telescope/telescope-fzf-native.nvim :build :make}
                 {1 :nvim-lua/plenary.nvim}
                 {1 :nvim-telescope/telescope-live-grep-args.nvim}]}]
