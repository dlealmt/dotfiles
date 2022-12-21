;;; init --- Evil configuration
;;;
;;; Commentary:
;;;
;;; No comment.
;;;
;;; Code:

;; -*- lexical-binding: t; -*-

(use-package evil
  :preface
  (setq evil-want-keybinding nil)

  :custom
  (evil-echo-state nil)
  (evil-search-module 'isearch)
  (evil-shift-width 2)
  (evil-undo-system 'undo-redo)
  (evil-want-C-u-scroll t)
  (evil-want-integration t)

  :hook (emacs-startup . evil-mode))

(provide '+evil)
;;; +evil.el ends here
