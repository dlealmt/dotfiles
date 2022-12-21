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
                                (project-root p)))))

(provide '+consult)
