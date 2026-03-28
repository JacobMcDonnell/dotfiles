;; Set ~/.cache/emacs-backup as the backup directory instead of the current
;; working directory.
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

(provide 'set)
