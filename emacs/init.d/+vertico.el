;; -*- lexical-binding: t; -*-

(use-package vertico
  :custom
  (vertico-count 10)
  (vertico-cycle t)
  (vertico-resize nil)

  :hook (emacs-startup . vertico-mode))

(use-package vertico-flat
  :ensure nil
  :custom
  (vertico-flat-format `(:multiple "%s"
                         :single #("[%s]" 0 1
                                   (face minibuffer-prompt)
                                   1 3
                                   (face success)
                                   3 4
                                   (face minibuffer-prompt))
                         :prompt #("(%s)" 0 1
                                   (face minibuffer-prompt)
                                   3 4
                                   (face minibuffer-prompt))
                         :separator "     "
                         :ellipsis #("…" 0 1 (face minibuffer-prompt))
                         :no-match "[No match]"))

  :hook (vertico-mode . vertico-flat-mode))

(provide '+vertico)
