;; -*- lexical-binding: t; -*-

(use-package atomic-chrome
  :hook (emacs-startup . atomic-chrome-start-server))

(provide '+atomic-chrome)
