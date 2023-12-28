;; -*- lexical-binding: t; -*-

(defun +rails-test-run-all ()
  (interactive)
  (let ((compile-command "rails test")
        (compilation-read-command nil))
    (call-interactively #'project-compile)))

(defun +rails-test-run-file ()
  (interactive)
  (let ((root (project-root (project-current)))
        (buf buffer-file-name))
    (setq test-file-name
          (cond
           ((and buf (string-suffix-p "_test.rb" buf))
            buf)
           ((and buf (string-match-p "/app/\\(models\\|logic\\)" buf))
            (file-name-concat root "test/unit/" (concat (file-name-base buf) "_test.rb")))))

    (when (not (file-exists-p test-file-name))
      (setq test-file-name (completing-read "Test file: " (+rails--item-collection "test"))))

    (setq-local compilation-read-command nil)
    (setq-local compile-command (concat "rails test " test-file-name))

    (call-interactively #'project-compile)))
