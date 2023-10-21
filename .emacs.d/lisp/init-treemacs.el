;; init-treemacs.el -*- lexical-binding: t -*-

(use-package treemacs
  :bind (([f8] . treemacs)
    ("M-0" . treemacs-select-window)
    ("C-x t 1" . treemacs-delete-other-windows)
    ("C-x t t" . treemacs)
    ("C-x t b" . treemacs-bookmark)
    ("C-x t d" . treemacs-select-directory)
    ("C-x t C-t" . treemacs-find-file)
    ("C-x t M-t" . treemacs-find-tag))
  :config
  (setq treemacs-width 30)
  (setq treemacs-missing-project-action 'remove)

  ;; minor mode
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode 'always)
  (when treemacs-python-executable
    (treemacs-git-commit-diff-mode t))
  (pcase
    (cons
      (not (null (executable-find "git")))
      (not (null treemacs-python-executable)))
    (`(t . t)
      (treemacs-git-mode 'deferred))
    (`(t . _)
      (treemacs-git-mode 'simple))))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :demand t)

(use-package treemacs-magit
  :after (treemacs magit)
  :demand t)

(use-package treemacs-persp
  :after (treemacs persp-mode)
  :demand t)

(provide 'init-treemacs)
