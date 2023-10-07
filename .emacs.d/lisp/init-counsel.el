;; init-counsel.el -*- lexical-binding: t -*-

(use-package counsel
  :hook (after-init . counsel-mode))

(use-package swiper
  :bind ("C-s" . swiper))

(use-package ivy
  :hook (after-init . ivy-mode)
  :bind ("C-c C-r" . ivy-resume)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package counsel-projectile
  :after projectile
  :hook (after-init . counsel-projectile-mode))

(provide 'init-counsel)
