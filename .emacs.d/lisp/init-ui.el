;; -*- lexical-binding: t -*-

;; init-ui.el

(menu-bar-mode -1)

;; themes

(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; mode line

(use-package doom-modeline
  :custom
  (doom-modeline-icon nil)
  :hook (after-init . doom-modeline-mode))

(provide 'init-ui)
