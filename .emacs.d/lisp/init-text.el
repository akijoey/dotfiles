;; init-text.el -*- lexical-binding: t -*-

(setq org-directory
  (expand-directory-name "org" user-home-directory))

(use-package org
  :bind
  ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  :config
  (setq org-agenda-directory
    (expand-directory-name "agenda" org-directory))
  (setq org-agenda-files
    (directory-files-recursively org-agenda-directory "\\.org$")))

(use-package org-roam
  :after org
  :demand t
  :config
  (setq org-roam-directory
    (expand-directory-name "roam" org-directory)))

(use-package markdown-mode)
(use-package yaml-mode)

(provide 'init-text)
