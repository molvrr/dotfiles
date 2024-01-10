(local config-path (vim.fn.stdpath :config))
(local builtin (require :telescope.builtin))
(local find-files builtin.find_files)
(local live-grep builtin.live_grep)
(local help-tags builtin.help_tags)
(local themes (require :telescope.themes))

(fn normal-map [lhs rhs fun ?opts]
  (let [opts (or ?opts {:silent true})]
    (vim.keymap.set :n lhs rhs fun opts)))

(normal-map "<Leader>pf" #((. (. (. (require "telescope") :extensions) :projects) :projects) {}))
(normal-map "<Leader>f" #(find-files (themes.get_dropdown {:previewer false})))
(normal-map "<Leader>/" #(live-grep (themes.get_dropdown {:previewer false})))
(normal-map "<Leader>h" #(help-tags (themes.get_dropdown {:previewer false})))

(normal-map "<Leader>g" #(let [git (require :neogit)] (git.open {:kind "replace"})))
(normal-map "<Leader>e" #(let [oil (require :oil)] (oil.open_float)))
(normal-map "<Leader>x" ":Neorg exec cursor<CR>")

(let [harpoon (require :harpoon)]
  (normal-map "<Leader>a" #(: (: harpoon :list) :append))
  (normal-map "<C-e>" #(: (. harpoon :ui) :toggle_quick_menu (: harpoon :list)))
  (normal-map "<Leader>1" #(: (: harpoon :list) :select 1))
  (normal-map "<Leader>2" #(: (: harpoon :list) :select 2))
  (normal-map "<Leader>3" #(: (: harpoon :list) :select 3))
  (normal-map "<Leader>4" #(: (: harpoon :list) :select 4)))

(normal-map "<localleader>r" ":Neorg exec cursor<CR>")
(normal-map "<C-n>" "<Plug>(YankyCycleForward)")
(normal-map "<C-p>" "<Plug>(YankyCycleBackward)")
(vim.keymap.set [:n :x] "<Leader>sr" #(let [ssr (require :ssr)] (ssr.open)))
(vim.keymap.set [:n :x] "p" "<Plug>(YankyPutAfter)")
(vim.keymap.set [:n :x] "P" "<Plug>(YankyPutBefore)")
(vim.keymap.set [:n :x] "gp" "<Plug>(YankyGPutAfter)")
(vim.keymap.set [:n :x] "gP" "<Plug>(YankyGPutBefore)")

(let [pulapula (require "pulapula")]
  (normal-map "<C-h>" pulapula.move_left)
  (normal-map "<C-l>" pulapula.move_right)
  (normal-map "<C-j>" pulapula.move_down)
  (normal-map "<C-k>" pulapula.move_up)
  (normal-map "<C-w>o" pulapula.maximize))
