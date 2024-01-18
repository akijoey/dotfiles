;; init-basic.el -*- lexical-binding: t -*-

;; set variables
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; interactive function
(defun windmove-split-right ()
  "Split window horizontally and move right"
  (interactive)
  (split-window-right)
  (windmove-right))

(defun windmove-split-down ()
  "Split window vertically and move down"
  (interactive)
  (split-window-below)
  (windmove-down))

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
(when (executable-find "ag")
  (use-package ag))

(when (executable-find "rg")
  (use-package rg
    :hook (after-init . rg-enable-default-bindings)))

(use-package avy
  :bind ("C-x j" . avy-goto-char-timer))

(use-package ace-window
  :bind ("C-x o" . ace-window))

(use-package windmove
  :bind
  ("C-c w <left>" . windmove-left)
  ("C-c w <right>" . windmove-right)
  ("C-c w <up>" . windmove-up)
  ("C-c w <down>" . windmove-down)
  ("C-c w |" . windmove-split-right)
  ("C-c w -" . windmove-split-down))

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

(use-package recentf
  :hook (after-init . recentf-mode)
  :bind ("C-c r" . recentf-open))

(use-package iedit
  :bind ("C-c i" . iedit-mode))

(use-package editorconfig
  :hook (after-init . editorconfig-mode))

(use-package puni
  :hook (after-init . puni-global-mode))

(use-package wgrep
  :config
  (setq wgrep-auto-save-buffer t)
  (setq wgrep-change-readonly-file t))

(use-package proced
  :ensure nil
  :init
  (setq proced-auto-update-flag t)
  (setq proced-auto-update-interval 3))

(use-package disk-usage)
(use-package memory-usage)

(provide 'init-basic)
