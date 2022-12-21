;; -*- lexical-binding: t; -*-

(use-package evil-matchit
  :after evil
  :hook (evil-mode . global-evil-matchit-mode))

(provide '+evil-matchit)
