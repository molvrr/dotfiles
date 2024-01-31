;; List of servers
(local servers [{:name :rust_analyzer :opts {}}
                {:name :ocamllsp :opts {:get_language_id (fn [_ ftype] ftype)}}
                {:name :nushell :opts {}}
                {:name :elmls :opts {}}
                {:name :pylsp :opts {}}
                {:name :tsserver :opts {}}
                {:name :hls :opts {}}
                {:name :dartls :opts {}}
                {:name :phpactor :opts {}}
                {:name :roc :opts {}}
                {:name :elixirls :opts {:cmd ["elixir-ls"]}}
                {:name :gopls :opts {}}
                ; {:name :unison :opts {}}
                {:name :kotlin_language_server :opts {}}
                {:name :omnisharp :opts {:cmd ["OmniSharp"]}}])

(fn normal-map [lhs rhs fun ?opts]
  (let [opts (or ?opts {:silent true})]
    (vim.keymap.set :n lhs rhs fun opts)))

(fn on_attach [client bufnr]

  ; (if (or (not (= vim.o.ft :unison)) (not (= vim.o.ft :ocaml)))
  ;     (vim.api.nvim_create_autocmd [:BufWritePre]
  ;                                  {:buffer bufnr :callback #(vim.lsp.buf.format)}))

  (normal-map "gd" vim.lsp.buf.definition)
  (normal-map "<F2>" vim.lsp.buf.rename)
  (normal-map "[d" vim.diagnostic.goto_prev)
  (normal-map "]d" vim.diagnostic.goto_next)
  (normal-map "K" vim.lsp.buf.hover)
  (normal-map "<Leader>lf" vim.lsp.buf.format)
  (normal-map "<Leader>la" vim.lsp.buf.code_action))

(fn setup-lsp []
  (let [lspconfig (require :lspconfig)
                  cmp (require :cmp)
                  cmp-nvim-lsp (require :cmp_nvim_lsp)
                  luasnip (require :luasnip)]
    (luasnip.config.setup {})
    (cmp.setup {:snippet {:expand #(luasnip.lsp_expand $1.body)}
               :mapping (cmp.mapping.preset.insert {:<C-b> (cmp.mapping.scroll_docs -4)
                                                   :<C-f> (cmp.mapping.scroll_docs 4)
                                                   :<C-Space> (cmp.mapping.complete)
                                                   :<C-e> (cmp.mapping.abort)
                                                   :<CR> (cmp.mapping.confirm {:select false})
                                                   :<Tab> (cmp.mapping #(if (cmp.visible)
                                                                            (cmp.select_next_item)
                                                                            (luasnip.expand_or_jumpable)
                                                                            (luasnip.expand_or_jump)
                                                                            ($1)))
                                                   :<S-Tab> (cmp.mapping #(if (cmp.visible)
                                                                              (cmp.select_prev_item)
                                                                              (luasnip.jumpable -1)
                                                                              (luasnip.jump -1)
                                                                              ($1)))})
               :sources (cmp.config.sources [{:name "nvim_lsp"}
                                                    {:name "luasnip"}
                                                    {:name "conjure"}])})

    (local configs (require :lspconfig.configs))
    (tset configs :roc {:default_config {:cmd ["roc_ls"] :filetypes ["roc"] :root_dir (lspconfig.util.root_pattern ".git")}})

    ((. (require :sg) :setup))

    ((. (. (require :lspconfig) :lua_ls) :setup) {:on_init (fn [client]
                                                             (local path (. (. client.workspace_folders 1) :name))
                                                             (when (and (not (vim.loop.fs_stat (.. path :/.luarc.json)))
                                                                        (not (vim.loop.fs_stat (.. path :/.luarc.jsonc))))
                                                               (set client.config.settings
                                                                    (vim.tbl_deep_extend :force
                                                                                         client.config.settings
                                                                                         {:Lua {:runtime {:version :LuaJIT}
                                                                                         :workspace {:checkThirdParty false
                                                                                         :library [vim.env.VIMRUNTIME]}}}))
                                                               (client.notify :workspace/didChangeConfiguration
                                                                              {:settings client.config.settings}))
                                                             true)})	

    (local capabilities (cmp-nvim-lsp.default_capabilities))
    (each [_ server (ipairs servers)]
      ((. lspconfig server.name :setup) (vim.tbl_extend :force
                                                        {: capabilities
                                                        : on_attach}
                                                        server.opts)))))

[{1 "neovim/nvim-lspconfig"
    :config setup-lsp
    :dependencies [{1 "j-hui/fidget.nvim"
                      :tag "legacy"
                      :opts {:window {:blend 0} :text {:spinner "star"}}}
                      {1 "jubnzv/virtual-types.nvim"}
                      {1 "hrsh7th/nvim-cmp"}
                      {1 "hrsh7th/cmp-nvim-lsp"}
                      {1 "L3MON4D3/LuaSnip"}
                      {1 "saadparwaiz1/cmp_luasnip"}
                      {1 "PaterJason/cmp-conjure" :enabled false}]}]
