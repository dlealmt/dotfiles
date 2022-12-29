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
  (:keymaps 'embark-general-map
   "y" 'embark-copy-as-kill)
  (:keymaps 'embark-expression-map
   "x" 'kill-region)
  (:keymaps 'embark-symbol-map
   "h" 'helpful-symbol))

(provide '+embark)
