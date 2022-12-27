;;; init --- Help configuration -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;;;
;;; No comment.
;;;
;;; Code:

(use-package helpful
  :general
  (:states '(normal visual motion)
   :prefix "SPC"
   "h"  '(nil :wk "help")
   "h." '(helpful-at-point :wk "at point")
   "hb" '(embark-bindings :wk "bindings")
   "he" '(describe-face :wk "face")
   "hf" '(helpful-callable :wk "command or function")
   "hF" '(helpful-function :wk "function")
   "hi" '(info :wk "info")
   "hl" '(helpful-command :wk "command")
   "hk" '(helpful-key :wk "key")
   "hm" '(woman :wk "man page")
   "hM"  '(view-echo-area-messages :kw "messages")
   "ho" '(describe-mode :wk "mode")
   "hv" '(helpful-variable :wk "variable"))
  (:keymaps 'emabark-symbol-map
   "h" 'helpful-at-point))

(provide '+helpful)
;;; +helpful.el ends here
