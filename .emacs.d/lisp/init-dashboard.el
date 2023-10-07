;; init-dashboard.el -*- lexical-binding: t -*-

(use-package dashboard
  :demand t
  :config
  (setq dashboard-projects-backend 'projectile)
  (dashboard-setup-startup-hook))

(provide 'init-dashboard)
