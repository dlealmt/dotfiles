;; -*- lexical-binding: t; -*-

(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name  "var/eln-cache/" user-emacs-directory))))

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(setq custom-file "/home/david/.config/emacs/custom.el")

(setq use-package-always-demand t)

(use-package menu-bar
  :custom
  (menu-bar-mode nil))

(use-package scroll-bar
  :custom
  (scroll-bar-mode nil))

(use-package tool-bar
  :custom
  (tool-bar-mode nil))

(use-package gruvbox-theme
  :ensure t

  :custom
  (custom-safe-themes '("d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" default))

  :config
  (load-theme 'gruvbox-dark-hard))

(use-package emacs
  :custom
  (default-frame-alist '((alpha-background . 1.0)
                         (internal-border-width . 16)
                         (left-fringe . 28)
                         (line-spacing . 0.1)
                         (right-fringe . 16)
                         (undecorated . t)))

  :custom-face
  (default ((t (:font "Iosevka Timbuktu Light" :height 105 :background "#1b1b1b"))))
  (fringe ((t (:background "#1b1b1b"))))
  (header-line ((t (:box (:line-width 8 :color "#282828")))))
  (internal-border ((t (:background "#1b1b1b"))))
  (mode-line ((t (:background "#282828" :box (:line-width 8 :color "#282828")))))
  (mode-line-active ((t (:background "#282828"))))
  (mode-line-inactive ((t (:background "#282828" :box (:line-width 8 :color "#282828"))))))
