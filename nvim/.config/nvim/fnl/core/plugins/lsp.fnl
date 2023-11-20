(fn normal-map [lhs rhs fun ?opts]
  (let [opts (or ?opts {:silent true})]
    (vim.keymap.set :n lhs rhs fun opts)))

(fn on_attach [client bufnr]
  (normal-map "gd" vim.lsp.buf.definition)
  (normal-map "<F2>" vim.lsp.buf.rename)
  (normal-map "[d" vim.diagnostic.goto_prev)
  (normal-map "]d" vim.diagnostic.goto_next)
  (normal-map "K" vim.lsp.buf.hover)
  (normal-map "<Leader>lf" vim.lsp.buf.format)
  (normal-map "<Leader>la" vim.lsp.buf.code_action))

(local capabilities (vim.lsp.protocol.make_client_capabilities))

[{1 "neovim/nvim-lspconfig" :config (fn []
                                      (let [lspconfig (require :lspconfig)]
                                        ; (local border [
                                        ;                ["🭽" "FloatBorder"]
                                        ;                ["▔" "FloatBorder"]
                                        ;                ["🭾" "FloatBorder"]
                                        ;                ["▕" "FloatBorder"]
                                        ;                ["🭿" "FloatBorder"]
                                        ;                ["▁" "FloatBorder"]
                                        ;                ["🭼" "FloatBorder"]
                                        ;                ["▏" "FloatBorder"]
                                        ;               ])
                                        ;
                                        ; (local handlers {
                                        ;        :textDocument/hover (vim.lsp.with vim.lsp.handlers.hover {: border})})
                                        ((. lspconfig "rust_analyzer" :setup) {: capabilities : on_attach})
                                        ((. lspconfig "ocamllsp":setup) {: capabilities : on_attach})))
                            :dependencies [{1 "j-hui/fidget.nvim" :tag "legacy"
                                                                  :opts {:text {:spinner "star"}}}]}]
