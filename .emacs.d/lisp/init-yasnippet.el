;; -*- lexical-binding: t -*-

;; init-yasnippet.el

(use-package yasnippet
  :diminish yas-minor-mode
  :hook (after-init . yas-global-mode))

(use-package yasnippet-snippets)

(provide 'init-yasnippet)
