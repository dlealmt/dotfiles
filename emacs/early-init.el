 ;;; -*- lexical-binding: t -*-

(defconst +init-files-directory (expand-file-name "init.d" user-emacs-directory))

(add-to-list 'load-path +init-files-directory)

(setopt native-comp-eln-load-path '("~/.cache/eln/")
        gc-cons-percentage 1.0
        gc-cons-threshold (* 4 1024 1024 1024))

'(let ((fnha file-name-handler-alist))
  (setq file-name-handler-alist nil)

  (add-hook 'after-init-hook #'(lambda ()
				 (setq file-name-handler-alist fnha))))

(add-hook 'emacs-startup-hook
          #'(lambda ()
              (setopt gc-cons-percentage 0.1
                      gc-cons-threshold (* 1024 1024))
              (garbage-collect))
          t)

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize nil)

(setopt message-log-max (* 4 1024))

(defvar +default-frame-alist
  '((font . "JetBrains Mono-14")
    (horizontal-scroll-bars . nil)
    (vertical-scroll-bars . nil)
    (internal-border-width . 0)
    (left-fringe . 16)
    (right-fringe . 16)
    (line-spacing . 0.2)
    (menu-bar-lines . 0)
    (minibuffer . nil)
    (tool-bar-lines . 0)
    (auto-raise . t)
    (unsplittable . t)))

(dolist (opt +default-frame-alist)
  (add-to-list 'default-frame-alist opt t))

(require 'use-package)

(setopt use-package-always-ensure t
        use-package-verbose t)

(use-package general)
(use-package no-littering)

(use-package doom-themes
  :demand t
  :config
  (load-theme 'doom-gruvbox t))

(require '+system-packages)
(require '+edie)
