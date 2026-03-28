(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'set)
(require 'melpa-setup)
(require 'theme-setup)
(when (not (eq system-type 'windows-nt))
    (require 'vterm-setup))
(require 'evil-setup)
(require 'tree-sitter-setup)
(require 'magit-setup)
(when (eq (getenv "EMACS_IGNORE_LSP") nil)
    (require 'lsp-setup))

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
