;; -*- lexical-binding: t; -*-

(use-package minitest
  :custom
  (minitest-use-rails t)
  (minitest-use-bundler nil)

  :config
  (add-to-list 'display-buffer-alist
               '("\\*Minitest"
                 (display-buffer-reuse-window display-buffer-pop-up-frame)
                 (reusable-frames . visible)))

  :general
  (:keymaps 'ruby-mode-map
   :states 'normal
   "gt." '(minitest-verify-single :wk "single")
   "gtp" '(minitest-verify-all :wk "project")
   "gtr" '(minitest-rerun :wk "rerun")
   "gtt" '(minitest-verify :wk "file"))
  (:keymaps 'minitest-compilation-mode-map
   "gr" '(minitest-rerun :wk "rerun")))

(provide '+minitest)
