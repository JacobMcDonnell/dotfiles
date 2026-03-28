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

;; Remove whitespace at the end of lines and change tabs to 4 spaces
(defun remove-trailing-whitespace-before-save-hook ()
  (progn
    (if (not (string-match ".*makefile.*" (message "%s" major-mode)))
        (untabify (point-min) (point-max)))
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'remove-trailing-whitespace-before-save-hook)

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'melpa-setup)
(require 'theme-setup)
(when (not (eq system-type 'windows-nt))
    (require 'vterm-setup))
(require 'evil-setup)
(require 'tree-sitter-setup)
(require 'magit-setup)
(require 'lsp-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
