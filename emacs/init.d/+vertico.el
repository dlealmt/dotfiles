;; -*- lexical-binding: t; -*-

(use-package vertico
  :custom
  (vertico-count 10)
  (vertico-cycle t)
  (vertico-resize nil)

  :hook (emacs-startup . vertico-mode))

(provide '+vertico)
