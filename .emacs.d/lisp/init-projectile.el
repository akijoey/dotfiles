;; init-projectile.el -*- lexical-binding: t -*-

(use-package eglot
  :hook (after-init . projectile-mode)
  :bind (:map projectile-mode-map
    ("s-p" . projectile-command-map)
    ("C-c p" . projectile-command-map)))

(provide 'init-projectile)
