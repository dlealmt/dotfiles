;; -*- lexical-binding: t; -*-

(use-package consult-lsp
  :after lsp-mode

  :bind (:map lsp-mode-map
         ([remap xref-find-apropos] . consult-lsp-symbols)))

(provide '+consult-lsp)
