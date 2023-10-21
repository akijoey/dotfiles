;; init-counsel.el -*- lexical-binding: t -*-

(use-package amx
  :hook (after-init . amx-mode))

(use-package avy
  :bind ("C-x C-a" . avy-goto-char-timer))

(use-package ivy
  :hook (after-init . ivy-mode)
  :bind ("C-c C-r" . ivy-resume)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package ivy-rich
  :after ivy
  :demand t
  :config
  (ivy-rich-mode))

(use-package swiper
  :bind ("C-s" . swiper))

(use-package counsel
  :hook (after-init . counsel-mode))

(use-package counsel-projectile
  :after (counsel projectile)
  :demand t
  :config
  (counsel-projectile-mode))

(provide 'init-counsel)
