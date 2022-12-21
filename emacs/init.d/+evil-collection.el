;; -*- lexical-binding: t; -*-

(use-package evil-collection
  :after evil

  :custom
  (evil-collection-setup-minibuffer t)
  (evil-collection-want-unimpaired-p nil)

  :hook (evil-mode . evil-collection-init))

(provide '+evil-collection)
