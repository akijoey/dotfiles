;; init-basic.el -*- lexical-binding: t -*-

;; set variables
(setq make-backup-files nil)
(setq auto-save-default nil)

;; after init
(add-hook 'after-init-hook (lambda ()
  (global-auto-revert-mode)
  (auto-save-visited-mode)
  (delete-selection-mode)
  (column-number-mode)
  (electric-pair-mode)))

;; helper
(use-package helpful
  :bind
  ("C-h f" . helpful-callable)
  ("C-h v" . helpful-variable)
  ("C-h k" . helpful-key)
  ("C-h x" . helpful-command))

(use-package windmove
  :bind
  ("C-c w <left>" . windmove-left)
  ("C-c w <right>" . windmove-right)
  ("C-c w <up>" . windmove-up)
  ("C-c w <down>" . windmove-down))

(use-package which-key
  :hook (after-init . which-key-mode))

(use-package move-text
  :bind
  ("M-<up>" . move-text-up)
  ("M-<down>" . move-text-down))

(provide 'init-basic)
