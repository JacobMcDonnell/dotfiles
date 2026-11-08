;; -*- lexical-binding: t; -*-
(require 'comp)
(setq native-comp-driver-options
    (cons "-mmacosx-version-min=15" native-comp-driver-options))

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'set)
(require 'melpa-setup)
(require 'theme-setup)
(when (not (eq system-type 'windows-nt))
    (require 'vterm-setup))
(require 'evil-setup)
(require 'tree-sitter-setup)
;; (require 'magit-setup)
;; (when (eq (getenv "EMACS_IGNORE_LSP") nil)
;;     (require 'lsp-setup))

