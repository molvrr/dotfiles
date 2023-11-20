(local opts
       {
         :backup false
         :clipboard "unnamedplus"
         :completeopt "menuone,noselect"
         :expandtab true
         :fillchars "eob: "
         :hlsearch false
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
       })

(local globals {:mapleader " " :maplocalleader "\\"})

(each [key value (pairs opts)] (tset vim.opt key value))

(each [key value (pairs globals)] (tset vim.g key value))
