;; -*- lexical-binding: t; -*-

(add-to-list 'load-path "~/edie")

(use-package xelb)

(require '+browse-url)
(require '+secrets)

(use-package edie
  :ensure nil
  :demand t

  :ensure-system-package (openbox (picom . picom-git) redshift)

  :preface
  (defun +edie-make-default-minibuffer ()
    (setq default-minibuffer-frame
	  (edie-bar-make-bar '((font . "Ubuntu Mono-16")
			       (left . 0)
			       (height . (text-pixels . 48))
			       (minibuffer . only)
			       (name . "_main-bar_")
			       (top . 0)
			       (width . 1.0)))))

  :custom
  (edie-debug t)
  (edie-redshift-latitude +secrets-edie-redshift-latitude)
  (edie-redshift-longitude +secrets-edie-redshift-longitude)
  (edie-wallpaper-image-path "~/wallpapers")
  (edie-wm-backend 'openbox)
  (edie-wm-default-desktop-list '("y" "u" "i" "o" "p"))
  (edie-wm-desktop-padding '(:left 40 :top 72 :bottom 8 :right 40))
  (edie-wm-rules-alist `(((:class "qutebrowser") . (:tile mid))
                         ((:title "_main-bar_") . (:desktop t :stacking above :width 1.0))))
  (edie-wm-tile-alist '((scratch . (:left 0.56 :top 0 :width 0.44 :height 1.0
                                    :workarea screen :stacking above
                                    :no-borders t :no-round-corners t))
                        (left . (:left 0 :top 0 :width 0.5 :height 1.0))
                        (mid . (:left (/ 1 10) :top 0 :width (/ 8 10) :height 1.0))
                        (right . (:left 0.5 :top 0 :width 0.5 :height 1.0))))
  (edie-wm-tile-commands '((fit focus-cycle) (left mid right) (:prefix +edie-)))
  (edie-wm-window-border-width 2)
  (edie-wm-window-margins 8)

  :general
  (:keymaps 'input-decode-map
            [(control ?i)] [control-i]
            [(control ?I)] [(shift control-i)])
  (:keymaps 'edie-keys-mode-map
            "s-;" 'edie-wm-window-close
            "s-d" '+browse-url-new-window
            "s-f" '+edie-make-frame
            "s-s" '+edie-org)

  :config
  (edie-debug-instrument edie-wm-on-window-add
                         edie-wm-on-window-remove
                         edie-wm-on-window-update
                         edie-wm-on-window-focus)

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

  (pcase-dolist (`(,key . ,tile) '(("j" . left) ("k" . mid) ("l" . right)))
    (pcase-dolist (`(,prefix . ,action) '(("s" . focus-cycle) ("C-s" . fit)))
      (keymap-global-set (format "%s-%s" prefix key)
                         (intern (format "+edie-%s-%s" action tile)))))

  :hook ((before-init . +edie-make-default-minibuffer)
	 (before-init . edie-mode)))

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
