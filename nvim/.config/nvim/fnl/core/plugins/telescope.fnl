[{1 :nvim-telescope/telescope.nvim
    :config (fn []
              (let [telescope (require :telescope)]
                (telescope.setup)
                (telescope.load_extension :fzf)
                (telescope.load_extension :live_grep_args)))
    :dependencies [{1 :nvim-telescope/telescope-fzf-native.nvim
                      :build :make}
                      :nvim-lua/plenary.nvim
                      :nvim-telescope/telescope-live-grep-args.nvim]}]
