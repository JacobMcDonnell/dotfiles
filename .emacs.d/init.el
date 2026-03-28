(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'naysayer t)

(setq backup-directory-alist '(("." . "~/.cache/emacs-backup"))
    backup-by-copying t
    version-control t
    delete-old-versions t
    kept-new-versions 20
    kept-old-versions 5)

;; window
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq column-number-mode t)
(setopt display-fill-column-indicator-column 120)

;; Prevent Extraneous Tabs
(setq indent-tabs-mode nil)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

;; Font
(set-frame-font "JetBrains Mono 14" nil t)

;; Relative Line Numbers
(display-line-numbers-mode)
(setq-default display-line-numbers 'relative)

(defun remove-trailing-whitespace-before-save-hook ()
  (progn
    (if (not (string-match ".*makefile.*" (message "%s" major-mode)))
        (untabify (point-min) (point-max)))
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'remove-trailing-whitespace-before-save-hook)

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
    (package-refresh-contents))

(unless (package-installed-p 'acme-theme)
    (package-install 'acme-theme))

(use-package acme-theme
  :config
  (load-theme 'acme t))

(use-package vterm
    :ensure t)

(set-face-attribute 'vterm-color-black          nil :foreground "#171421" :background "#171421")
(set-face-attribute 'vterm-color-red            nil :foreground "#C01C28" :background "#C01C28")
(set-face-attribute 'vterm-color-green          nil :foreground "#26A269" :background "#26A269")
(set-face-attribute 'vterm-color-yellow         nil :foreground "#A2734C" :background "#A2734C")
(set-face-attribute 'vterm-color-blue           nil :foreground "#12488B" :background "#12488B")
(set-face-attribute 'vterm-color-magenta        nil :foreground "#A347BA" :background "#A347BA")
(set-face-attribute 'vterm-color-cyan           nil :foreground "#2AA1B3" :background "#2AA1B3")
(set-face-attribute 'vterm-color-white          nil :foreground "#D0CFCC" :background "#D0CFCC")
(set-face-attribute 'vterm-color-bright-black   nil :foreground "#5E5C64" :background "#5E5C64")
(set-face-attribute 'vterm-color-bright-red     nil :foreground "#F66151" :background "#F66151")
(set-face-attribute 'vterm-color-bright-green   nil :foreground "#33DA7A" :background "#33DA7A")
(set-face-attribute 'vterm-color-bright-yellow  nil :foreground "#E9AD0C" :background "#E9AD0C")
(set-face-attribute 'vterm-color-bright-blue    nil :foreground "#2A7BDE" :background "#2A7BDE")
(set-face-attribute 'vterm-color-bright-magenta nil :foreground "#C061CB" :background "#C061CB")
(set-face-attribute 'vterm-color-bright-cyan    nil :foreground "#33C7DE" :background "#33C7DE")
(set-face-attribute 'vterm-color-bright-white   nil :foreground "#FFFFFF" :background "#FFFFFF")

(unless (package-installed-p 'magit)
  (package-install 'magit))

;; Download Evil
(unless (package-installed-p 'evil)
    (package-install 'evil))

(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))

(setq evil-want-keybinding nil)

;; Enable Evil
(use-package evil
    :init      ;; tweak evil's configuration before loading it
    (setq evil-want-C-u-scroll t
          evil-want-keybinding nil
          evil-vsplit-window-right t
          evil-split-window-below t)
    (evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(evil-set-leader 'normal (kbd "SPC"))
(define-key evil-normal-state-map (kbd "<leader>w") 'save-buffer)
(define-key evil-normal-state-map (kbd "<leader>%") 'split-window-right)
(define-key evil-normal-state-map (kbd "<leader>\"") 'split-window-below)
(define-key evil-normal-state-map (kbd "<leader>t") 'vterm)
(define-key evil-normal-state-map (kbd "<leader>ff") 'find-file)
(define-key evil-normal-state-map (kbd "<leader>pv") 'dired)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)

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
(add-hook 'elisp-mode-hook #'lsp)

;; Company-Mode for LSP-Mode
(unless (package-installed-p 'company)
    (package-install 'company))

;; Setup LSP-Mode
;;(require 'company)
;;(setq company-minimum-prefix-length 1
;;      company-idle-delay 0.0) ;; default is 0.2
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(acme-theme company evil-collection lsp-mode magit tree-sitter-langs
                vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
