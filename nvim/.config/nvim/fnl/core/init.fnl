(local opts {:autoindent true
             :backup false
             :clipboard "unnamedplus"
             :completeopt "menuone,noselect"
             :expandtab true
             :fillchars "eob: "
             :hlsearch false
             :ignorecase true
             :mouse ""
             :number true
             :relativenumber true
             :shell "bash"
             :shiftwidth 2
             :smartcase true
             :smartindent true
             :spell false
             :splitbelow true
             :splitright true
             :swapfile false
             :syntax "off"
             :tabstop 2
             :undofile true
             :updatetime 700
             :wrap false})


(local globals {:mapleader " "
                :maplocalleader "\\"
                :conjure#filetypes ["fennel" "janet" "hy" "julia" "racket" "scheme" "lua" "lisp" "python" "sql"]
                :conjure#client#scheme#stdio#command "petite"
                :conjure#client#scheme#stdio#prompt_pattern "> $?"
                :clipboard {
                  :name "xsel_override"
                  :copy {:+ "xsel --input --clipboard" :* "xsel --input --primary"}
                  :paste {:+ "xsel --output --clipboard" :* "xsel --output --primary"}
                  :cache_enabled 1
                }
                :zig_fmt_autosave false})

(local extensions {:koka "*.kk"
                   :roc "*.roc"
                   :ocaml "*.mlx"})

(vim.diagnostic.config {:virtual_text true})
(each [key value (pairs opts)] (tset vim.opt key value))
(each [key value (pairs globals)] (tset vim.g key value))
(each [filetype extension (pairs extensions)]
 (vim.api.nvim_create_autocmd [:BufEnter]
                              {:pattern [extension]
                               :callback #(tset vim.o :ft filetype)}))
