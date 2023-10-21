;; init-dashboard.el -*- lexical-binding: t -*-

(use-package dashboard
  :demand t
  :config
  (setq dashboard-banner-logo-title "Good Luck, Have Fun!")
  (setq dashboard-startup-banner
    (expand-file-name "banner.txt" user-emacs-directory))
  (setq dashboard-items
    '((recents . 5) (bookmarks . 5) (projects . 5)))
  (dashboard-setup-startup-hook))

(provide 'init-dashboard)
