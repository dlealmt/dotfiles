;; -*- lexical-binding: t; -*-

(setq custom-file "/tmp/custom.el")

(use-package envrc
  :ensure t

  :hook
  (emacs-startup . envrc-global-mode))

(use-package general
  :ensure t

  :init
  (general-create-definer inno-def
    :states '(insert normal))
  (general-create-definer no-def
    :states 'normal)
  (general-create-definer novi-def
    :states '(normal visual))
  (general-create-definer leader-def
    :states 'normal
    :prefix "SPC"
    :non-normal-prefix "C-SPC"
    :prefix-command '+leader-prefix-command
    :prefix-map '+leader-prefix-command-map)

  :config
  (leader-def
    "E" '(nil :wk "emacs")
    "b" '(nil :wk "buffer")
    "e" '(nil :wk "eval")
    "f" '(nil :wk "file")
    "h" '(nil :wk "help")
    "j" '(nil :wk "jump")
    "n" '(nil :wk "new")
    "v" '(nil :wk "vc")
    "x" '(nil :wk "run")))

(use-package emacs
  :no-require t

  :custom
  (auth-sources '("~/.config/secrets/authinfo.gpg"))
  (auto-save-visited-mode t)
  (blink-cursor-mode nil)
  (column-number-mode t)
  (completion-cycle-threshold 3)
  (create-lockfiles nil)
  (display-buffer-base-action '((display-buffer-reuse-window
                                 display-buffer-same-window)
                                (reusable-frames . t)))
  (enable-recursive-minibuffers t)
  (frame-resize-pixelwise t)
  (header-line-format
   `((:eval (nerd-icons-icon-for-buffer))
     " "
     (:propertize "%b" face mode-line-buffer-id)
     (buffer-file-name (:propertize "  " face (:foreground "#3c3836")))
     (buffer-file-name (:propertize ("  " (:eval (thread-first (buffer-file-name)
                                                                (file-name-directory)
                                                                (directory-file-name)
                                                                (file-name-nondirectory))))
                                    face
                                    (:foreground "#b8bb26")))
     (vc-mode (:propertize "  " face (:foreground "#3c3836")))
     (vc-mode (:propertize (" " (:eval (magit-get-current-branch))) face (:foreground "#8ec07c")))
     (:eval (when-let ((project (project-current))
                       (buffer-file-name))
              (concat
               (propertize "  " 'face '(:foreground "#3c3836"))
               (propertize (concat " " (project-name project)) 'face '(:foreground "#83a598")))))))
  (indent-tabs-mode nil)
  (inhibit-startup-screen t)
  (initial-buffer-choice t)
  (initial-scratch-message nil)
  (major-mode-remap-alist '((html-mode . html-ts.mode)
                            (json-mode . json-ts-mode)
                            (ruby-mode . ruby-ts-mode)
                            (yaml-mode . yaml-ts-mode)))
  (make-backup-files nil)
  (minibuffer-prompt-properties '(read-only t cursor-intangible t face minibuffer-prompt))
  (mode-line-format '(""
                      mode-line-format-right-align
                      ""
                      (flymake-mode flymake-mode-line-counters)
                      "    "
                      (:propertize "" face (:foreground "#fabd2f"))
                      " "
                      (:propertize "%c,%l" face (:foreground "#fabd2f"))))
  (mode-line-right-align-edge 'right-margin)
  (native-comp-async-report-warnings-errors 'silent)
  (native-compile-prune-cache t)
  (package-native-compile t)
  (ring-bell-function 'ignore)
  (save-place-mode t)
  (use-dialog-box nil)
  (use-file-dialog nil)
  (use-short-answers t)
  (window-divider-default-right-width 0)
  (window-divider-default-left-width 0)

  :general
  (novi-def
    "+" '(universal-argument :wk "universal argument")
    "Q" '(kill-this-buffer :wk "kill this buffer"))
  (no-def
    "C-s" '(save-buffer :wk "save")
    "s-n" '(make-frame-command :wk "new frae")
    "M-j" '(next-buffer :wk "next buffer")
    "M-k" '(previous-buffer :wk "previous buffer")
    "gn" '(next-error :wk "next error")
    "gp" '(previous-error :wk "previous error")
    "q"   '(evil-prev-buffer :wk "quit"))
  (no-def
    :keymaps 'help-mode-map
    "SPC" nil)
  (leader-def
    :states '(normal visual)
    "SPC" '(execute-extended-command :wk "M-x"))
  (leader-def
    "#"  '(scratch-buffer :wk "scratch")
    "1"  '(delete-other-windows :wk "delete other windows")
    "0"  '(delete-window :wk "delete window")
    "Eq" '(save-buffers-kill-emacs :wk "quit")
    "bj" '(next-buffer :wk "next buffer")
    "bk" '(previous-buffer :wk "previous buffer")
    "bx" '(kill-this-buffer :wk "kill current buffer")
    "ff" '(find-file :wk "open")
    "fi" '(insert-file :wk "insert file")
    "fr" '(revert-buffer-quick :wk "revert")
    "fs" '(write-file :wk "save as")
    "ge" '(flymake-goto-next-error :wk "next error")
    "hc" '(describe-face :wk "face")
    "he" '(view-echo-area-messages :wk "mode")
    "hi" '(info :wk "info")
    "hm" '(describe-mode :wk "mode")
    "nn" '(make-frame-command :wk "new frame")
    "xx" '(async-shell-command :wk "shell command"))
  (no-def 'Info-mode-map
    "q" '(delete-frame :wk "quit"))

  :config
  (add-to-list 'display-buffer-alist
               '("\\*info"
                 . ((display-buffer-reuse-window
                     display-buffer-pop-up-frame)
                    (dedicated . t)
                    (reusable-frames . t))))

  :hook
  (before-save . delete-trailing-whitespace)
  (minibuffer-setup . cursor-intangible-mode))

(use-package evil
  :ensure t

  :preface
  (setq evil-want-keybinding nil)

  :custom
  (evil-echo-state nil)
  (evil-search-module 'evil-search)
  (evil-symbol-word-search t)
  (evil-shift-width 2)
  (evil-undo-system 'undo-fu)
  (evil-want-C-u-scroll t)

  :general
  (:states '(normal visual)
   "gj"  '(evil-goto-line :wk "go to bottom")
   "gk"  '(evil-goto-first-line :wk "go to top"))

  :hook
  (after-init . evil-mode))

(use-package evil-collection
  :ensure t

  :custom
  (evil-collection-setup-minibuffer t)
  (evil-collection-want-unimpaired nil)

  :hook
  (evil-mode . evil-collection-init))

(use-package recentf
  :custom
  (recentf-filename-handlers nil)

  :config
  (recentf-mode 1))

(use-package embark
  :ensure t

  :custom
  (embark-verbose-indicator-display-action
   '(display-buffer-in-side-window (side . bottom)))

  :general
  (:states '(normal visual)
   ";" '(embark-act :wk "embark"))
  (:states 'insert
   "C-;" '(embark-act :wk "embark")))

(use-package vertico
  :ensure t

  :custom
  (vertico-cycle t)

  :hook emacs-startup)

(use-package corfu
  :ensure t

  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-cycle t)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match nil)
  (corfu-separator ?\s)

  :config
  (add-to-list 'corfu--frame-parameters '(alpha-background . 1.0))

  :hook
  (emacs-startup . global-corfu-mode))

(use-package consult
  :ensure t

  :preface
  (defvar +consult-project-buffer-source-project-files)

  :custom
  (consult-project-buffer-sources '(consult--source-project-buffer
                                    consult--source-project-recent-file
                                    +consult-source-project-files))
  (xref-show-xrefs-function #'consult-xref)
  (xref-show-definitions-function #'consult-xref)

  :general
  (:states 'normal
    "C-/" '(consult-line :wk "consult line")
    "gE"  '(consult-flymake :wk "document symbols"))
  (leader-def
    "/"  '(consult-ripgrep :wk "search in project")
    "bb" '(consult-buffer :wk "open")
    "jj" '(consult-project-buffer :wk "open in project")
    "js" '(consult-imenu :wk "document symbols")
    "hM" '(consult-man :wk "man"))

  :config
  (setq +consult-source-project-files
        `(:name "Project"
          :category project-file
          :face file
          :history file-name-history
          :state ,#'consult--file-state
          :items
          (lambda ()
            (let ((root (expand-file-name (consult--project-root))))
              (mapc (lambda (fname)
                      (put-text-property 0 (length fname) 'display (string-remove-prefix root fname) fname))
                    (process-lines "fd" "--type" "f" "--follow" "--hidden" "--full-path"
                                   "--exclude" ".git" "--exclude" "node_modules"
                                   "." root))))
          :action (lambda (file)
                    (let ((root (consult--project-root)))
                      (pop-to-buffer (find-file-noselect file)))))))

(use-package embark-consult
  :ensure t)

(use-package orderless
  :ensure t

  :custom
  (completion-styles '(orderless basic partial-completion emacs22)))

(use-package marginalia
  :ensure t

  :custom
  (marginalia-align 'left)

  :hook emacs-startup)

(use-package magit
  :ensure t

  :custom
  (magit-diff-refine-hunk 'all)

  :custom-face
  (magit-diff-added ((t (:inherit diff-added :foreground nil))))
  (magit-diff-added-highlight ((t (:inherit diff-added :foreground nil))))
  (magit-diff-removed ((t (:inherit diff-removed :foreground nil))))
  (magit-diff-removed-highlight ((t (:inherit diff-removed :foreground nil))))

  :general
  (leader-def
    "vv" '(magit-project-status :wk "magit"))
  (no-def 'magit-mode-map
    "SPC" '(+leader-prefix-command :wk "leader prefix")
    "q" '(kill-this-buffer :wk "quit"))
  (no-def 'magit-log-select-mode-map
    "C-s" '(magit-log-select-pick :wk "pick commit")
    "q"   '(magit-log-select-quit :wk "cancel"))

  :config
  (add-to-list 'display-buffer-alist
               '("\\(magit\\|magit-.*\\):"
                 . ((display-buffer-reuse-window
                     display-buffer-reuse-mode-window
                     display-buffer-pop-up-frame)
                    (dedicated . t)
                    (reusable-frames . t)))))

(use-package helpful
  :ensure t

  :general
  (:keymaps '(embark-command-map embark-file-map embark-function-map embark-general-map
              embark-library-map embark-variable-map)
    "h" '(helpful-symbol :wk "symbol"))
  (:keymaps 'embark-expression-map
    "=" '(indent-region :wk "indent region"))
  (no-def 'helpful-mode-map
    "q" '(kill-this-buffer :wk "quit"))
  (leader-def
    "hf" '(helpful-callable :wk "callable")
    "hk" '(helpful-key :key "key")
    "hv" '(helpful-variable :wk "variable"))

  :config
  (add-to-list 'display-buffer-alist
               '("\\*helpful"
                 . ((display-buffer-reuse-window
                     display-buffer-reuse-mode-window
                     display-buffer-pop-up-frame)
                    (dedicated . t)
                    (mode . helpful-mode)
                    (reusable-frames . t)))))

(use-package which-key
  :ensure t

  :custom
  (which-key-idle-delay 1.0)

  :hook emacs-startup)

(use-package cape
  :ensure t)

(use-package copilot
  :ensure t
  :vc (:url "https://github.com/zerolfx/copilot.el")

  :custom
  (copliot-indent-warning-suppress t)

  :general
  (:states 'insert
   "M-l" '(copilot-accept-completion :wk "accept completion"))

  :hook prog-mode)

(use-package savehist
  :custom
  (savehist-mode t))


(use-package lsp-mode
  :ensure t

  :custom
  (lsp-warn-no-matched-clients nil)
  (lsp-headerline-breadcrumb-enable nil)

  :hook
  (prog-mode . lsp-deferred))

(use-package rainbow-mode
  :ensure t

  :hook
  (prog-mode . rainbow-mode))

(use-package rainbow-delimiters
  :ensure t

  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package compile
  :config
  (add-to-list 'display-buffer-alist '(("\\(\\*compilation\\*\\)"
                                        . ((display-buffer-reuse-window
                                            display-buffer-pop-up-frame)
                                           (dedicated . t)
                                           (unsplittable . t)
                                           (reusable-frames . t)))))

  :hook
  (compilation-filter . ansi-color-compilation-filter))

(use-package undo-fu
  :ensure t)

(use-package undo-fu-session
  :ensure t

  :hook
  (emacs-startup . undo-fu-session-global-mode))

(use-package flymake
  :ensure t

  :custom
  (flymake-note-bitmap '(filled-square compilation-info))
  (flymake-warning-bitmap '(filled-square compilation-warning))
  (flymake-error-bitmap '(filled-square compilation-error))
  (flymake-mode-line-counter-format
   '((:propertize " " face (:inherit compilation-error :underline nil))
     flymake-mode-line-error-counter
     "  "
     (:propertize "" face (:inherit compilation-warning :underline nil))
     flymake-mode-line-warning-counter
     "  "
     (:propertize "" face (:inherit compilation-info :underline nil))
     flymake-mode-line-note-counter))

  :custom-face
  (flymake-error ((t (:underline nil))))
  (flymake-note ((t (:underline nil))))
  (flymake-warning ((t (:underline nil))))

  :hook
  ((prog-mode yaml-ts-mode) . flymake-mode))

(use-package evil-goggles
  :ensure t

  :custom
  (evil-goggles-duration 0.25)

  :hook
  (evil-mode . evil-goggles-mode)
  (evil-goggles-mode . evil-goggles-use-diff-faces))

(use-package evil-exchange
  :ensure t

  :general
  (:states 'normal
   "gx" '(evil-exchange :wk "exchange")))

(use-package forge
  :ensure t

  :general
  (no-def
    :keymaps 'forge-post-mode-map
    "C-s" '(forge-post-submit :wk "submit")
    "q"   '(forge-post-cancel :wk "cancel")))

(use-package eldoc
  :hook
  (emacs-startup . global-eldoc-mode))

(use-package eldoc-box
  :ensure t

  :custom
  (eldoc-box-clear-with-C-g t)
  (eldoc-box-max-pixel-width (* (frame-pixel-width) 1.0))
  (eldoc-box-border-color "#282828")
  (eldoc-box-offset '(0 32 64))

  :config
  (add-to-list 'eldoc-box-frame-parameters '(alpha-background . 1.0))
  (add-to-list 'eldoc-box-frame-parameters '(internal-border-width . 8))
  (add-to-list 'eldoc-box-frame-parameters '(line-spacing . 0.2))
  (add-to-list 'eldoc-box-frame-parameters '(right-fringe . 0))
  (add-to-list 'eldoc-box-frame-parameters '(left-fringe . 0))

  :custom-face
  (eldoc-box-body ((t (:background "#282828"))))
  (eldoc-box-border ((t (:background "#282828"))))

  :hook
  (prog-mode . eldoc-box-hover-mode))

(use-package nerd-icons
  :ensure t

  :custom
  (nerd-icons-font-family "Symbols Nerd Font"))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu

  :config
  (add-to-list 'corfu-margin-formatters 'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :ensure t

  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-completion
  :ensure t
  :after marginalia

  :hook
  (emacs-startup . nerd-icons-completion-mode)
  (marginalia-mode . nerd-icons-completion-marginalia-setup))

(use-package unicode-fonts
  :ensure t

  :custom
  (unicode-fonts-skip-font-groups nil)

  :hook
  (emacs-startup . unicode-fonts-setup))

(use-package display-line-numbers
  :custom-face
  (line-number ((t (:background nil))))
  (line-number-current-line ((t (:foreground "#fabd2f"))))

  :hook
  ((prog-mode yaml-ts-mode) . display-line-numbers-mode))

(use-package avy
  :ensure t

  :custom
  (avy-background t)
  (avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?\;))
  (avy-single-candidate-jump t)
  (avy-timeout-seconds 0.3)

  :custom-face
  (avy-lead-face ((t (:inherit default :bold t :background nil :foreground "#fabd2f"))))
  (avy-lead-face-0 ((t (:inherit default :background nil :foreground "#d79921"))))

  :general
  (:states 'normal
    "s" '(evil-avy-goto-char-timer :wk "avy")
    "S" '(+evil-avy-goto-char-timer-remote :wk "avy remote")
    "gl" '(evil-avy-goto-line :wk "avy line"))

  :preface
  (defun +evil-avy-goto-char-timer-remote ()
    (interactive)
    (let ((avy-single-candidate-jump nil))
      (call-interactively #'evil-avy-goto-char-timer))))

(use-package evil-snipe
  :ensure t

  :custom
  (evil-snipe-scope 'line)
  (evil-snipe-repeat-scope 'line)
  (evil-snipe-spillover-scope 'visible)
  (evil-snipe-smart-case t)
  (evil-snipe-repeat-keys t)
  (evil-snipe-override-evil-repeat-keys t)
  (evil-snipe-char-fold t)

  :custom-face
  (evil-snipe-first-match-face
   ((t (:inherit default :bold t :background nil :foreground "#fabd2f"))))
  (evil-snipe-matches-face ((t (:inherit default :background nil :foreground "#d79921"))))

  :hook (evil-mode . evil-snipe-override-mode))

(use-package evil-surround
  :ensure t

  :hook
  (evil-mode . global-evil-surround-mode))

(use-package diff-mode
  :custom-face
  (diff-added ((t (:background "#2a330a" :foreground "#f9e5d7"))))
  (diff-changed ((t (:background "#fabd2f" :foreground "#1d2021"))))
  (diff-removed ((t (:background "#6e0004" :foreground "#f9e5d7"))))
  (diff-refine-added ((t (:background  "#98971a" :foreground "#1d2021"))))
  (diff-refine-removed ((t (:background "#cc241d" :foreground "#f9e5d7")))))

(use-package pulsar
  :load-path "/usr/local/pkgs/emacs-pkgs/pulsar"

  :config
  (add-to-list 'pulsar-pulse-functions #'evil-jump-backward)
  (add-to-list 'pulsar-pulse-functions #'evil-jump-forward)
  (add-to-list 'pulsar-pulse-functions #'evil-goto-first-line)
  (add-to-list 'pulsar-pulse-functions #'evil-goto-line)
  (add-to-list 'pulsar-pulse-functions #'evil-ex-search-next)
  (add-to-list 'pulsar-pulse-functions #'evil-ex-search-previous)
  (add-to-list 'pulsar-pulse-functions #'evil-avy-goto-char-timer)
  (add-to-list 'pulsar-pulse-functions #'evil-avy-goto-line)

  :custom-face
  (pulsar-generic ((t (:background "#d3869b"))))

  :hook
  (emacs-startup . pulsar-global-mode))

(use-package inf-ruby
  :ensure t
  :commands inf-ruby-console-run

  :preface
  (defun +inf-ruby-console-prod ()
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (inf-ruby-console-run
       "heroku run rails console --remote production"
       (format "%s: prod" (project-name (project-current t))))))

  (defun +inf-ruby-console-staging ()
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (inf-ruby-console-run
       "heroku run rails console --remote staging"
       (format "%s: staging" (project-name (project-current t))))))

  (defun +inf-ruby-console-dev ()
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (inf-ruby-console-run
       "rails console"
       (format "%s: dev" (project-name (project-current t))))))

  :general
  (leader-def
    :keymaps 'ruby-ts-mode-map
    "xc" '(nil :wk "console")
    "xcd" '(+inf-ruby-console-dev :wk "dev")
    "xcs" '(+inf-ruby-console-staging :wk "staging")
    "xcp" '(+inf-ruby-console-prod :wk "prod"))
  (leader-def
    :keymaps 'ruby-ts-mode-map
    :states 'visual
    "er" '(ruby-send-region :wk "region"))

  :hook
  (ruby-ts-mode . inf-ruby-minor-mode))

(use-package elisp-mode
  :general
  (leader-def
    :keymaps 'emacs-lisp-mode-map
    "e"  '(nil :wk "eval")
    "eb" '(eval-buffer :wk "buffer")
    "ed" '(eval-defun :wk "definition"))

  :hook (emacs-lisp-mode . hs-minor-mode))

(use-package evil-matchit
  :ensure t

  :hook
  (evil-mode . global-evil-matchit-mode))

(use-package html-ts-mode
  :mode
  ("\\.html.erb\\'" . html-ts-mode))

(use-package indent-bars
  :vc (:url "https://github.com/jdtsmith/indent-bars")
  :ensure t

  :custom
  (indent-bars-display-on-blank-lines t)

  :hook
  ((prog-mode yaml-ts-mode) . indent-bars-mode))

(use-package subword
  :hook
  (prog-mode . subword-mode))

(use-package with-editor
  :ensure t

  :general
  (inno-def 'with-editor-mode-map
    "C-s" '(with-editor-finish :wk "finish"))
  (no-def 'with-editor-mode-map
    "q" '(with-editor-cancel :wk "cancel")))

(use-package ruby-ts-mode
  :preface
  (defun +ruby-set-compile-command ()
    (when (and buffer-file-name (string-suffix-p "_test.rb" buffer-file-name))
      (setq-local compilation-read-command nil)
      (setq-local compile-command
                  (concat "rails test " (expand-file-name buffer-file-name (project-root (project-current)))))))

  :general
  (leader-def
    :keymaps 'ruby-ts-mode-map
    :states 'normal
    "eb" '(ruby-send-buffer :wk "buffer")
    "ed" '(ruby-send-definition :wk "definition")
    "el" '(ruby-send-line :wk "line")
    "xt" '(project-compile :wk "test"))
  (leader-def
    :keymaps 'ruby-ts-mode-map
    :states 'visual
    "er" '(ruby-send-region :wk "region"))

  :hook
  (ruby-ts-mode . +ruby-set-compile-command))

(use-package wgrep
  :ensure t)

(use-package project
  :config
  (defun +servers ()
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (async-shell-command "direnv exec . foreman start -f Procfile.dev"
                           (format "*%s: servers*" (project-name (project-current))))))

  :general
  (leader-def
    "xh" '(project-eshell :wk "shell")
    "xs" '(+servers :wk "servers")))

(use-package shrface
  :ensure t
  :disabled t

  :custom
  (shrface-href-versatile t)

  :config
  (shrface-basic)
  (shrface-trial)
  (shrface-default-keybindings)

  :hook
  (eww-after-render . shrface-mode))

(use-package yaml-ts-mode)

(use-package gptel
  :ensure t)

(use-package dired
  :general
  (no-def 'dired-mode-map
    "SPC" '(+leader-prefix-command :wk "leader prefix")))

(use-package vc-annotate
  :general
  (leader-def
    "va" '(vc-annotate :wk "annotate")))

(use-package autorevert
  :custom
  (auto-revert-verbose nil)
  (global-auto-revert-non-file-buffers t)

  :hook
  (emacs-startup . global-auto-revert-mode))

(use-package org-modern
  :load-path "/usr/local/pkgs/emacs-pkgs/org-modern"

  :hook
  (org-mode . org-modern-mode))
