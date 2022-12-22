;; -*- lexical-binding: t; -*-

(use-package web-mode
  :mode "\\.erb\\'"

  :custom
  (web-mode-css-indent-offset 2)
  (web-mode-sql-indent-offset 2)
  (web-mode-attr-indent-offset nil)
  (web-mode-code-indent-offset 2)
  (web-mode-offsetless-elements nil)
  (web-mode-markup-indent-offset 2)
  (web-mode-attr-value-indent-offset nil)

  :general
  (:keymaps 'web-mode-map
   :states 'normal
   "gj" 'rails-go-to-action))

(provide '+web-mode)
