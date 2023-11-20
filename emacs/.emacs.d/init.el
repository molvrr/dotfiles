(add-to-list 'image-types 'svg) ; remover após emacs 29 (setq scroll-step 1)
(setq
 auto-save-default nil
 auto-window-vscroll nil
 backup-inhibited t
 completion-auto-help t
 create-lockfiles nil
 custom-file (expand-file-name "custom.el" user-emacs-directory)
 display-line-numbers-type 'relative
 eldoc-echo-area-use-multiline-p nil
 inhibit-startup-screen t
 make-backup-files nil
 org-agenda-files '("~/notes/agenda.org")
 org-confirm-babel-evaluate nil
 org-hide-emphasis-markers t
 org-return-follows-link t
 org-roam-directory "~/notes"
 org-src-tab-acts-natively t
 ring-bell-function (lambda ())
 default-input-method "portuguese-prefix"
 scroll-conservatively 10000
 shell-file-name "/run/current-system/sw/bin/bash"
 straight-use-package-by-default t
 ;; ido-everywhere t
 ;; ido-enable-flex-matching t
 word-wrap t)

(setq-default
 display-line-numbers-width 3
 straight-use-package-by-default t
 truncate-lines t
 tab-width 2)

;; (ido-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(electric-pair-mode 1)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
(savehist-mode)
(auto-revert-mode)
(global-hl-line-mode)

(load custom-file t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package evil
  :init
  (setq evil-kill-on-visual-paste nil)
  (setq evil-search-module 'evil-search)
  (setq evil-vplist-window-right t)
  (setq evil-undo-system 'undo-redo)
  (setq evil-want-keybinding nil))

;; (use-package undo-fu)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package magit)

(use-package flycheck
  :init (global-flycheck-mode)
	:custom (flycheck-display-errors-function nil))

(use-package flycheck-eglot
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))
(use-package counsel)
(use-package typescript-mode
	:custom
	(typescript-indent-level 2))

(define-key evil-normal-state-map (kbd "<SPC>pf") 'projectile-find-file)
(define-key evil-normal-state-map (kbd "<SPC>p/") 'projectile-ripgrep)

(use-package ripgrep)
(use-package haskell-mode)
(use-package nix-mode)
(use-package caml)
(use-package nix-modeline)
(use-package monkeytype)
(use-package typst-mode)
(use-package ob-typescript)
(use-package tuareg)
(use-package lua-mode)

(setq org-babel-load-languages
      '((haskell . t)
	(typescript . t)
	(lua . t)
	(ocaml . t)
	(ruby . t)))

(use-package docker)
(use-package docker-compose-mode)
(use-package dockerfile-mode)

(defun org-roam-node-extract
    ()
  (interactive)
  (progn
    (kill-region (point) (mark))
    (org-roam-node-find)
    (yank)))

(use-package org-roam
  :config
  (org-roam-db-autosync-mode)
  :bind
  (("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)))

(add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c n x") #'org-roam-node-extract)))

(use-package org)

(use-package ox-gfm)

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package which-key
  :config
  (which-key-mode))

(use-package osm
  :bind ("C-c m" . osm-prefix-map) ;; Alternative: `osm-home'

  :custom
  ;; Take a look at the customization group `osm' for more options.
  (osm-server 'default) ;; Configure the tile server
  (osm-copyright t)     ;; Display the copyright information

  :init
  ;; Load Org link support
  (with-eval-after-load 'org
    (require 'osm-ol)))

(use-package vertico
	:functions vertico-mode
	:custom
	(vertico-cycle t)
	(vertico-count 5)
  :init
  (vertico-mode))

(use-package consult)

(use-package embark
  :bind(("C-." . embark-act)
 	("C-;" . embark-dwim)
 	("C-h B" . embark-bindings))
  :config
  (add-to-list 'display-buffer-alist
 	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
 		 nil
 		 (window-parameters (mode-line-format . none)))))

(use-package marginalia
	:functions marginalia-mode
  :init
  (marginalia-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
 	completion-category-defaults nil
 	completion-category-overrides '((file (styles . (partial-completion))))))

(use-package corfu
  :init
  (global-corfu-mode)
  (setq corfu-popupinfo-delay 0.2)
  (corfu-popupinfo-mode)
  :straight (:files (:defaults "extensions/*"))
  :custom
  (corfu-auto t)
  :bind
  (:map corfu-map
 	("TAB" . corfu-next)
 	([tab] . corfu-next)
 	("S-TAB" . corfu-previous)
 	([backtab] . corfu-previous)))

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package eglot)

(use-package doom-themes
  :config
	(let ((hour (caddr (decode-time))))
		(cond
		 ((< hour 6) (load-theme 'doom-gruvbox t))
		 ((>= hour 17) (load-theme 'doom-gruvbox t))
		 (t (load-theme 'doom-homage-white t)))))

(defun page-title (url)
	"URL meh."
	(interactive)
	(call-process "curl" nil "*beep*" nil "-s" url)
	(let ((result))
		(with-current-buffer "*beep*"
			(setf result (caddr (assoc 'title (dom-by-tag (libxml-parse-html-region (point-min) (point-max)) 'title))))
			(kill-current-buffer))
		result))

(defun org-insert-url-with-title ()
	"Insert URL with title."
	(interactive)
	(let* ((url (read-string "URL: "))(title (page-title url)))
		(org-insert-link nil url title)))

(use-package org-roam-ui)
(use-package rg)
(use-package sly)
(use-package elm-mode)
(use-package direnv
	:config
	(direnv-mode))

(add-hook 'elm-mode-hook (lambda ()
													 (add-hook 'before-save-hook #'elm-format-buffer nil t)))

(add-hook 'tuareg-mode-hook (lambda ()
													 (add-hook 'before-save-hook #'eglot-format nil t)))


(set-face-attribute 'org-level-1 nil :height 250)
(set-face-attribute 'org-level-2 nil :height 150)
(set-face-attribute 'org-document-title nil :height 300)

(use-package markdown-mode)
(use-package dune)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "C-c C-c") 'compile)
(global-set-key (kbd "C-c C-r") 'recompile)

(defun my-ansi-color (&optional beg end)
  "Interpret ANSI color esacape sequence by colorifying cotent.
Operate on selected region on whole buffer."
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (point-min) (point-max))))
  (ansi-color-apply-on-region beg end))

(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))

(use-package clang-format)
(use-package steam
	:custom
	(steam-username "molvr"))

(use-package doom-modeline
	:config
	(doom-modeline-mode)
	:custom
	(doom-modeline-buffer-file-name-style 'relative-to-project))

(use-package clojure-mode)
(use-package cider)
(use-package rust-mode)
(use-package lean4-mode
	:straight (lean4-mode
						 :type git
						 :host github
						 :repo "leanprover/lean4-mode"
						 :files ("*.el" "data"))
	:commands (lean4-mode))

(use-package ruby-mode)
(use-package parinfer)
(use-package restclient :config (use-package restclient-jq))
(use-package elixir-mode)
;; (use-package moldable-emacs
;; 	:straight (moldable-emacs :type git :host github :repo "ag91/moldable-emacs")
;; 	:load-path "~/.emacs.d/lisp/moldable-emacs/"
;; 	:config
;; 	(me-setup-molds))
(use-package calibredb
	:config
	(setq calibredb-root-dir "/mnt/Arquivos/Mateus/Calibre")
	(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir)))

(use-package lispy)
(use-package fennel-mode)
