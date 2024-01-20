;; init-basic.el -*- lexical-binding: t -*-

;; set variables
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; after init
(add-hook 'after-init-hook (lambda ()
  (global-auto-revert-mode)
  (auto-save-visited-mode)
  (delete-selection-mode)
  (column-number-mode)
  (electric-pair-mode)))

;; enhance ability
(when (executable-find "ag")
  (use-package ag))

(when (executable-find "rg")
  (use-package rg
    :hook (after-init . rg-enable-default-bindings)))

(use-package wgrep
  :config
  (setq wgrep-auto-save-buffer t)
  (setq wgrep-change-readonly-file t))

(use-package editorconfig
  :hook (after-init . editorconfig-mode))

(use-package which-key
  :hook (after-init . which-key-mode))

(use-package recentf
  :hook (after-init . recentf-mode)
  :bind ("C-c r" . recentf-open))

(use-package proced
  :ensure nil
  :init
  (setq proced-auto-update-flag t)
  (setq proced-auto-update-interval 3))

(use-package disk-usage)
(use-package memory-usage)

(provide 'init-basic)
