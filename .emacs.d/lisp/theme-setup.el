(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'naysayer t)

(unless (package-installed-p 'acme-theme)
    (package-install 'acme-theme))

(use-package acme-theme
  :config
  (load-theme 'acme t))

(provide 'theme-setup)
