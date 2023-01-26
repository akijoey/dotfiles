;; init-yasnippet.el -*- lexical-binding: t -*-

(use-package yasnippet
  :diminish yas-minor-mode
  :hook (after-init . yas-global-mode))

(use-package yasnippet-snippets)

(provide 'init-yasnippet)
