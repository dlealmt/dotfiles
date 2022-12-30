;; -*- lexical-binding: t; -*-

(use-package vertico
  :custom
  (vertico-count 10)
  (vertico-cycle t)
  (vertico-resize nil)

  :custom-face
  (orderless-match-face-0 ((t (:foreground ,(doom-color 'base0)
                               :background ,(doom-color 'orange)
                               :weight ultraheavy))))
  (completions-common-part ((t (:foreground ,(doom-color 'base0)
                                :background ,(doom-color 'orange)
                                :weight bold))))
  (vertico-current ((t (:foreground ,(doom-color 'base0) :background ,(doom-color 'orange)))))


  :hook (emacs-startup . vertico-mode))

(provide '+vertico)
