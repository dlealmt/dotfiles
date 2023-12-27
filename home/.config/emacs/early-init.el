;; -*- lexical-binding: t; -*-

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(setq use-package-always-demand t)

(use-package gruvbox-theme
  :ensure t

  :custom
  (custom-safe-themes '("d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" default))

  :custom-face
  (default ((t (:font "Iosevka Timbuktu Light" :height 105 :background "#1b1b1b"))))
  (fringe ((t (:background "#1b1b1b"))))
  (header-line ((t (:box (:line-width 8 :color "#282828")))))
  (internal-border ((t (:background "#1b1b1b"))))
  (mode-line ((t (:background "#282828" :box (:line-width 8 :color "#282828")))))
  (mode-line-active ((t (:background "#282828"))))
  (mode-line-inactive ((t (:background "#282828" :box (:line-width 8 :color "#282828")))))

  :config
  (load-theme 'gruvbox-dark-hard))

(use-package emacs
  :no-require t

  :custom
  (menu-bar-mode nil)
  (scroll-bar-mode nil)
  (tool-bar-mode nil)

  :config
  (add-to-list 'initial-frame-alist '(background-color . "#1b1b1b"))

  (add-to-list 'default-frame-alist '(background-color . "#1b1b1b"))
  (add-to-list 'default-frame-alist '(internal-border-width . 16))
  (add-to-list 'default-frame-alist '(left-fringe . 28))
  (add-to-list 'default-frame-alist '(line-spacing . 0.1))
  (add-to-list 'default-frame-alist '(right-fringe . 16))
  (add-to-list 'default-frame-alist '(undecorated . t)))
