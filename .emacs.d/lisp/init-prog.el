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

(use-package web-mode
  :mode ("\\.vue\\'")
  :config
  (setq web-mode-script-padding 2)
  (setq web-mode-style-padding 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-auto-closing t))

(use-package js
  :config
  (setq js-indent-level 2))
(use-package json-mode)

(use-package typescript-mode
  :config
  (setq typescript-indent-level 2))

(use-package css-mode
  :config
  (setq css-indent-offset 2))

(use-package go-mode
  :hook
  ((go-mode go-dot-mod-mode go-dot-work-mode) . (lambda ()
    (setq indent-tabs-mode nil))))

(use-package rust-mode)
(use-package php-mode)
(use-package cmake-mode)
(use-package dart-mode)
(use-package lua-mode)
(use-package scala-mode)
(use-package swift-mode)
(use-package vimrc-mode)
(use-package protobuf-mode)
(use-package csv-mode)

(use-package markdown-mode)
(use-package yaml-mode)

(provide 'init-prog)
