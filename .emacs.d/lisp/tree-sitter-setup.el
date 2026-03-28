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
