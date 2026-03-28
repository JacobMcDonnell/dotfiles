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

(provide 'lsp-setup)

