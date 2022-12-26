;; -*- lexical-binding: t; -*-

(use-package flycheck-package
  :after flycheck
  :hook (emacs-startup . flycheck-package-setup))

(provide '+flycheck-package)
