;; init-dired.el -*- lexical-binding: t -*-

(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
    ("C-c C-e" . wdired-change-to-wdired-mode))
  :config
  (setq dired-dwim-target t)
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)
  (setq dired-listing-switches "-alh --group-directories-first"))

(use-package dired-aux
  :ensure nil
  :after dired
  :demand t
  :config
  (setq dired-vc-rename-file t)
  (setq dired-do-revert-buffer t)
  (setq dired-isearch-filenames 'dwim)
  (setq dired-create-destination-dirs 'ask))

(use-package dired-x
  :ensure nil
  :hook (dired-mode . dired-omit-mode)
  :config
  (setq dired-omit-verbose nil))

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
