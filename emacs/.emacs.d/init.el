(tool-bar-mode 0)
(menu-bar-mode 0)
(electric-pair-mode 1)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)

(add-to-list 'image-types 'svg) ; remover após emacs 29 (setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(setq ring-bell-function (lambda ()))
(setq display-line-numbers-type 'relative)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq truncate-lines t)
(setq inhibit-startup-screen t)
(setq org-src-tab-acts-natively t)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq lsp-log-io nil)
(setq lsp-ui-sideline-show-code-actions nil)
(setq lsp-ui-sideline-show-hover nil)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-keymap-prefix "C-c l")
(setq lsp-restart 'auto-restart)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-headerline-breadcrumb-icons-enable nil)
(setq use-package-always-ensure t)
(setq org-roam-directory "~/notes")
(setq org-return-follows-link t)
(setq org-confirm-babel-evaluate nil)
(setq calibredb-root-dir "/media/mateus/Arquivos/Mateus/Calibre")
(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
(setq calibredb-library-alist '(("/media/mateus/Arquivos/Mateus/Calibre")))

(load custom-file t)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(defalias 'yes-or-no-p 'y-or-n-p)
(require 'use-package-ensure)

(use-package evil
  :init
  (setq evil-kill-on-visual-paste nil)
  (setq evil-search-module 'evil-search)
  (setq evil-vplist-window-right t)
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package undo-fu)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package gruvbox-theme
  :init
  (load-theme 'gruvbox t))

(use-package ivy
  :config
  (progn
    (ivy-mode)
    (setq projectile-completion-system 'ivy)))

(use-package helm-projectile)
(use-package magit)

(use-package lsp-mode
  :hook
  ((ruby-mode . lsp-deferred)
   (haskell-mode . lsp-deferred)
   (typescript-mode . lsp-deferred)))

(use-package flycheck
  :init (global-flycheck-mode))
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(use-package company)
(use-package counsel)
(use-package typescript-mode)

(defun boop ()
  (interactive)
  (find-file user-init-file))

(define-key evil-normal-state-map (kbd "<SPC>e") 'boop)
(define-key evil-normal-state-map (kbd "<SPC>pf") 'projectile-find-file)
(define-key evil-normal-state-map (kbd "<SPC>p/") 'projectile-ripgrep)

;(use-package exec-path-from-shell
;  :config
;  (exec-path-from-shell-initialize))

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
