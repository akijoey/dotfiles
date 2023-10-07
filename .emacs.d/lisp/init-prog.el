;; init-prog.el -*- lexical-binding: t -*-

(use-package eglot
  :hook (prog-mode . eglot-ensure))

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :bind (("M-n" . #'flymake-goto-next-error)
	  ("M-p" . #'flymake-goto-prev-error)))

(use-package typescript-mode)
(use-package json-mode)

(provide 'init-prog)
