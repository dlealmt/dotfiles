;; -*- lexical-binding: t; -*-

(add-to-list 'load-path "~/edie")

(use-package xelb)

(require '+browse-url)
(require '+secrets)

(require 'edie)

(use-package edie-keys
  :ensure nil

  :general
  (:keymaps 'input-decode-map
   [(control ?i)] [control-i]
   [(control ?I)] [(shift control-i)])
  (:keymaps 'edie-keys-mode-map
   "s-;" 'edie-wm-window-close
   "s-d" '+browse-url-new-window
   "s-f" '+edie-make-frame
   "s-s" '+edie-org)

  :hook (after-init . edie-keys-mode))

(use-package edie-wm
  :ensure nil

  :ensure-system-package openbox

  :custom
  (edie-wm-backend 'openbox)
  (edie-wm-default-desktop-list '("y" "u" "i" "o" "p"))
  (edie-wm-desktop-padding '(:left 40 :top 72 :bottom 8 :right 40))
  (edie-wm-rules-alist `(((:class "qutebrowser") . (:tile mid))
                         ((:title "_main-bar_") . (:tile main-bar))))
  (edie-wm-tile-alist '((scratch . (:left 0.56 :top 0 :width 0.44 :height 1.0
                                    :workarea screen :stacking above
                                    :no-borders t :no-round-corners t))
                        (left . (:left 0 :top 0 :width 0.5 :height 1.0))
                        (mid . (:left (/ 1 10) :top 0 :width (/ 8 10) :height 1.0))
                        (right . (:left 0.5 :top 0 :width 0.5 :height 1.0))
                        (main-bar . (:left 0.25 :top 16 :width 0.5 :height 48
                                           :workarea screen :desktop t :stacking above))))
  (edie-wm-tile-commands '((fit focus-cycle) (left mid right) (:prefix +edie-)))
  (edie-wm-window-border-width 2)
  (edie-wm-window-margins 8)

  :config
  (pcase-dolist ((and desktop (seq 'desktop (map :name))) (edie-wm-desktop-list))
    (let ((switch (intern (concat "+edie-switch-to-desktop-" name)))
          (push-to (intern (concat "+edie-push-to-desktop-" name))))
      (defalias switch
        (lambda ()
          (interactive)
          (edie-wm-switch-to-desktop desktop)))

      (defalias push-to
        (lambda ()
          (interactive)
          (edie-wm-window-to-desktop desktop)))

      (keymap-set edie-keys-mode-map (concat "s-" name) switch)
      (keymap-set edie-keys-mode-map
                  (if (equal name "i") "s-<control-i>" (concat "C-s-" name))
                  push-to)))

  :hook (emacs-startup . edie-wm-mode))

(use-package edie-run
  :ensure nil

  :hook (edie-wm-mode . edie-run-mode))

(use-package edie-bar
  :ensure nil

  :custom
  (edie-bar-frame-spec '(edie-bar-clock))

  :config
  (defvar +minibuffer-frame-min-pixel-height 44)

  (defun +minibuffer-enable-resize ()
    (setq resize-mini-frames #'+minibuffer-resize-mini-frame))

  (defun +minibuffer-disable-resize ()
    (setq resize-mini-frames nil))

  (defun +minibuffer-setup ()
    (setq default-minibuffer-frame
          (edie-bar-make-frame "_main-bar_" '((internal-border-width . 0)
                                              (minibuffer . only)
                                              (window-system . x))))
    (add-hook 'minibuffer-setup-hook #'+minibuffer-enable-resize))

  (defun +minibuffer-resize-mini-frame (frame)
    (when (not +minibuffer-frame-min-pixel-height)
      (setq +minibuffer-frame-min-pixel-height
            (- (frame-pixel-height frame) (* 2 (frame-parameter frame 'internal-border-width)))))

    (pcase-let* ((window (minibuffer-window frame))
                 (buffer (window-buffer window))
                 (`(,_ . ,height) (buffer-text-pixel-size buffer window))
                 (next-height (max height +minibuffer-frame-min-pixel-height)))
      (set-frame-height frame next-height nil t)))

  :hook ((before-init . +minibuffer-setup)
         (edie-wm-mode . edie-bar-mode)))

(use-package edie-redshift
  :ensure nil

  :ensure-system-package redshift

  :custom
  (edie-redshift-latitude +secrets-edie-redshift-latitude)
  (edie-redshift-longitude +secrets-edie-redshift-longitude)

  :hook (emacs-startup . edie-redshift-mode))

(use-package edie
  :ensure nil

  :ensure-system-package (picom . picom-git)

  :general
  ("s-;" 'edie-wm-window-close
   "s-d" '+browse-url-new-window
   "s-f" '+edie-make-frame
   "s-s" '+edie-org))

(use-package edie-wallpaper
  :ensure nil

  :ensure-system-package nitrogen

  :hook (before-init . edie-wallpaper-mode))

(pcase-dolist (`(,key . ,tile) '(("j" . left) ("k" . mid) ("l" . right)))
  (pcase-dolist (`(,prefix . ,action) '(("s" . focus-cycle) ("C-s" . fit)))
    (keymap-global-set (format "%s-%s" prefix key)
                       (intern (format "+edie-%s-%s" action tile)))))

(defun +edie-make-frame ()
  (interactive)
  (let ((f (make-frame)))
    (select-frame-set-input-focus f)
    (scratch-buffer)))

(defun +edie-org (file)
  (interactive (list (read-file-name "File: " "~/org/" nil t)))
  (display-buffer (find-file-noselect file)
                  '(display-buffer-pop-up-frame
                    . ((pop-up-frame-parameters
                        . ((undecorated . t)
                           (alpha-background . 75)
                           (background-color . "#544")
                           (left . (- 0))
                           (top . 0)
                           (width . 0.44)
                           (height . 1.0)))))))

(provide '+edie)
