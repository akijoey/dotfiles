;; init-dired.el -*- lexical-binding: t -*-

(use-package dired
  :bind (:map dired-mode-map
    ("C-c C-e" . wdired-change-to-wdired-mode))
  :config
  (setq dired-dwim-target t))

(use-package dired-rsync
  :bind (:map dired-mode-map
    ("C-c C-r" . dired-rsync)))

(use-package dired-git-info
  :bind (:map dired-mode-map
    (")" . dired-git-info-mode)))

(use-package diredfl
  :hook (dired-mode . diredfl-mode))

(when (executable-find "fd")
  (use-package fd-dired))

(provide 'init-dired)
