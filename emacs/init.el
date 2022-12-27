;; -*- lexical-binding: t; -*-

(put 'list-timers 'disabled nil)

(setq custom-file (concat user-emacs-directory "custom.el"))

(use-package +core
  :ensure nil
  :no-require t

  :preface
  (setenv "GPG_AGENT_INFO" nil)
  (setenv "EDITOR" "emacsclient -c")
  (setenv "NO_AT_BRIDGE" "1")
  (setenv "PAGER" "cat")
  (setenv "UID" (number-to-string (user-uid)))

  (defun +prog-set-fill-column ()
    (setq-local fill-column 100))

  (require 'xdg)

  :custom
  (auth-sources '("~/.authinfo.gpg"))
  (auto-insert-alist nil)
  (blink-cursor-mode nil)
  (completion-ignore-case t)
  (cursor-type 'bar)
  (custom-unlispify-remove-prefixes t)
  (delete-by-moving-to-trash t)
  (display-buffer-base-action '((display-buffer-reuse-window
                                 display-buffer-same-window
                                 display-buffer-pop-up-frame)
                                (inhibit-switch-frame . nil)
                                (reusable-frames . visible)))
  (echo-keystrokes 1)
  (epg-pinentry-mode 'loopback)
  (eval-expression-print-length nil)
  (frame-resize-pixelwise t)
  (indent-tabs-mode nil)
  (inhibit-startup-echo-area-message "david")
  (inhibit-startup-screen t)
  (initial-scratch-message nil)
  (minibuffer-message-clear-timeout 3)
  (minibuffer-prompt-properties '(read-only t cursor-intangible t face minibuffer-prompt))
  (make-backup-files nil)
  (mode-line-format nil)
  (password-cache t)
  (password-cache-expiry 1500)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (recentf-save-file "~/config/emacs/cache/recentf")
  (recentf-max-saved-items nil)
  (require-final-newline t)
  (resize-mini-frames nil)
  (ring-bell-function 'ignore)
  (tab-always-indent 'complete)
  (trash-directory (concat (xdg-data-home) "/Trash"))
  (use-dialog-box nil)
  (use-short-answers t)
  (visible-bell nil)
  (warning-minimum-level :error)
  (warning-minimum-log-level :warning)

  :custom-face
  (default ((t (:background "#282420"))))
  (fixed-pitch-serif ((t (:family "Cascadia Mono" :height 140))))
  (variable-pitch ((t (:family "Noto Sans" :height 140))))

  :general
  (:states '(normal visual motion)
   "SPC" '(nil :wk "global commands")
   "Q"   nil
   "g"   '(nil :wk "local commands")
   "q"   nil)
  (:states 'normal
   "q"  'previous-buffer
   "Q"  'kill-current-buffer
   "gb" '(nil :wk "buffer")
   "gbv" '(revert-buffer :wk "revert")
   "gbx" '(kill-this-buffer :wk "delete")
   "gf" '(nil :wk "file")
   "gfd" '(dired :wk "dired")
   "gff" '(find-file :wk "open")
   "gfi" '(insert-file :wk "insert contents")
   "gfr" '(rename-visited-file :wk "rename")
   "gfo" '(read-only-mode :wk "toggle read only")
   "gfv" '(revert-buffer :wk "revert")
   "gfw" '(write-file :wk "save as")
   "gfx" '(+files-delete-this-file :wk "delete")
   "gl"  '(nil :wk "lint")
   "gs"  '(save-buffer :wk "save"))
  (:states 'normal
   :prefix "SPC"
   "SPC" '(execute-extended-command :wk "open")
   "L"   '(+eshell :wk "eshell in $HOME")
   "!"   '(project-async-shell-command :wk "run")
   "*"   '(itchy-switch-to-scratch-buffer :wk "scratch buffer")
   "d"   '(project-dired :wk "dired")
   "l"   '(project-eshell :wk "shell")
   "v"   '(magit-project-status :wk "vc"))

  :hook
  ((before-save . delete-trailing-whitespace)
   (prog-mode . display-fill-column-indicator-mode)
   (prog-mode . electric-pair-mode)
   (prog-mode . show-paren-mode)
   (prog-mode . +prog-set-fill-column)
   (prog-mode . display-line-numbers-mode)
   (emacs-startup . auto-save-visited-mode)
   (emacs-startup . auto-insert-mode)
   (emacs-startup . global-auto-revert-mode)
   (emacs-startup . recentf-mode)
   (emacs-startup . savehist-mode)
   (emacs-startup . server-start)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Make sure the packaged version of org loads first
(require '+org)

(dolist (file (directory-files +init-files-directory t "\\`\\+.*\\.el\\'"))
  (require (intern (file-name-base file))))

(defun +eshell ()
  (interactive)
  (let ((default-directory "~"))
    (eshell)))

(defun +files-delete-this-file ()
  "Delete the file connected to the current buffer, if it exists."
  (interactive)
  (if-let ((victim (buffer-file-name)))
      (progn
        (kill-buffer)
        (delete-file victim)
        (message "%s moved to trash" victim))
    (message "Buffer is not visiting a file")))
