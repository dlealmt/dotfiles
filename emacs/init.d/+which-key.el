;; -*- lexical-binding: t; -*-

(use-package which-key
  :custom
  (which-key-idle-delay 0.5)

  :config
  (which-key-setup-minibuffer)

  :hook emacs-startup)

(provide '+which-key)
