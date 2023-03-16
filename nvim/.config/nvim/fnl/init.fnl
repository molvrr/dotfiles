(module matfn)

(defn map
  [mode lhs rhs opts]
  (vim.keymap.set mode lhs rhs opts))

(defn nmap
  [lhs rhs]
  (map "n" lhs rhs { :silent true }))

; (nmap "O" #(print "oi"))

; (local lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim"))
; (when (not (vim.loop.fs_stat lazypath))
;   (print "oi"))

(defn installed?
  [cmd]
  (if (= (vim.fn.executable cmd) 1)
    true
    false))

; (print (installed? "rg"))

(local data (vim.json.decode "{\"name\":\"Mateus\"}"))
