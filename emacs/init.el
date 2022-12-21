;; -*- lexical-binding: t; -*-

(put 'list-timers 'disabled nil)

(setq custom-file (concat user-emacs-directory "custom.el"))

(use-package +core
  :ensure nil
  :no-require t

  :preface
  (setenv "UID" (number-to-string (user-uid)))
  (setenv "PAGER" "cat")
  (setenv "NO_AT_BRIDGE" "1")

  :custom
  (auth-sources '("~/.authinfo.gpg"))
  (blink-cursor-mode nil)
  (completion-ignore-case t)
  (cursor-type 'bar)
  (custom-unlispify-remove-prefixes t)
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
  (mode-line-format nil)
  (password-cache t)
  (password-cache-expiry 1500)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (resize-mini-frames nil)
  (ring-bell-function 'ignore)
  (tab-always-indent 'complete)
  (use-dialog-box nil)
  (use-short-answers t)
  (visible-bell nil)
  (warning-minimum-level :error)
  (warning-minimum-log-level :warning)

  :hook
  ((prog-mode . display-fill-column-indicator-mode)
   (prog-mode . electric-pair-mode)
   (prog-mode . show-paren-mode)
   (prog-mode . +prog-set-fill-column)
   (prog-mode . display-line-numbers-mode)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Make sure the packaged version of org loads first
(require '+org)

(dolist (file (directory-files +init-files-directory t "\\`\\+.*\\.el\\'"))
  (+require (intern (file-name-base file))))

(defun +prog-set-fill-column ()
  (setq-local fill-column 100))
