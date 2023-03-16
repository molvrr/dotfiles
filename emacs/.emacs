(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq display-line-numbers-type 'relative)
(setq auto-save-default nil)
(setq cider-repl-display-help-banner nil)
(setq truncate-lines t)
(setq hscroll-margin 2)
(setq hscroll-step 1)
(setq io-interpreter "wsl io")
(setq evil-ex-search-persistent-highlight nil)
(setq scroll-margin 0)
(setq scroll-step 1)
(setq create-lockfiles nil)
(setq make-backup-files nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (haskell . t)))
(global-display-line-numbers-mode)
(which-key-mode)

(defun org-mode-export-code-hook ()
  "Auto export tangled code."
  (when (eq major-mode 'org-mode)
    (org-babel-tangle)))

(add-hook 'after-save-hook 'org-mode-export-code-hook)

(tool-bar-mode 0)
(menu-bar-mode 0)

(defun open-settings ()
  (interactive)
  (find-file user-init-file))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load-theme 'gruvbox)

(setq evil-kill-on-visual-paste nil)
(setq evil-search-module 'evil-search)
(setq evil-vplist-window-right t)
(setq evil-undo-system 'undo-fu)
(evil-mode 1)
(global-evil-surround-mode 1)
(evil-set-initial-state 'package-menu-mode 'motion)

(require 'evil)
(require 'evil-surround)

(defun clj-eval-cnt
    ()
  (interactive)
  (progn
    (forward-char 1)
    (cider-eval-last-sexp)
    (insert " ; ")
    (insert-register cider-eval-register)))

(define-key evil-normal-state-map (kbd "<SPC>e") 'open-settings)
(define-key evil-normal-state-map (kbd "\\ece") 'clj-eval-cnt)

(setq require-final-newline nil)

(defalias 'match 'pcase)
(defalias 'defn 'defun)
(defalias 'head 'car)
(defalias 'tail 'cdr)
(defalias 'list? 'listp)

;(progn
;  (clojure-mode)
;  (cider-mode)
;  (cider-connect '(:host "172.26.46.202" :port "44319"))
;  (switch-to-buffer "*scratch*")
;  (delete-other-windows))

(defun -> (&rest body)
  (named-let app ((acc (car body))
		  (functions (cdr body)))
    (if functions
	(app (funcall (car functions) acc) (cdr functions))
      acc)))

; (debug-on-entry '->)

(defvar configs
  '((name "Mateus")
    (age 23)))

(defun set-up
    (cfgs)
  (seq-do
   (lambda (x) (set (car x) (car (cdr x))))
   cfgs))

(set-up configs)
