;; -*- lexical-binding: t; -*-

(use-package exec-path-from-shell
  :hook (emacs-startup . exec-path-from-shell-initialize))

(provide '+exec-path-from-shell)
