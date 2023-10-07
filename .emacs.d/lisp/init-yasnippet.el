;; init-yasnippet.el -*- lexical-binding: t -*-

(use-package yasnippet
  :diminish yasnippet-mode
  :hook (after-init . yas-global-mode))

(use-package yasnippet-snippets)

(provide 'init-yasnippet)
