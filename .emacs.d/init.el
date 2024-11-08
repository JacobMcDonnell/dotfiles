(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'naysayer t)

;; window
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'default-frame-alist (cons 'width 120))
(add-to-list 'default-frame-alist (cons 'height 200))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;; Font
(set-frame-font "Consolas 14" nil t)

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

;; Download Treesitter
(unless (package-installed-p 'tree-sitter)
	(package-install 'tree-sitter))

(unless (package-installed-p 'tree-sitter-langs)
	(package-install 'tree-sitter-langs))

;; Treesitter
(require 'tree-sitter)
(require 'tree-sitter-langs)

(global-tree-sitter-mode)
;;(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Download LSP-Mode
(unless (package-installed-p 'lsp-mode)
	(package-install 'lsp-mode))

;; Setup LSP-Mode
(require 'lsp-mode)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'go-mode #'lsp)

;; Company-Mode for LSP-Mode
(unless (package-installed-p 'company)
	(package-install 'company))

;; Setup LSP-Mode
(require 'company)
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2
