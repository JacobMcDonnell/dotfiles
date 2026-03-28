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
(cond ((not (eq system-type 'windows-nt))
       (define-key evil-normal-state-map (kbd "<leader>t") 'vterm))
      (t (define-key evil-normal-state-map (kbd "<leader>t") 'ansi-term)))
(define-key evil-normal-state-map (kbd "<leader>ff") 'find-file)
(define-key evil-normal-state-map (kbd "<leader>pv") 'dired)
(define-key evil-normal-state-map (kbd "<leader>c") 'shell-command)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)

(provide 'evil-setup)

