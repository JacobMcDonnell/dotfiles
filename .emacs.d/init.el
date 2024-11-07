(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'naysayer t)

;; window
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'default-frame-alist (cons 'width 120))
(add-to-list 'default-frame-alist (cons 'height 200))
(tool-bar-mode -1)

;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;; Relative Line Numbers
(display-line-numbers-mode)
(setq-default display-line-numbers 'relative)

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
			 '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
	(package-refresh-contents))

;; Download Evil
(unless (package-installed-p 'evil)
	(package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

