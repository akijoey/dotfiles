;; init-projectile.el -*- lexical-binding: t -*-

(use-package projectile
  :hook (after-init . projectile-mode)
  :bind (:map projectile-mode-map
    ("s-p" . projectile-command-map)
    ("C-c p" . projectile-command-map))
  :config
  (setq projectile-sort-order 'recentf))

(provide 'init-projectile)
