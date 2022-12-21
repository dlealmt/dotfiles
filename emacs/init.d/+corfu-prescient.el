;; -*- lexical-binding: t; -*-

(use-package corfu-prescient
  :after (corfu prescient)
  :hook (emacs-startup . corfu-prescient-mode))

(provide '+corfu-prescient)
