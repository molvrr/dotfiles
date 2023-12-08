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
             :signcolumn :number
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

(vim.diagnostic.config {:virtual_text true})

(local globals {:mapleader " "
                :maplocalleader "\\"
                :conjure#filetypes ["clojure" "fennel" "janet" "hy" "julia" "racket" "scheme" "lua" "lisp" "python" "sql"]
                :conjure#client#scheme#stdio#command "petite"
                :conjure#client#scheme#stdio#prompt_pattern "> $?"})

(each [key value (pairs opts)] (tset vim.opt key value))

(each [key value (pairs globals)] (tset vim.g key value))

(vim.api.nvim_create_autocmd [:BufEnter] { :pattern ["*.kk"] :callback #(tset vim.o :ft :koka) })
(vim.api.nvim_create_autocmd [:BufEnter] { :pattern ["*.roc"] :callback #(tset vim.o :ft :roc) })
(vim.api.nvim_create_autocmd [:BufEnter] { :pattern ["*.mlx"] :callback #(tset vim.o :ft :ocaml) })
