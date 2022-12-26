;; -*- lexical-binding: t; -*-

(use-package lispyville
  :config
  (require 'autoinsert)

  (lispyville-set-key-theme '(operators c-w c-u prettify additional-movement slurp/barf-lispy
                              additional additional-insert escape insert))
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
   "ge"  '("eval" . nil)
   "geb" '("buffer" . eval-buffer)
   ";"   'embark-act)

  :hook ((emacs-lisp-mode . lispyville-mode)
         (lisp-interaction-mode . lispyville-mode)))

(provide '+lispyville)
