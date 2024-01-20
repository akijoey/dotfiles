;; init-window.el -*- lexical-binding: t -*-

;; split window
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

(provide 'init-window)
