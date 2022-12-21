;; -*- lexical-binding: t; -*-

(use-package magit
  :general
  (:keymaps '(magit-mode-map magit-diff-mode-map magit-status-mode-map)
   "SPC" nil)
  (:keymaps 'magit-log-select-mode-map
   "gs"  '(magit-log-select-pick :wk "pick commit"))
  :hook (git-commit-mode . +magit-set-fill-column))

(defun +magit-set-fill-column()
  (setq fill-column 72))

(provide '+magit)
