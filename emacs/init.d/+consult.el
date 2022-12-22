;; -*- lexical-binding: t; -*-

(use-package consult
  :custom
  (consult-buffer-sources '(consult--source-project-buffer
                            consult-project-source-recent-file
                            consult-project-source-file
                            consult--source-buffer
                            consult--source-recent-file))
  (consult-project-function (lambda (may-prompt)
                              (when-let ((p (project-current may-prompt)))
                                (project-root p))))

  :general
  (:states 'normal
   "/"   '(consult-line :wk "search")
   "glf" '(consult-flycheck :wk "flycheck issues")
   "gp"  '(consult-yank-pop :wk "yank pop")
   "gy"  '(consult-imenu :wk "imenu")
   "gY"  '(consult-imenu-multi :wk "imenu multi"))
  (:states 'normal
   :prefix "SPC"
   "/" '(consult-ripgrep :wk "search")
   "f" '(consult-buffer :wk "go to")))

(provide '+consult)
