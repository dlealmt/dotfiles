;; -*- lexical-binding: t; -*-

(use-package yasnippet
  :custom
  (yas-snippet-dirs (list (concat user-emacs-directory "share/snippets/")))

  :hook (emacs-startup . yas-global-mode))

(provide '+yasnippet)
