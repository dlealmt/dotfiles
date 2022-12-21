;; -*- lexical-binding: t; -*-

(use-package diff-hl
  :hook
  ((magit-pre-refresh . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh)
   (emacs-startup . global-diff-hl-mode)))

(provide '+diff-hl)
