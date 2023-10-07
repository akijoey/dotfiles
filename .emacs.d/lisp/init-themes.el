;; init-themes.el -*- lexical-binding: t -*-

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

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
