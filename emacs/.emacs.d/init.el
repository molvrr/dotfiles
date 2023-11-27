(setq
 auto-save-default nil
 auto-window-vscroll nil
 backup-inhibited t
 completion-auto-help t
 create-lockfiles nil
 custom-file (expand-file-name "custom.el" user-emacs-directory)
 default-input-method "portuguese-prefix"
 display-line-numbers-type 'relative
 eldoc-echo-area-use-multiline-p nil
 inhibit-startup-screen t
 make-backup-files nil
 ring-bell-function (lambda ())
 scroll-conservatively 10000
 straight-use-package-by-default t
 initial-scratch-message nil
 word-wrap t)

(setq-default
 display-line-numbers-width 3
 straight-use-package-by-default t
 truncate-lines t
 tab-width 2)

(windmove-default-keybindings)
(tool-bar-mode 0)
(menu-bar-mode 0)
(electric-pair-mode 1)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)
(savehist-mode)
(auto-revert-mode)
(global-hl-line-mode)

(global-set-key "ć" #'(lambda () (interactive (insert "ç"))))

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

(use-package benchmark-init
	:demand t
	:hook (after-init . benchmark-init/deactivate))

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package magit :defer t)
(use-package org
	:custom-face
	(org-document-title ((t (:height 300))))
	(org-level-1 ((t (:height 250))))
	(org-level-2 ((t (:height 150))))
	(org-link ((t (:underline nil)))))

(use-package flycheck
	:custom
	(flycheck-display-errors-function nil))

(use-package counsel)

(use-package typescript-mode
	:mode "\\.ts\\'"
	:custom
	(typescript-indent-level 2))

(use-package ripgrep)
(use-package haskell-mode :mode "\\.hs\\'")
(use-package nix-mode :mode "\\.nix\\'")
(use-package nix-modeline :defer t)
(use-package typst-mode :mode "\\.typ\\'")
(use-package ob-typescript)
(use-package ob-restclient :straight (ob-restclient :type git :host github :repo "alf/ob-restclient.el"))
(use-package tuareg :mode ("\\.ml\\'" . tuareg-mode))
(use-package lua-mode :mode "\\.lua\\'")
(use-package docker)
(use-package docker-compose-mode)
(use-package dockerfile-mode)

(defun org-roam-node-extract ()
	"Extracts region to node."
	(interactive)
	(progn
		(kill-region (point) (mark))
		(org-roam-node-find)
		(yank)))

(use-package
	org
	:custom (org-babel-load-languages
					 '((haskell . t)
						 (typescript . t)
						 (lua . t)
						 (restclient . t)
						 (ocaml . t)
						 (ruby . t)))
	(org-agenda-files
	 '("~notes/agenda.org"))
	(org-confirm-babel-evaluate
	 nil)
	(org-hide-emphasis-markers t)
	(org-return-follows-link t)
	(org-src-tab-acts-natively t))

(use-package
	org-roam
	:after org
	:config (org-roam-db-autosync-mode)
	:custom (org-roam-directory "~/notes")
	:bind (("C-c n f" . org-roam-node-find)
				 ("C-c n i" . org-roam-node-insert)))

(use-package ox-gfm)

(use-package which-key
  :config
  (which-key-mode))

(use-package osm
	:after org
	:straight (osm :type git :host github :repo "minad/osm")
  :bind ("C-c m" . osm-prefix-map)
  :custom
  (osm-server 'default)
  (osm-copyright t)
  :init
  (require 'osm-ol))

(use-package vertico
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

(use-package
	doom-themes
	:config (load-theme 'doom-xcode t)
	:custom-face
	(line-number ((t (:foreground "#9999aa" :bold nil :italic nil))))
	(line-number-current-line ((t (:italic nil)))))

(require 'dom)
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

(use-package org-roam-ui
	:after org-roam)
(use-package rg)
(use-package sly)
(use-package elm-mode)
(use-package direnv
	:config
	(direnv-mode))

(use-package markdown-mode)
(use-package dune)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "C-c C-c") 'compile)
(global-set-key (kbd "C-c C-r") 'recompile)

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
(use-package lispy
	:config
	(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1))))

(use-package fennel-mode)
(use-package
	org-fragtog
	:hook org)

(setq org-format-latex-options
			'(:foreground default
										:background default
										:scale 1.5
										:html-foreground "Black"
										:html-background "Transparent"
										:html-scale 1.0
										:matchers ("begin"
															 "$1"
															 "$"
															 "$$"
															 "\\("
															 "\\[")))

(use-package vterm)
(use-package multiple-cursors)
(use-package geiser-chez)

(defun copy-line ()
	"Kill current line."
	(interactive)
	(save-excursion
		(beginning-of-line)
		(set-mark-command nil)
		(end-of-line)
		(kill-ring-save
		 (region-beginning)
		 (region-end))))

(defun join-path (path filename)
	"Join PATH with FILENAME, adding a trailing slash in PATH if necessary."
	(concat path (if (string-match-p "/$" path) "" "/") filename))

(defun find-init-file ()
	"Find user init.el."
	(interactive)
	(when (not (string-equal
							(buffer-file-name)
							(file-truename user-init-file)))
		(find-file user-init-file)))

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package which-key
	:config (which-key-mode)
	:custom
	(which-key-idle-delay 0.3))

(use-package ace-window
	:bind
	("M-o" . ace-window))

(use-package flycheck-eglot)

(use-package devdocs)

(use-package dumb-jump)

(use-package quickrun)

(use-package org-ql)

(use-package org-roam-ql :after org-roam)

(use-package svg-tag-mode
	:custom
	(svg-tag-tags '((":TODO:" . ((lambda (tag) (svg-tag-make "TODO")))))))

(set-face-attribute 'link nil :underline nil)

(use-package evil
	:init
	(setq evil-want-keybinding nil)
	:config
	(evil-mode 1)
	:custom
	(evil-undo-system 'undo-redo))

(use-package evil-collection
	:after evil
	:config
	(evil-collection-init))

(use-package evil-surround
	:after evil
	:config
	(global-evil-surround-mode 1))
