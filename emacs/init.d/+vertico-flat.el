;; -*- lexical-binding: t; -*-

(use-package vertico-flat
  :ensure nil
  :custom
  (vertico-flat-format `(:multiple ,(concat "%s" (propertize "\n" 'line-height 36
                                                             'line-spacing 13))
                         :single #("[%s]\n" 0 1
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
                         :ellipsis "⟶"
                         :no-match "[No match]"))

  :hook (vertico-mode . vertico-flat-mode))

(provide '+vertico-flat)
