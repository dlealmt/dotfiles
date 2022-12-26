;; -*- lexical-binding: t; -*-

(use-package evil-goggles
  :hook ((evil-goggles-mode . evil-goggles-use-diff-faces)
         (evil-mode . evil-goggles-mode)))

(provide '+evil-goggles)
