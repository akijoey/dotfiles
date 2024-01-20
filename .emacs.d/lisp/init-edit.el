;; init-edit.el -*- lexical-binding: t -*-

;; comment line
(global-set-key (kbd "C-x /") 'comment-line)

(use-package avy
  :bind ("C-x j" . avy-goto-char-timer))

(use-package move-text
  :bind
  ("M-<up>" . move-text-up)
  ("M-<down>" . move-text-down))

(use-package mwim
  :bind
  ([remap move-beginning-of-line] . mwim-beginning)
  ([remap move-end-of-line] . mwim-end))

(use-package undo-tree
  :hook (after-init . global-undo-tree-mode)
  :config
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-auto-save-history nil))

(use-package iedit
  :bind ("C-c i" . iedit-mode))

(use-package puni
  :hook (after-init . puni-global-mode))

(provide 'init-edit)
