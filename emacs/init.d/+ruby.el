;;; init --- Local configuration
;;;
;;; Commentary:
;;;
;;; No comment.
;;;
;;; Code:

;; -*- lexical-binding: t; -*-

(use-package ruby-mode
  :config
  (require 'autoinsert)

  (add-to-list 'auto-insert-alist
               '(("scratch/[^/]+\\.rb\\'" . "Ruby scratch file")
                 nil
                 "ENV[\"PAGER\"] = \"cat\"" "\n\n"
                 "ActiveRecord::Base.logger = Logger.new(STDOUT)" "\n\n"))

  (add-to-list 'auto-insert-alist
               '(("_controller.rb\\'" . "Rails controller")
                 nil "class " (thread-last
                                buffer-file-name
                                (file-name-nondirectory)
                                (file-name-sans-extension)
                                (capitalize)
                                (string-replace "_" ""))
                 " < ApplicationController" n
                 -
                 n
                 "end"))

  :general
  (:keymaps 'ruby-mode-map
   :states '(normal motion visual)
   "ge" '(nil :wk "eval")
   "geb" '(ruby-send-buffer :wk "buffer")
   "ged" '(ruby-send-definition :wk "definition")
   "gel" '(ruby-send-line :wk "line")
   "ger" '(ruby-send-region :wk "region"))
  (:keymaps 'ruby-mode-map
   :states 'normal
   "gr" '(nil :wk "refactor")
   "grb" '(ruby-toggle-block :wk "toggle block")
   "gt" '(nil :wk "test"))

  :hook (ruby-mode . lsp-deferred))

(provide '+ruby)
;;; +ruby.el ends here
