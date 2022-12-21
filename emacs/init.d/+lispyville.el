;; -*- lexical-binding: t; -*-

(use-package lispyville
  :after lispy
  :requires autoinsert

  :config
  (add-to-list 'auto-insert-alist
               '(("\\+.*\\.el\\'" . "Emacs config file")
                 nil
                 ";; -*- lexical-binding: t; -*-" n
                 n
                 "(require '+config)" n
                 n
                 - n
                 n
                 "(provide '" (thread-last
                                buffer-file-name
                                (file-name-nondirectory)
                                (file-name-sans-extension))
                 ")"))

  :general
  (:keymaps 'lispyville-mode-map
   :states 'normal
   "<" 'lispyville-barf
   "=" 'lispyville-prettify
   ">" 'lispyville-slurp
   "ge"  '("eval" . nil)
   "geb" '("buffer" . eval-buffer))

  :hook
  ((emacs-lisp-mode . lispyville-mode)
   (lisp-interaction-mode . lispyville-mode)))

(provide '+lispyville)
