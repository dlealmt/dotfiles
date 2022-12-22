;; -*- lexical-binding: t; -*-

(use-package tree-sitter
  :hook ((tree-sitter-after-on . tree-sitter-hl-mode)
         (emacs-startup . global-tree-sitter-mode)))

(provide '+tree-sitter)
