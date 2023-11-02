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

(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(use-package dap-mode
  :hook (prog-mode . dap-auto-configure-mode))

(use-package typescript-mode)
(use-package json-mode)
(use-package rust-mode)
(use-package php-mode)
(use-package go-mode)
(use-package protobuf-mode)
(use-package web-mode
  :mode ("\\.vue\\'"))

(use-package markdown-mode)
(use-package yaml-mode)

(provide 'init-prog)
