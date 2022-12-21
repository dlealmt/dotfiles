;; -*- lexical-binding: t; -*-

(use-package with-editor
  :general
  (:keymaps 'with-editor-mode-map
   :states 'normal
   "gq" '(with-editor-cancel :wk "cancel")
   "gs" '(with-editor-finish :wk "commit")))

(provide '+with-editor)
