;; -*- lexical-binding: t; -*-

(use-package embark
  :custom
  (embark-indicators '(embark-highlight-indicator embark-isearch-highlight-indicator))
  (prefix-help-command #'embark-prefix-help-command)

  :general
  (:states '(normal motion visual)
   ";" 'embark-act)
  (:states 'insert
   "C-;" 'embark-act)
  (:keymaps 'embark-symbol-map
   "h" #'helpful-symbol))

(provide '+embark)
