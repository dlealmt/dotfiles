;; -*- lexical-binding: t; -*-

(use-package vertico-prescient
  :after (vertico prescient)
  :hook (emacs-startup . vertico-prescient-mode))

(provide '+vertico-prescient)
