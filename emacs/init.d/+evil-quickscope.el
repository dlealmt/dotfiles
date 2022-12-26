;; -*- lexical-binding: t; -*-

(use-package evil-quickscope
  :custom
  (evil-quickscope-word-separator " -_()\"\'")
  :hook (prog-mode . turn-on-evil-quickscope-always-mode))

(provide '+evil-quickscope)
