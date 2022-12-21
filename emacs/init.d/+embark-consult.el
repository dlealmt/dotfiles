;; -*- lexical-binding: t; -*-

(use-package embark-consult
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(provide '+embark-consult)
