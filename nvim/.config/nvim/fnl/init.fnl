(module matfn)

(defn concat [x y]
  (if (and (= x nil) (= y nil)) {}
      (= x nil) y
      (= y nil) x
      (let [tbl {}]
        (each [k v (pairs x)]
          (tset tbl k v))
        (each [k v (pairs y)]
          (tset tbl k v))
        tbl)))

(defn map
  [mode lhs rhs opts]
  (vim.keymap.set mode lhs rhs (concat { :silent true } opts)))

(defn nmap
  [lhs rhs opts]
  (map "n" lhs rhs opts))

(local opts {:mouse          nil
             :spell          false
             :tabstop        2
             :shiftwidth     2
             :expandtab      true
             :wrap           true
             :relativenumber true
             :number         true
             :autoindent     true})

(each [opt tgl (pairs opts)]
  (tset vim.opt opt tgl))