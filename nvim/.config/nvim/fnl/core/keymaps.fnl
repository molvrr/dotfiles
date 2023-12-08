(local config-path (vim.fn.stdpath :config))
(local builtin (require :telescope.builtin))
(local find-files builtin.find_files)
(local live-grep builtin.live_grep)
(local help-tags builtin.help_tags)
(local themes (require :telescope.themes))

(fn normal-map [lhs rhs fun ?opts]
  (let [opts (or ?opts {:silent true})]
    (vim.keymap.set :n lhs rhs fun opts)))

(normal-map "<Leader>f" #(find-files (themes.get_dropdown {:previewer false})))
(normal-map "<Leader>/" #(live-grep (themes.get_dropdown {:previewer false})))
(normal-map "<Leader>h" #(help-tags (themes.get_dropdown {:previewer false})))
(normal-map "<Leader>a" #(let [mark (require :harpoon.mark)] (mark.add_file)))

(normal-map "<C-e>"     #(let [ui (require :harpoon.ui)] (ui.toggle_quick_menu)))
(normal-map "<Leader>1" #(let [ui (require :harpoon.ui)] (ui.nav_file 1)))
(normal-map "<Leader>2" #(let [ui (require :harpoon.ui)] (ui.nav_file 2)))
(normal-map "<Leader>3" #(let [ui (require :harpoon.ui)] (ui.nav_file 3)))
(normal-map "<Leader>4" #(let [ui (require :harpoon.ui)] (ui.nav_file 4)))
(normal-map "<Leader>5" #(let [ui (require :harpoon.ui)] (ui.nav_file 5)))
(normal-map "<Leader>x" ":Neorg exec cursor<CR>")

(normal-map "<localleader>r" ":Neorg exec cursor<CR>")
(normal-map "<C-n>" "<Plug>(YankyCycleForward)")
(normal-map "<C-p>" "<Plug>(YankyCycleBackward)")
(vim.keymap.set [:n :x] "<Leader>sr" #(let [ssr (require :ssr)] (ssr.open)))
(vim.keymap.set [:n :x] "p" "<Plug>(YankyPutAfter)")
(vim.keymap.set [:n :x] "P" "<Plug>(YankyPutBefore)")
(vim.keymap.set [:n :x] "gp" "<Plug>(YankyGPutAfter)")
(vim.keymap.set [:n :x] "gP" "<Plug>(YankyGPutBefore)")
