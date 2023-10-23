;; init-prog.el -*- lexical-binding: t -*-

;; prog mode
(add-hook 'prog-mode-hook (lambda ()
  (display-line-numbers-mode)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package paren
  :hook (prog-mode . show-paren-mode)
  :config
  (setq show-paren-when-point-inside-paren t)
  (setq show-paren-delay 0))

(use-package lsp-mode
  :hook
  (prog-mode . (lambda ()
    (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'makefile-mode)
      (lsp-deferred))))
  (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs
  :after (lsp-mode treemacs)
  :demand t
  :config
  (lsp-treemacs-sync-mode))

(use-package lsp-ivy)

(use-package dap-mode)

(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(use-package typescript-mode)
(use-package json-mode)
(use-package rust-mode)
(use-package php-mode)
(use-package go-mode)

(provide 'init-prog)
