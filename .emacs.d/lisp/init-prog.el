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

(use-package eglot
  :hook (prog-mode . (lambda ()
    (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'makefile-mode)
      (eglot-ensure)))))

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :bind 
  ("M-n" . flymake-goto-next-error)
  ("M-p" . flymake-goto-prev-error))

(use-package typescript-mode)
(use-package json-mode)
(use-package rust-mode)
(use-package php-mode)
(use-package go-mode)

(provide 'init-prog)
