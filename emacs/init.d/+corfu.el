;; -*- lexical-binding: t; -*-

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 0)
  (corfu-auto-delay 2.0)
  (corfu-count 16)
  (corfu-cycle t)
  (corfu-preselect-first nil)
  (corfu-preview-current t)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match t)
  (corfu-separator ?\s)

  :hook
  (corfu-mode . corfu-popupinfo-mode)
  (emacs-startup . global-corfu-mode))

(provide '+corfu)
