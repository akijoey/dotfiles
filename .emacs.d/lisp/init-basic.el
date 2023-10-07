;; init-basic.el -*- lexical-binding: t -*-

;; set variables
(setq make-backup-files nil)
(setq auto-save-default nil)

;; key bindings
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; after init
(add-hook 'after-init-hook (lambda ()
  (global-auto-revert-mode)
  (auto-save-visited-mode)
  (delete-selection-mode)
  (column-number-mode)
  (electric-pair-mode)))

;; prog mode
(add-hook 'prog-mode-hook (lambda ()
  (display-line-numbers-mode)))

;; helper
(use-package which-key
  :hook (after-init . which-key-mode))

(provide 'init-basic)
