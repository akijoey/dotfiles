;; -*- lexical-binding: t -*-

;; init-themes.el

(use-package doom-themes
  :demand t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; mode line
(use-package doom-modeline
  :custom
  (doom-modeline-icon nil)
  :hook (after-init . doom-modeline-mode))

(provide 'init-themes)
