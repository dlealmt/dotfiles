;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :custom
  (lsp-diagnostic-clean-after-change t)
  (lsp-diagnostics-flycheck-default-level 'ẃarning)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-solargraph-use-bundler t)
  (lsp-keymap-prefix "s-@"))

(provide '+lsp)
