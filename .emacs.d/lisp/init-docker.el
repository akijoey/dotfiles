;; init-docker.el -*- lexical-binding: t -*-

(use-package docker
  :bind ("C-c D" . docker))

(use-package dockerfile-mode)

(provide 'init-docker)
