;; init-themes.el -*- lexical-binding: t -*-

(use-package doom-themes
  :demand t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))
  :config
  (setq doom-modeline-icon nil)

(provide 'init-themes)
