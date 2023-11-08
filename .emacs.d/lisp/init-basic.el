;; init-basic.el -*- lexical-binding: t -*-

;; set variables
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; key bindings
(global-set-key (kbd "C-x /") 'comment-line)

;; after init
(add-hook 'after-init-hook (lambda ()
  (global-auto-revert-mode)
  (auto-save-visited-mode)
  (delete-selection-mode)
  (column-number-mode)
  (electric-pair-mode)))

;; enhance ability
(use-package ag)

(use-package avy
  :bind ("C-x j" . avy-goto-char-timer))

(use-package ace-window
  :bind ("C-x o" . ace-window))

(use-package windmove
  :bind
  ("C-c w <left>" . windmove-left)
  ("C-c w <right>" . windmove-right)
  ("C-c w <up>" . windmove-up)
  ("C-c w <down>" . windmove-down))

(use-package move-text
  :bind
  ("M-<up>" . move-text-up)
  ("M-<down>" . move-text-down))

(use-package mwim
  :bind
  ([remap move-beginning-of-line] . mwim-beginning)
  ([remap move-end-of-line] . mwim-end))

(use-package which-key
  :hook (after-init . which-key-mode))

(use-package undo-tree
  :hook (after-init . global-undo-tree-mode)
  :config
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-auto-save-history nil))

(use-package iedit
  :bind ("C-c i" . iedit-mode))

(use-package recentf
  :hook (after-init . recentf-mode)
  :bind ("C-c r" . recentf-open))

(use-package editorconfig
  :hook (after-init . editorconfig-mode))

(provide 'init-basic)
