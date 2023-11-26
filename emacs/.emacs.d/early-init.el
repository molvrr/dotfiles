(setq package-enable-at-startup nil)

(setq gc-cons-threshold most-positive-fixnum)

(add-hook 'emacs-startup-hook
					(lambda () (setq gc-cons-threshold (expt 2 23))))
