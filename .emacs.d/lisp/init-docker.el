;; -*- lexical-binding: t -*-

;; init-docker.el

(use-package docker
  :bind ("C-c d" . docker))

(use-package dockerfile-mode)

(provide 'init-docker)
