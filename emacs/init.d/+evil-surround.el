;; -*- lexical-binding: t; -*-

(use-package evil-surround
  :after evil
  :hook (evil-mode . global-evil-surround-mode))

(provide '+evil-surround)
