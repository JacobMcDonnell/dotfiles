;; -*- lexical-binding: t; -*-

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

(provide 'tree-sitter-setup)

(use-package treesit
    :preface
    (dolist (mapping '((go-mode . go-ts-mode)))
        (add-to-list 'major-mode-remap-alist mapping))
    :init
    (add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
    (add-to-list 'auto-mode-alist '("/go\\.mod\\'" . go-mod-ts-mode)))

(setq treesit-language-source-alist
    '((typst "https://github.com/uben0/tree-sitter-typst")))

(dolist (lang treesit-language-source-alist)
    (unless (treesit-language-available-p (car lang))
        (treesit-install-language-grammar (car lang))))

(use-package typst-ts-mode
    :ensure t
    :custom
    ;; Optional: Starts a live preview session automatically when compiling
    (typst-ts-mode-watch-options "--open")
    :config
    ;; Automatically associate .typ files with the tree-sitter mode
    (add-to-list 'auto-mode-alist '("\\.typ\\'" . typst-ts-mode)))


